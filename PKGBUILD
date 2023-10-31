# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=flutter-engine
pkgver=3.13.9
pkgrel=2
pkgdesc='Engine for flutter applications.'
url='https://github.com/flutter/engine'
arch=('x86_64')
license=('BSD')
depends=(
	'glibc'
	'cmake'
	'ninja'
	'git'
	'clang'
	'python'
	'unzip'
	'gtk3')
makedepends=(
	'gn'
	'lld'
	'llvm'
	'python-httplib2'
	'python-six'
	'git'
	'cmake'
	'ninja'
	'clang'
	'unzip'
)
source=(
	"flutter-engine::git+https://github.com/flutter/engine.git#tag=${pkgver}"
	"git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
	'flutter-engine-prepare.sh'
	'flutter-engine-build.sh')
	# 'git+https://github.com/emscripten-core/emsdk.git#tag=3.1.44'
sha256sums=('SKIP'
            'SKIP'
            '9d7f60edd2cda6b2f11153aec21356ede86216b11a694305a403da8814208f34'
            'd2349741e01027eee906bb01ab4def7ad9ecea35864f110c9572e6246f820e1b')

_srcdir="${pkgname}"

_ln() { rm -rf "$2" && ln -sf "$1" "$2"; }

_setup_env() {
	export \
		PATH+=":${srcdir}/depot_tools" \
		DEPOT_TOOLS_UPDATE=0 \
		VPYTHON_BYPASS='manually managed python not supported by chrome operations'
}

prepare() {
	cat >.gclient <<EOF
solutions = [
	{
		"name": "src/flutter",
		"url": "file://${srcdir}/${_srcdir}@${pkgver}",
		"managed": False,
		"custom_deps": {},
		"custom_vars": {}
	}
]
EOF
	
	_setup_env
	
	#--nohooks \
	gclient.py sync -D -R \
		--with_branch_heads \
		--with_tags \
		--output-json='gclient-sync.json' \
		--shallow
	
	cd 'src'
	
	sed -i 's|prefix = rebased_clang_dir|prefix= ""|g' 'build/toolchain/linux/BUILD.gn' # use system clang
	sed -i 's|}/|}|g' 'build/toolchain/linux/BUILD.gn' # use system clang
	sed -i 's|rebase|#|g' 'build/toolchain/linux/BUILD.gn'
	
	sed -i 's|$wayland_dir|//third_party/angle/third_party/wayland|' \
		'third_party/angle/BUILD.gn' \
		'third_party/angle/src/common/vulkan/BUILD.gn' \
		'third_party/angle/src/third_party/volk/BUILD.gn'
	
	sed -i 's|import("//build/config/chromecast_build.gni")||' 'third_party/angle/src/tests/BUILD.gn'
	sed -i '/-Wno-deprecated-literal-operator/d' 'build/config/compiler/BUILD.gn'
	sed -i '/G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoLayout, g_object_unref)/d' 'flutter/shell/platform/linux/fl_accessible_text_field.cc'
	
	cat > 'third_party/dart/build/dart/prebuilt_dart_sdk.gni' <<EOF
import("../executable_suffix.gni")
_dart_root = rebase_path("../..")
#_prebuilt_dart_exe = ""
#_prebuilt_dart_exe_trial = ""
prebuilt_dart_exe_works = true
EOF
	
	#_ln "${srcdir}/emsdk" 'buildtools/emsdk'
}

build() {
	cd 'src'
	
	_setup_env
	
	gn gen --no-prebuilt-dart-sdk -qv 'out/host_arch_release' --args='
target_os = "linux"
host_cpu = "x64"
target_cpu = "x64"
dart_use_crashpad = false
dart_use_fallback_root_certificates = true
dart_use_compressed_pointers = true
dart_vm_code_coverage = false
dart_debug = false
dart_runtime_mode = "release"
is_debug = false
exclude_kernel_service = false
is_clang = true
skia_use_piex = false
target_sysroot = "/"
verify_sdk_hash = false
enable_unittests = false
flutter_runtime_mode = "release"
'
	
	sed -i 's|ldflags}|ldflags} -fuse-ld=lld|g' 'out/host_arch_release/toolchain.ninja' # use system ldd
	ninja -v -C 'out/host_arch_release'
	
	#export PATH+=":${srcdir}/src/flutter/lib/web_ui/dev"
	#felt build
}

package() {
	install -dm755 "${pkgdir}/opt/flutter-engine/out"
	rm -rf 'src/out/host_arch_release/'{gen,obj,lib.unstripped,exe.unstripped}
	cp -rf 'src/out/host_arch_release' "${pkgdir}/opt/flutter-engine/out"
	ln -s 'host_arch_release' "${pkgdir}/opt/flutter-engine/out/arch_release"
	ln -s 'host_arch_release' "${pkgdir}/opt/flutter-engine/out/host_release"
	
	#install -Dm755 'src/third_party/dart/sdk/bin/'{dart2js,dart2wasm} -t "${pkgdir}/opt/flutter-engine/out/host_arch_release/dart-sdk/bin"
	#cp -rf 'src/out/wasm_release' "${pkgdir}/opt/flutter-engine/out"
	#chmod 755 "${pkgdir}/opt/flutter-engine/out/wasm_release"
	#ln -s '../host_arch_release/dart-sdk' "${pkgdir}/opt/flutter-engine/out/wasm_release/dart-sdk"
	
	echo "${pkgver}" > "${pkgdir}/opt/flutter-engine/version"
	
	install -Dm755 'flutter-engine-prepare.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-prepare.sh"
	install -Dm755 'flutter-engine-build.sh' "${pkgdir}/opt/flutter-engine/pkgbuild-build.sh"
}
