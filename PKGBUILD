# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alastair Hughes < hobbitalastair at yandex dot com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-wayland-git
pkgname_=chromium
pkgver=48.0.2548.0
pkgver_=63.0.3239.84
pkgrel=6
_launcher_ver=5
pkgdesc="A web browser built for speed, simplicity, and security"
arch=('x86_64')
url="https://github.com/Igalia/chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git' 'clang'
             'lld' 'depot-tools-git' 'libtinfo5')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
conflicts=('chromium')
provides=('chromium')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/${pkgname_}-${pkgver_}.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium-$pkgver.txt::https://chromium.googlesource.com/chromium/src.git/+/${pkgver_}?format=TEXT
        chromium.desktop
        chromium-exclude_unwind_tables.patch
        chromium-clang-r1.patch
        chromium-webrtc-r0.patch
        chromium-widevine.patch)
sha256sums=('6de2754dfc333675ae6a67ae13c95666009b35c84f847b058edbf312e42fa3af'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            '782a512b8bcf4aa6e58036cc3454d037d0eea69f27d5b673902d494c3fb5b20d'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            'e53dc6f259acd39df13874f8a0f440528fae764b859dd71447991a5b1fac7c9c'
            'ab5368a3e3a67fa63b33fefc6788ad5b4a79089ef4db1011a14c3bee9fdf70c6'
            'bcb2f4588cf5dcf75cde855c7431e94fdcc34bdd68b876a90f65ab9938594562'
            'd6fdcb922e5a7fbe15759d39ccc8ea4225821c44d98054ce0f23f9d1f00c9808')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg              # https://crbug.com/731766
  [flac]=flac
  #[freetype]=freetype2         # https://crbug.com/pdfium/733
  #[harfbuzz-ng]=harfbuzz-icu   # https://crbug.com/768938
  #[icu]=icu                    # https://crbug.com/772655
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng              # https://crbug.com/752403#c10
  #[libvpx]=libvpx              # https://bugs.gentoo.org/611394
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

#pkgver() {
#  cd "${srcdir}/chromium/src"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  cd "$srcdir/"

  mkdir -p chromium
  cd chromium

  cp -r /opt/depot_tools ${srcdir}/
  export PATH="${srcdir}/python2-path:${srcdir}/depot_tools:$PATH"

  gclient config --name=src https://github.com/Igalia/chromium.git
  gclient sync -r ozone-wayland-dev --with_branch_heads --nohooks

  # https://crbug.com/710701
  local _chrome_build_hash=$(curl -s https://chromium.googlesource.com/chromium/src.git/+/$pkgver?format=TEXT |
    base64 -d | grep -Po '^parent \K[0-9a-f]{40}$')
  if [[ -z $_chrome_build_hash ]]; then
    error "Unable to fetch Chrome build hash."
    return 1
  fi
  echo "LASTCHANGE=$_chrome_build_hash-" >src/build/util/LASTCHANGE

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  #sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
  #  patch -Np1

  # Remove bundled ICU; its header files appear to get picked up instead of
  # the system ones, leading to errors during the final link stage.
  # https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/BNGvJc08B6Q
  #find third_party/icu -type f \! -regex '.*\.\(gyp\|gypi\|isolate\)' -delete

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # Download the PNaCL toolchain on x86_64; i686 toolchain is no longer provided
  #if (( $_build_nacl )); then
  #  python2 build/download_nacl_toolchains.py \
  #    --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator \
  #    sync --extract
  #fi

  # Ozone-Wayland
  #mv ../ozone-wayland ozone

  # Patch to fix build with use_system_libvpx
  # Chromium bug #541273
  #patch -p1 < "${srcdir}/unbundle-libvpx_new-fix.patch"

  # Patch!
  #for patchfile in ozone/patches/00*; do
  #  echo "Applying ${patchfile}."
  #  patch -p1 <$patchfile
  #done

  # Patching bug while compiling for platform wayland
  #sed -i 's/\[ "wayland-egl" \]/\[ "wayland-egl" , "xkbcommon" \]/' ui/ozone/platform/wayland/BUILD.gn

  # Fix for downloading debian jessie sysroot
  # src/build/linux/sysroot_scripts/install-sysroot.py
  #sed -i "s/InstallSysroot('Wheezy', 'amd64')/InstallSysroot('Jessie', 'amd64')/g" build/linux/sysroot_scripts/install-sysroot.py 
  #./build/linux/sysroot_scripts/install-sysroot.py --arch=amd64

  #cp -r /opt/depot_tools third_party/
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "${srcdir}/chromium"

  export PATH="${srcdir}/python2-path:${srcdir}/depot_tools:$PATH"
  export TMPDIR="$srcdir/temp"
  mkdir -p "$TMPDIR"

  local _flags=(
    'is_clang=false'
    'clang_use_chrome_plugins=false'
    'is_debug=false'
    'fatal_linker_warnings=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gtk3=true'
    'use_gconf=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
  )

  if check_option strip y; then
    _flags+=('exclude_unwind_tables=true')
  fi

  cd src

  gclient runhooks

  gn gen out/Release --args="use_ozone=true enable_mus=true  use_xkbcommon=true" # use_jessie_sysroot=true 
  /usr/bin/ninja -C out/Release chrome chrome_sandbox chromedriver widevinecdmadapter
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium/src"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e "s/@@MENUNAME@@/Chromium/g" \
    -e "s/@@PACKAGE@@/chromium/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/chromium/g" \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  cp \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver,*.so,*.nexe} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
