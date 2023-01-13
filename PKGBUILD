# Mantainer: Daniele Basso <d dot bass05 at proton dot me>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: T. Jameson Little <t.jameson.little at gmail dot com>
# Contributor: Usagi Ito <usagi@WonderRabbitProject.net>
# Contributor: siasia <http://pastebin.com/qsBEmNCw>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=dart-system
_pkgname=dart
pkgver=2.18.6
pkgrel=1
pkgdesc='The dart programming language SDK (Bug)'
arch=('x86_64')
url='https://www.dartlang.org/'
depends=()
license=('BSD')
makedepends=('setconf' 'clang' 'gn' 'ninja' 'dart' 'python')
source=(".gclient"
        "build-config-compiler-BUILD.gn.patch"
		"DEPS"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git")
sha512sums=('23d1fc8ab529a5a12894aed5ccfc2d511d02f3a484bd7ed634a69e0f52b22b4f8ac071bfe3c161f8b93e6cc8af932726dc76d05c96154ab5f5dde65ad55b78cf'
            'ad9753bc6a45ed2006f039c54fc0295f488532f8a205395921eaf2373c56d05c958efcdf33817d91d7e36e35733df57471762a126c09cf39292e6fe96069fc36'
            '600a9816bb7dbc100d3183e01125726e712041e707d8d046e60ad7dea62831c6e09a5f667a82be183ad8e6d25d307cd4c6f754bab7f165240e57c440252fd8eb'
            'SKIP')
provides=("dart" "dart-sdk")
conflicts=("dart" "dart-sdk")

prepare() {
  cd $srcdir
  sed -i "s|'error'|'debug'|g" depot_tools/gclient_scm.py
  export PATH="${srcdir}/depot_tools:$PATH"
  export DEPOT_TOOLS_UPDATE=0
  if [ ! -d sdk ]; then
    git clone --depth=1 --branch=$pkgver https://dart.googlesource.com/sdk.git
    cd sdk
  else
    cd sdk
    git checkout $pkgver
  fi
  cp ../DEPS .
  python ../depot_tools/gclient.py sync --no-history -nDv
}

build() {
  cd $srcdir/sdk/
  mkdir -p out
  if [ -f toolchain.ninja ]; then
    rm out/toolchain.ninja
  fi
  git checkout HEAD -- build/config/compiler/BUILD.gn
  git apply $srcdir/build-config-compiler-BUILD.gn.patch # fix system clang
  dart tools/generate_package_config.dart
  gn gen -qv out --args='target_os = "linux"
                        host_cpu = "x64"
                        target_cpu = "x64"
                        dart_target_arch = "x64"
                        dart_use_compressed_pointers = true
                        dart_use_crashpad = false
                        dart_snapshot_kind = "app-jit"
                        dart_use_fallback_root_certificates = true
                        bssl_use_clang_integrated_as = false
                        dart_use_tcmalloc = true
                        dart_use_mallinfo2 = false
                        is_debug = false
                        is_release = false
                        is_product = true
                        dart_debug = false
                        dart_runtime_mode = "release"
                        exclude_kernel_service = false
                        is_clang = true
                        dart_vm_code_coverage = false
                        is_asan = false
                        is_lsan = false
                        is_msan = false
                        is_tsan = false
                        is_ubsan = false
                        is_qemu = false
                        dart_platform_sdk = false
                        dart_stripped_binary = "exe.stripped/dart"
                        dart_precompiled_runtime_stripped_binary = "exe.stripped/dart_precompiled_runtime_product"
                        gen_snapshot_stripped_binary = "exe.stripped/gen_snapshot_product"
                        analyze_snapshot_binary = "exe.stripped/analyze_snapshot_product"
                        dart_use_debian_sysroot = false
                        use_goma = false
                        goma_dir = "None"
                        verify_sdk_hash = true'
  sed -i 's|.\.\/buildtools\/linux\-x64\/clang\/bin\/|\/usr\/bin\/|g' out/toolchain.ninja # use system clang
  sed -i 's|ldflags\}|ldflags\} \-fuse\-ld\=lld|g' out/toolchain.ninja # use system ldd
  ninja create_sdk -v -C out
}

package() {
  # cd to directory
  cd $srcdir/sdk/out/

  # Create directories
  install -d "$pkgdir"{"/opt/$_pkgname-sdk",/usr/{bin,"share/doc/$_pkgname"}}

  # Package the files
  cp -a "$_pkgname-sdk/"* "$pkgdir/opt/$_pkgname-sdk/"

  # Set up symbolic links for the executables
  for f in dart dartaotruntime; do
    ln -s "/opt/$_pkgname-sdk/bin/$f" "$pkgdir/usr/bin/$f"
  done

  # Package documentation
  install -Dm644 "$pkgdir/opt/$_pkgname-sdk/README" -t "$pkgdir/usr/share/doc/$_pkgname"

  # BSD License
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
