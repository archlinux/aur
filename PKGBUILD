# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -rgA _system_libs=(
  #[ffmpeg]=ffmpeg           # https://crbug.com/731766
  [flac]=flac
  #[freetype]=freetype2      # https://crbug.com/pdfium/733
  [harfbuzz-ng]=harfbuzz-icu
  #[icu]=icu                 # Enable again when upstream supports ICU 59
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng           # https://crbug.com/752403#c10
  #[libvpx]=libvpx           # https://bugs.gentoo.org/611394
  [libwebp]=libwebp
  #[libxml]=libxml2          # https://bugs.gentoo.org/616818
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)

pkgname=chromium-gtk2
_pkgname=chromium
pkgver=60.0.3112.113
pkgrel=1
_launcher_ver=5
pkgdesc="A web browser built for speed, simplicity, and security (GTK2 version)"
arch=('i686' 'x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
depends+=(${_system_libs[@]})
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet')
provides=($_pkgname)
conflicts=($_pkgname)
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$_pkgname-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium.desktop
        chromium-gn-bootstrap-r8.patch
        chromium-blink-gcc7.patch
        chromium-v8-gcc7.patch
        chromium-widevine.patch
        issue2961473002_1_10001.diff)
sha256sums=('ebfce706a1ea02a92e35f360c7364d1184dacf040b59eade4cb51aa61a4fec59'
            '4dc3428f2c927955d9ae117f2fb24d098cc6dd67adb760ac9c82b522ec8b0587'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            '06345804c00d9618dad98a2dc04f31ef19912cdf6e9d6e577ef7ffb1fa57003f'
            'f94310a7ba9b8b777adfb4442bcc0a8f0a3d549b2cf4a156066f8e2e28e2f323'
            '46dacc4fa52652b7d99b8996d6a97e5e3bac586f879aefb9fb95020d2c4e5aec'
            'd6fdcb922e5a7fbe15759d39ccc8ea4225821c44d98054ce0f23f9d1f00c9808'
            'b40cea8b8da16a0f18e02887e866934415e5c534e8f29d104f013fc19a756495')

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Enable support for the Widevine CDM plugin
  # libwidevinecdm.so is not included, but can be copied over from Chrome
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=853347
  patch -Np1 -i ../chromium-blink-gcc7.patch

  # https://bugs.chromium.org/p/chromium/issues/detail?id=614289
  patch -Np1 -i ../chromium-v8-gcc7.patch

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-gn-bootstrap-r8.patch

  # Reverse https://chromium.googlesource.com/chromium/src/+/8d1845c2267b05df565fa33e3c5e2b0e242a21cc%5E%21/
  patch -Rp1 -i ../issue2961473002_1_10001.diff

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +

  # There are still a lot of relative calls which need a workaround
  mkdir -p "$srcdir/python2-path"
  ln -sf /usr/bin/python2 "$srcdir/python2-path/python"

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${!_system_libs[@]} ${_system_libs[libjpeg]+libjpeg_turbo}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -path "*base/third_party/icu/*" \
      \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  # remove forced gtk3 on xdu
  sed -i 's:use_gtk3 =.*:use_gtk3 = false:' build/config/linux/gtk/gtk.gni
}

build() {
  make -C chromium-launcher-$_launcher_ver GTK=2

  cd "$srcdir/$_pkgname-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"
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
    'linux_use_bundled_binutils=false'
    'use_gtk3=false'
    'use_gconf=false'
    'use_gnome_keyring=false'
    'use_gold=false'
    'use_sysroot=false'
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    "google_api_key=\"${_google_api_key}\""
    "google_default_client_id=\"${_google_default_client_id}\""
    "google_default_client_secret=\"${_google_default_client_secret}\""
  )

  python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${_flags[*]}"
  out/Release/gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

  ninja -C out/Release chrome chrome_sandbox chromedriver widevinecdmadapter
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/$_pkgname-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"
  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  cp -a \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver,libwidevinecdmadapter.so} \
    out/Release/locales \
    out/Release/icudtl.dat \
    "$pkgdir/usr/lib/chromium/"

  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

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
