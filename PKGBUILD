# Maintainer: Caleb Maclennana <caleb@alerque.com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Jacek Szafarkiewicz <szafar@linux.pl>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

## General Brave build info
## https://github.com/brave/brave-browser/blob/master/README.md#clone-and-initialize-the-repo

## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example use: `USE_SCCACHE=1 COMPONENT=1 makepkg -sc`
##
## USE_SCCACHE variable
## sccache for faster builds - https://github.com/brave/brave-browser/wiki/sccache-for-faster-builds
## Valid numbers between: 0 and 1
## Default is: 0 => not use sccache
: "${USE_SCCACHE:-0}"
##
## COMPONENT variable
## 0 -> build normal (with debug symbols)
## 1 -> release (default)
## 2 -> static
## 3 -> debug
## 4 -> release with custom cflags and system libs
: "${COMPONENT:-1}"

pkgname=brave
pkgver=1.29.79
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=(x86_64)
url='https://www.brave.com/download'
license=(custom)
depends=(alsa-lib
         gtk3
         json-glib
         libva
         libxss
         nss
         ttf-font)
makedepends=(clang
             git
             glibc
             gperf
             icu
             java-runtime-headless
             llvm
             npm
             pipewire
             python
             python-protobuf
             python2)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'sccache: For faster builds')
_chromium_base_ver=93
_patchset=6
_patchset_name="chromium-$_chromium_base_ver-patchset-$_patchset"
_launcher_ver=8
source=("brave-browser::git+https://github.com/brave/brave-browser.git#tag=v$pkgver"
        'chromium::git+https://github.com/chromium/chromium.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        "git+https://github.com/brave/brave-core.git#tag=v$pkgver"
        'git+https://github.com/brave/adblock-rust.git'
        brave-launcher
        brave-browser.desktop
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz"
        "https://github.com/stha09/chromium-patches/releases/download/$_patchset_name/$_patchset_name.tar.xz"
        chromium-no-history.patch)
_arch_revision=4b878998bab64f599eb2dd14e27e7fe42f69a1f2
_patches=(extend-enable-accelerated-video-decode-flag.patch
         linux-sandbox-syscall-broker-use-struct-kernel_stat.patch
         linux-sandbox-fix-fstatat-crash.patch
         sql-make-VirtualCursor-standard-layout-type.patch
         chromium-freetype-2.11.patch)
for _patch in "${_patches[@]}"; do
  source+=("$_patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/$_arch_revision/chromium/trunk/$_patch")
done
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e4478c79e2eed500777117bb1d48f4be1866908dcda8d75003a5d055618dfdca'
            'fa6ed4341e5fc092703535b8becaa3743cb33c72f683ef450edd3ef66f70d42d'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            'a44ffd9e25fcbd8b3cc778871890e4da6fe12600ad549c807e1d03f61f0cdf73'
            'ea3446500d22904493f41be69e54557e984a809213df56f3cdf63178d2afb49e'
            '66db9132d6f5e06aa26e5de0924f814224a76a9bdf4b61afce161fb1d7643b22'
            '268e18ad56e5970157b51ec9fc8eb58ba93e313ea1e49c842a1ed0820d9c1fa3'
            '253348550d54b8ae317fd250f772f506d2bae49fb5dc75fe15d872ea3d0e04a5'
            'dd317f85e5abfdcfc89c6f23f4c8edbcdebdd5e083dcec770e5da49ee647d150'
            '7ef689cd6b2f85f2b76b2a10ecede003cfa0c2da15acc998ecbc445f2c95ced6')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [zlib]=minizip
)
_unwanted_bundled_libs=(
	"$(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')"
)

# Add depends if user wants a release with custom cflags and system libs
if [ "$COMPONENT" = "4" ]; then
	#  echo "Build with system libs is disabled for now" && exit 1
	brave_base_ver="$(echo "$pkgver" | cut -d . -f 1-2)"
	brave_patchset="1"
	brave_patchset_name="brave-$brave_base_ver-patches-$brave_patchset"
	source+=("https://gitlab.com/hadogenes/brave-patches/-/archive/$brave_patchset_name/brave-patches-$brave_patchset_name.zip")
	sha256sums+=("c63c8eeac709293991418a09ac7d8c0adde10c151495876794e025bd2b0fb8fe")

	depends+=('libpulse' 'pciutils')
	depends+=("${_system_libs[@]}")
	makedepends+=('lld' 'libva' 'pipewire' 'python2-xcb-proto')
else
	makedepends+=('ncurses5-compat-libs')
fi

_msg() {
	printf " -> %s" "$@"
}

prepare() {
	cd brave-browser

	# Hack to prioritize python2 in PATH
	mkdir -p "$srcdir/bin"
	ln -sf /usr/bin/python2 "$srcdir/bin/python"
	ln -sf /usr/bin/python2-config "$srcdir/bin/python-config"
	export PATH="$srcdir/bin:$PATH"

	_msg "Prepare the environment..."
	npm install
	patch -Np1 -i ../chromium-no-history.patch

	git submodule init
	git config submodule.chromium.url "$srcdir"/chromium
	git config submodule.brave-core.url "$srcdir"/brave
	git config submodule.depot_tools.url "$srcdir"/depot_tools
	git config submodule.adblock-rust.url "$srcdir"/adblock-rust
	git submodule update
	cp -rT "$srcdir"/chromium src
	cp -rT "$srcdir"/brave-core src/brave
	cp -r "$srcdir"/depot_tools src/brave/vendor/
	cp -rT "$srcdir"/adblock-rust src/components/adblock_rust_ffi

	_msg "Running \"npm run\""
	if [ -d src/out/Release ]; then
		npm run sync -- --force
	else
		npm run init
	fi

	_msg "Apply Chromium patches..."
	cd src/

	# https://crbug.com/893950
	sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
		third_party/blink/renderer/core/xml/*.cc \
		third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
		third_party/libxml/chromium/*.cc

	# Upstream fixes
	# patch -Np1 -i ../../extend-enable-accelerated-video-decode-flag.patch
	patch -Np1 -i ../../linux-sandbox-syscall-broker-use-struct-kernel_stat.patch
	patch -Np1 -i ../../linux-sandbox-fix-fstatat-crash.patch

	# https://chromium-review.googlesource.com/c/chromium/src/+/2862724
	patch -Np1 -i ../../sql-make-VirtualCursor-standard-layout-type.patch

	# Fix build with FreeType 2.11 (patch from Gentoo)
	# patch -Np1 -i ../../chromium-freetype-2.11.patch

	# Fixes for building with libstdc++ instead of libc++
	patch -Np1 -i ../../patches/chromium-90-ruy-include.patch

	# Hacky patching
	sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn

	# Allow building against system libraries in official builds
	if [ "$COMPONENT" = "4" ]; then
		sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
			tools/generate_shim_headers/generate_shim_headers.py

		_msg "Add patches for custom build"
		for _patch in "$srcdir/brave-patches-$brave_patchset_name"/*.patch; do
			patch -Np1 -i "$_patch"
		done

		# Remove bundled libraries for which we will use the system copies; this
		# *should* do what the remove_bundled_libraries.py script does, with the
		# added benefit of not having to list all the remaining libraries
		local _lib
		for _lib in "${_unwanted_bundled_libs[@]}"; do
		find "third_party/$_lib" -type f \
		\! -path "third_party/$_lib/chromium/*" \
		\! -path "third_party/$_lib/google/*" \
		\! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
		\! -regex '.*\.\(gn\|gni\|isolate\)' \
		-delete
		done

		./build/linux/unbundle/replace_gn_files.py \
		--system-libraries "${!_system_libs[@]}"
	fi
}

build() {
	cd "brave-browser"

	if check_buildoption ccache y; then
		# Avoid falling back to preprocessor mode when sources contain time macros
		export CCACHE_SLOPPINESS=time_macros
	fi

	export CC=clang
	export CXX=clang++
	export AR=llvm-ar
	export NM=llvm-nm

	# Hack to prioritize python2 in PATH
	mkdir -p "$srcdir/bin"
	ln -sf /usr/bin/python2 "$srcdir/bin/python"
	ln -sf /usr/bin/python2-config "$srcdir/bin/python-config"
	export PATH="$srcdir/bin:$PATH"

	if [ "$USE_SCCACHE" -eq "1" ]; then
		echo "sccache = /usr/bin/sccache" >> .npmrc
	fi

	echo 'brave_variations_server_url = https://variations.brave.com/seed' >> .npmrc
	echo 'brave_stats_updater_url = https://laptop-updates.brave.com' >> .npmrc
	echo 'brave_stats_api_key = fe033168-0ff8-4af6-9a7f-95e2cbfc' >> .npmrc
	echo 'brave_sync_endpoint = https://sync-v2.brave.com/v2' >> .npmrc
	echo "uphold_client_id = 6d8d9473ed20be627f71ed46e207f40c004c5b1a" >> .npmrc
	echo "uphold_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
	echo "uphold_staging_client_id = 4c2b665ca060d912fec5c735c734859a06118cc8" >> .npmrc
	echo "uphold_staging_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
	echo "gemini_api_url = https://api.gemini.com/v1" >> .npmrc
	echo "gemini_oauth_url = https://api.gemini.com/v1/oauth" >> .npmrc
	echo "gemini_wallet_client_id = 6d8d9473ed20be627f71ed46e207f40c004c5b1a" >> .npmrc
	echo "gemini_wallet_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc

	npm_args=()
	if [ "$COMPONENT" = "4" ]; then
		local _flags=(
		'custom_toolchain="//build/toolchain/linux/unbundle:default"'
		'host_toolchain="//build/toolchain/linux/unbundle:default"'
		'clang_use_chrome_plugins=false'
		'treat_warnings_as_errors=false'
		'fieldtrial_testing_like_official_build=true'
		'proprietary_codecs=true'
		'rtc_use_pipewire=true'
		'link_pulseaudio=true'
		'use_gnome_keyring=false'
		'use_sysroot=false'
		'use_custom_libcxx=false'
		'use_vaapi=true'
		'is_clang=true'
		)

		if [[ -n ${_system_libs[icu]+set} ]]; then
		_flags+=('icu_use_data_file=false')
		fi

		if check_option strip y; then
		_flags+=('symbol_level=0')
		fi

		# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
		CFLAGS+='   -Wno-builtin-macro-redefined'
		CXXFLAGS+=' -Wno-builtin-macro-redefined'
		CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

		# Do not warn about unknown warning options
		CFLAGS+='   -Wno-unknown-warning-option'
		CXXFLAGS+=' -Wno-unknown-warning-option'

		npm_args+=(
		"$(echo "${_flags[@]}" | tr ' ' '\n' | sed -e 's/=/:/' -e 's/^/--gn=/')"
		)
	fi

	## See explanation on top to select your build
	case $COMPONENT in
		0)
		_msg "Normal build (with debug)"
		npm run build
		;;
		2)
		_msg "Static build"
		npm run build -- Static
		;;
		3)
		_msg "Debug build"
		npm run build -- Debug
		;;
		4)
		_msg "Release custom build"
		npm run build Release -- "${npm_args[@]}"
		;;
		1|*)
		_msg "Release build"
		npm run build Release
		;;
	esac
}

package() {
	install -d -m0755 "$pkgdir/usr/lib/$pkgname/"{,swiftshader,locales,resources}

	# Copy necessary release files
	cd "brave-browser/src/out/Release"
	cp -a --reflink=auto \
		MEIPreload \
		brave \
		brave_*.pak \
		chrome_*.pak \
		resources.pak \
		v8_context_snapshot.bin \
		libGLESv2.so \
		libEGL.so \
		crashpad_handler \
		"$pkgdir/usr/lib/$pkgname/"
	cp -a --reflink=auto \
		swiftshader/libGLESv2.so \
		swiftshader/libEGL.so \
		"$pkgdir/usr/lib/$pkgname/swiftshader/"
	cp -a --reflink=auto \
		locales/*.pak \
		"$pkgdir/usr/lib/$pkgname/locales/"
	cp -a --reflink=auto \
		resources/brave_extension \
		resources/brave_rewards \
		"$pkgdir/usr/lib/$pkgname/resources/"

	if [ "$COMPONENT" != "4" ] || [[ -z ${_system_libs[icu]+set} ]]; then
		cp -a --reflink=auto \
		icudtl.dat \
		"$pkgdir/usr/lib/$pkgname/"
	fi

	cd "$srcdir"
	install -Dm0755 brave-launcher "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" brave-browser.desktop
	install -Dm0644 "brave-browser/src/brave/app/theme/brave/product_logo_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "brave-browser/LICENSE"
}
