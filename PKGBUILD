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
pkgver=r4731.8bb6dd45
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=('x86_64')
url='https://www.brave.com/download'
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'libva' 'json-glib')
makedepends=('git' 'npm' 'python' 'python2' 'icu' 'glibc' 'gperf' 'java-runtime-headless' 'clang' 'pipewire')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'sccache: For faster builds')
chromium_base_ver="93"
patchset="5"
patchset_name="chromium-${chromium_base_ver}-patchset-${patchset}"
_launcher_ver=7
source=("brave-browser::git+https://github.com/brave/brave-browser.git"
        "chromium::git+https://github.com/chromium/chromium.git"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "git+https://github.com/brave/brave-core.git"
        "git+https://github.com/brave/adblock-rust.git"
        'brave-launcher'
        'brave-browser.desktop'
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz"
        "https://github.com/stha09/chromium-patches/releases/download/${patchset_name}/${patchset_name}.tar.xz"
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
            'e4478c79e2eed500777117bb1d48f4be1866908dcda8d75003a5d055618dfdca'
            'fa6ed4341e5fc092703535b8becaa3743cb33c72f683ef450edd3ef66f70d42d'
            '86859c11cfc8ba106a3826479c0bc759324a62150b271dd35d1a0f96e890f52f'
            '60cc98f2d96c6b9c01fa004cfa1e7cf912460dd01f3e6440e067b3098f2ccf72'
            'ea3446500d22904493f41be69e54557e984a809213df56f3cdf63178d2afb49e'
            '991badfeef34022cef226f156cb65b83c358674ec1cb15be2ed54c92d8316a3b'
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

  # Hack to prioritize python2 in PATH
  mkdir -p "${srcdir}/bin"
  ln -sf /usr/bin/python2 "${srcdir}/bin/python"
  ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
  export PATH="${srcdir}/bin:${PATH}"

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
    npm run sync -- --force
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

  # Hack to prioritize python2 in PATH
  mkdir -p "${srcdir}/bin"
  ln -sf /usr/bin/python2 "${srcdir}/bin/python"
  ln -sf /usr/bin/python2-config "${srcdir}/bin/python-config"
  export PATH="${srcdir}/bin:${PATH}"

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
  install -d -m0755 "${pkgdir}/usr/lib/${pkgname}/"{,swiftshader,locales,resources}

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
    "${pkgdir}/usr/lib/${pkgname}/"
  cp -a --reflink=auto \
    swiftshader/libGLESv2.so \
    swiftshader/libEGL.so \
    "${pkgdir}/usr/lib/${pkgname}/swiftshader/"
  cp -a --reflink=auto \
    locales/*.pak \
    "${pkgdir}/usr/lib/${pkgname}/locales/"
  cp -a --reflink=auto \
    resources/brave_extension \
    resources/brave_rewards \
    "${pkgdir}/usr/lib/${pkgname}/resources/"

  if [ "$COMPONENT" != "4" ] || [[ -z ${_system_libs[icu]+set} ]]; then
    cp -a --reflink=auto \
      icudtl.dat \
      "${pkgdir}/usr/lib/${pkgname}/"
  fi

  cd "${srcdir}"
  install -Dm0755 brave-launcher "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/applications/" brave-browser.desktop
  install -Dm0644 "brave-browser/src/brave/app/theme/brave/product_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "brave-browser/LICENSE"
}

# vim:set ts=4 sw=4 et:
