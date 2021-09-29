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
: "${USE_SCCACHE:=0}"
##
## COMPONENT variable
## 0 -> build normal (with debug symbols)
## 1 -> release (default)
## 2 -> static
## 3 -> debug
## 4 -> release with custom cflags and system libs
: "${COMPONENT:=1}"

pkgname=brave
pkgver=1.30.87
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
             python-protobuf)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'sccache: For faster builds')
options=(!lto)
_launcher_ver=8
source=("brave-browser::git+https://github.com/brave/brave-browser.git#tag=v$pkgver"
        'chromium::git+https://github.com/chromium/chromium.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        "git+https://github.com/brave/brave-core.git#tag=v$pkgver"
        'git+https://github.com/brave/adblock-rust.git'
        brave-launcher
        brave-browser.desktop
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz"
        chromium-no-history.patch)
_arch_revision=d1911c4fdd73fad51b38c5ff29e2457975312f1b
_patches=(replace-blacklist-with-ignorelist.patch
	add-a-TODO-about-a-missing-pnacl-flag.patch
	use-ffile-compilation-dir.patch
	sql-make-VirtualCursor-standard-layout-type.patch
	unexpire-accelerated-video-decode-flag.patch
	use-oauth2-client-switches-as-default.patch)
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
            'ea3446500d22904493f41be69e54557e984a809213df56f3cdf63178d2afb49e'
            'd3344ba39b8c6ed202334ba7f441c70d81ddf8cdb15af1aa8c16e9a3a75fbb35'
            'd53da216538f2e741a6e048ed103964a91a98e9a3c10c27fdfa34d4692fdc455'
            '921010cd8fab5f30be76c68b68c9b39fac9e21f4c4133bb709879592bbdf606e'
            'dd317f85e5abfdcfc89c6f23f4c8edbcdebdd5e083dcec770e5da49ee647d150'
            '2a97b26c3d6821b15ef4ef1369905c6fa3e9c8da4877eb9af4361452a425290b'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  #[ffmpeg]=ffmpeg
  #[flac]=flac
  #[fontconfig]=fontconfig
  #[freetype]=freetype2
  #[harfbuzz-ng]=harfbuzz
  #[icu]=icu
  #[libdrm]=
  #[libjpeg]=libjpeg
  #[libpng]=libpng
  #[libvpx]=libvpx
  #[libwebp]=libwebp
  #[libxml]=libxml2
  #[libxslt]=libxslt
  #[opus]=opus
  #[re2]=re2
  #[snappy]=snappy
  #[zlib]=minizip
)
_unwanted_bundled_libs=(
	$(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)

# Add depends if user wants a release with custom cflags and system libs
if [ "$COMPONENT" = "4" ]; then

	depends+=('libpulse' 'pciutils')
	depends+=(${_system_libs[@]})
	makedepends+=('lld' 'libva' 'pipewire')
else
	makedepends+=('ncurses5-compat-libs')
fi

_msg() {
	printf " -> %s" "$@"
}

prepare() {
	cd brave-browser

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

	# checkout pgo profiles
	sed -i 's/"checkout_pgo_profiles": "%False%"/"checkout_pgo_profiles": "%True%"/g' src/brave/build/commands/lib/util.js

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

	# Use the --oauth2-client-id= and --oauth2-client-secret= switches for
	# setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
	# runtime -- this allows signing into Chromium without baked-in values
	patch -Np1 -i ../../use-oauth2-client-switches-as-default.patch

	# https://crbug.com/1207478
	patch -Np0 -i ../../unexpire-accelerated-video-decode-flag.patch

	# Revert transition to -fsanitize-ignorelist (needs newer clang)
	patch -Rp1 -i ../../replace-blacklist-with-ignorelist.patch

	# Revert addition of -ffile-compilation-dir= (needs newer clang)
	patch -Rp1 -i ../../add-a-TODO-about-a-missing-pnacl-flag.patch
	patch -Rp1 -i ../../use-ffile-compilation-dir.patch

	# https://chromium-review.googlesource.com/c/chromium/src/+/2862724
	patch -Np1 -i ../../sql-make-VirtualCursor-standard-layout-type.patch

	# Hacky patching
	sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn

	# don't overwrite makepkg.conf RUSTFLAGS
	sed -i 's/= args.rust_flags/+= args.rust_flags/g' brave/script/cargo.py

	if [ "$COMPONENT" = "4" ]; then
		_msg "Add patches for custom build"

		# Allow building against system libraries in official builds
		sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
			tools/generate_shim_headers/generate_shim_headers.py

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
		'disable_fieldtrial_testing_config=true'
		'blink_enable_generated_code_formatting=false'
		'ffmpeg_branding="Chrome"'
		'proprietary_codecs=true'
		'rtc_use_pipewire=true'
		'link_pulseaudio=true'
		'use_gnome_keyring=false'
		'use_sysroot=false'
		'use_custom_libcxx=true'
		'enable_hangout_services_extension=true'
		'enable_widevine=true'
		'enable_nacl=false'
		'target_sysroot=/'
		'use_vaapi=true'
		'is_clang=true'
		'is_official_build=true'
		'use_lld=true'
		'chrome_pgo_phase=2'
		)

		if [[ -n ${_system_libs[icu]+set} ]]; then
		_flags+=('icu_use_data_file=false')
		fi

		if check_option strip y; then
		_flags+=('symbol_level=0'
			'blink_symbol_level=0')
		fi

		# Filter known bad flags
		CFLAGS=${CFLAGS/Ofast/O3}
		CXXFLAGS=${CXXFLAGS/Ofast/O3}

		# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
		CFLAGS+='   -Wno-builtin-macro-redefined'
		CXXFLAGS+=' -Wno-builtin-macro-redefined'
		CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

		# Do not warn about unknown warning options
		CFLAGS+='   -Wno-unknown-warning-option'
		CXXFLAGS+=' -Wno-unknown-warning-option'

		npm_args+=(
		$(echo ${_flags[@]} | tr ' ' '\n' | sed -e 's/=/:/' -e 's/^/--gn=/')
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
		chrome_crashpad_handler \
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
