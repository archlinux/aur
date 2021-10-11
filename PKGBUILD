# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Jacek Szafarkiewicz <szafar@linux.pl>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

##
## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example: env USE_SCCACHE=1 COMPONENT=1 NOCONFIRM_MODE=1 makepkg -sc
##
## sccache for faster builds - https://github.com/brave/brave-browser/wiki/sccache-for-faster-builds
## Valid numbers between: 0 and 1
## Default is: 0 => not use sccache
if [ -z ${USE_SCCACHE+x} ]; then
  USE_SCCACHE=0
fi
##
## COMPONENT variable
## 0 -> build normal (with debug symbols)
## 1 -> release (default)
## 2 -> static
## 3 -> debug
## 4 -> release with custom cflags and system libs
## https://github.com/brave/brave-browser/wiki#clone-and-initialize-the-repo
if [ -z ${COMPONENT+x} ]; then
  COMPONENT=1
fi
##
## noconfirm mode
## Valid numbers between: 0 and 1
## Default is: 1 => noconfirm mode
if [ -z ${USE_NOCONFIRM+x} ]; then
  NOCONFIRM_MODE=1
fi

pkgname=unbrave-git
_pkgname=unbrave
pkgver=r5046.f567e657
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64' 'x86_64_v3')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva' 'json-glib')
makedepends=('git' 'npm' 'python' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless' 'clang' 'pipewire')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'sccache: For faster builds')
chromium_base_ver="95"
patchset="2"
patchset_name="chromium-${chromium_base_ver}-patchset-${patchset}"
_ungoogled_patchset_url="https://raw.githubusercontent.com/Eloston/ungoogled-chromium/master/patches/extra"
_launcher_ver=8
source=("brave-browser::git+https://github.com/brave/brave-browser.git"
        "chromium::git+https://github.com/chromium/chromium.git"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "git+https://github.com/brave/brave-core.git"
        "git+https://github.com/brave/adblock-rust.git"
        'unbrave-launcher'
        'unbrave.desktop'
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz"
        "https://github.com/stha09/chromium-patches/releases/download/${patchset_name}/${patchset_name}.tar.xz"
        "${_ungoogled_patchset_url}/bromite/fingerprinting-flags-client-rects-and-measuretext.patch"
        "${_ungoogled_patchset_url}/bromite/flag-fingerprinting-canvas-image-data-noise.patch"
        "${_ungoogled_patchset_url}/bromite/flag-max-connections-per-host.patch"
        "${_ungoogled_patchset_url}/ungoogled-chromium/enable-default-prefetch-privacy-changes.patch"
        "${_ungoogled_patchset_url}/ungoogled-chromium/add-components-ungoogled.patch"
        "chromium-no-history.patch"
        "disable-brave-core-features.patch")
arch_revision=3cd421c2e8ea04eacf49253ea8b40957ef5d3524
Patches="
        sql-make-VirtualCursor-standard-layout-type.patch
        "
for arch_patch in $Patches
do
  source+=("${arch_patch}::https://raw.githubusercontent.com/archlinux/svntogit-packages/${arch_revision}/chromium/trunk/${arch_patch}")
done

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '12542a49b03db1878c41dc7e969ff9a00bece47713c564c3e1885aa2402eea23'
            '5b3acebaed783e5228a14b940c707233c4a3fc36c5572b23c86d52d33982e24c'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            '5796f54f53794dd859da43c60db97f76a941be334bc7365b9058582e192bda52'
            'ad51d77a47f94d5f00ea1ab19adf3f7478ac14d0d2499bd595f1d2f9a678e3e0'
            'e36f9c3f7f0d4e9ff6b459607c691c1a1b80e9f9d9bed994834547a564f6c3ad'
            'ca4230c12db9233198bfbedc06ec88197a865839512688c705a3e971905a3a4d'
            'c48fda92408927813f281ebf62e53bbe5c89273ef0660911c5289dbf31f194e4'
            'ba7085e85e3f212f50a9d04d721ef06ab2fefbeb115f72824b5ad3c1dd4144ac'
            'ea3446500d22904493f41be69e54557e984a809213df56f3cdf63178d2afb49e'
            '3c0fb3401f1d8a68d1b3361622dfafae310647a1a3912deb3cfa5b3e1f27173b'
            'dd317f85e5abfdcfc89c6f23f4c8edbcdebdd5e083dcec770e5da49ee647d150')

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
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)

# Add depends if user wants a release with custom cflags and system libs
if [ "$COMPONENT" = "4" ]; then
  #echo "Build with system libs is disabled for now" && exit 1
  brave_base_ver="$(echo $pkgver | cut -d . -f 1-2)"
  brave_patchset="1"
  brave_patchset_name="brave-${brave_base_ver}-patches-${brave_patchset}"
  source+=("https://gitlab.com/hadogenes/brave-patches/-/archive/${brave_patchset_name}/brave-patches-${brave_patchset_name}.zip")
  sha256sums+=("04a4f1e3c54b5f76873e9d178124a016028fae10374abb2b35bac822337d5dde")

  depends+=('libpulse' 'pciutils')
  depends+=(${_system_libs[@]})
  makedepends+=('lld' 'libva' 'pipewire' 'python2-xcb-proto')
else
  makedepends+=('ncurses5-compat-libs')
fi


pkgver() {
  cd "brave-browser"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "brave-browser"

  msg2 "Prepare the environment..."
  npm install
  patch -Np1 -i ../chromium-no-history.patch

  git submodule init
  git config submodule.chromium.url "${srcdir}"/chromium
  git config submodule.brave-core.url "${srcdir}"/brave
  git config submodule.depot_tools.url "${srcdir}"/depot_tools
  git config submodule.adblock-rust.url "${srcdir}"/adblock-rust
  git submodule update
  cp -rT "${srcdir}"/chromium src
  cp -rT "${srcdir}"/brave-core src/brave
  cp -r "${srcdir}"/depot_tools src/brave/vendor/
  cp -rT "${srcdir}"/adblock-rust src/components/adblock_rust_ffi

  msg2 "Running \"npm run\""
  if [ -d src/out/Release ]; then
    if [ "$NOCONFIRM_MODE" -eq "1" ]; then
      yes | npm run sync -- --force
    else
      npm run sync -- --force
    fi
  else
    if [ "$NOCONFIRM_MODE" -eq "1" ]; then
      yes | npm run init
    else
      npm run init
    fi
  fi

  msg2 "Apply Chromium patches..."
  cd src

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  # https://chromium-review.googlesource.com/c/chromium/src/+/2862724
  patch -Np1 -i ../../sql-make-VirtualCursor-standard-layout-type.patch

  # ungoogled-chromium patches
  #patch -Np1 -i ../../fingerprinting-flags-client-rects-and-measuretext.patch
  #patch -Np1 -i ../../flag-fingerprinting-canvas-image-data-noise.patch
  #patch -Np1 -i ../../flag-max-connections-per-host.patch
  patch -Np1 -i ../../add-components-ungoogled.patch
  patch -Np1 -i ../../enable-default-prefetch-privacy-changes.patch

  # Hacky patching
  sed -e 's/enable_distro_version_check = true/enable_distro_version_check = false/g' -i chrome/installer/linux/BUILD.gn

  # Allow building against system libraries in official builds
  if [ "$COMPONENT" = "4" ]; then
    sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
        tools/generate_shim_headers/generate_shim_headers.py

    msg2 "Add patches for custom build"
    for _patch in "$srcdir/brave-patches-$brave_patchset_name"/*.patch; do
        patch -Np1 -i "$_patch"
    done

    # Remove bundled libraries for which we will use the system copies; this
    # *should* do what the remove_bundled_libraries.py script does, with the
    # added benefit of not having to list all the remaining libraries
    local _lib
    for _lib in ${_unwanted_bundled_libs[@]}; do
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

  msg2 "Apply unbrave patch..."
  cd brave

  # Disables metrics and
  # some features of brave like brave_rewards, brave_sync, etc
  patch -Np1 -i ../../../disable-brave-core-features.patch
}

build() {
  cd "brave-browser"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  if [ "$USE_SCCACHE" -eq "1" ]; then
    echo "sccache = /usr/bin/sccache" >> .npmrc
  fi

  echo 'brave_variations_server_url = https://variations.brave.com/seed' >> .npmrc
  # https://github.com/brave/brave-browser/wiki/Brave%E2%80%99s-Capture-of-Usage-Data
  echo 'brave_stats_updater_url = https://laptop-updates.brave.com' >> .npmrc
  echo 'brave_stats_api_key = fe033168-0ff8-4af6-9a7f-95e2cbfc' >> .npmrc
  echo 'brave_sync_endpoint = https://sync-v2.brave.com/v2' >> .npmrc
  echo "uphold_client_id = 6d8d9473ed20be627f71ed46e207f40c004c5b1a" >> .npmrc
  echo "uphold_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
  echo "uphold_staging_client_id = 4c2b665ca060d912fec5c735c734859a06118cc8" >> .npmrc
  echo "uphold_staging_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
  echo "gemini_api_url = https://api.gemini.com/v1" >> .npmrc
  echo "gemini_oauth_url = https://exchange.gemini.com/auth" >> .npmrc
  echo "gemini_wallet_client_id = ef94aecde56ca617ac4ce4990414d22944d2095a" >> .npmrc
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
      $(echo ${_flags[@]} | tr ' ' '\n' | sed -e 's/=/:/' -e 's/^/--gn=/')
    )
  fi

  ## See explanation on top to select your build
  case ${COMPONENT} in
    0)
       msg2 "Normal build (with debug)"
       npm run build
       ;;
    2)
       msg2 "Static build"
       npm run build -- Static
       ;;
    3)
       msg2 "Debug build"
       npm run build -- Debug
       ;;
    4)
       msg2 "Release custom build"
       npm run build Release -- "${npm_args[@]}"
       ;;
    *)
       msg2 "Release build"
       npm run build Release
       ;;
  esac
}

package() {
  install -d -m0755 "${pkgdir}/usr/lib/${_pkgname}/"{,swiftshader,locales,resources}

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
    "${pkgdir}/usr/lib/${_pkgname}/"
  cp -a --reflink=auto \
    swiftshader/libGLESv2.so \
    swiftshader/libEGL.so \
    "${pkgdir}/usr/lib/${_pkgname}/swiftshader/"
  cp -a --reflink=auto \
    locales/*.pak \
    "${pkgdir}/usr/lib/${_pkgname}/locales/"
  cp -a --reflink=auto \
    resources/brave_extension \
    resources/brave_rewards \
    "${pkgdir}/usr/lib/${_pkgname}/resources/"

  if [ "$COMPONENT" != "4" ] || [[ -z ${_system_libs[icu]+set} ]]; then
    cp -a --reflink=auto \
      icudtl.dat \
      "${pkgdir}/usr/lib/${_pkgname}/"
  fi

  cd "${srcdir}"
  install -Dm0755 unbrave-launcher "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/applications/" unbrave.desktop
  install -Dm0644 "brave-browser/src/brave/app/theme/brave/product_logo_128.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "brave-browser/LICENSE"
}

# vim:set ts=4 sw=4 et:
