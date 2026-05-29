# Maintainer: karboncore
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-globalmenu
pkgver=151.0.2
pkgrel=1
pkgdesc="Fast, Private & Safe Web Browser"
url="https://www.mozilla.org/firefox/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  alsa-lib
  at-spi2-core
  bash
  cairo
  dbus
  ffmpeg
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrandr
  libxss
  libxt
  mime-types
  nspr
  nss
  pango
  ttf-font
)
makedepends=(
  cbindgen
  clang
  diffutils
  imake
  jack
  lld
  llvm
  mesa
  nasm
  nodejs
  onnxruntime
  python
  rust
  unzip
  wasi-compiler-rt
  wasi-libc
  wasi-libc++
  wasi-libc++abi
  xorg-server-xvfb
  yasm
  zip
)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'onnxruntime: Local machine learning features such as smart tab groups'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=(
  !emptydirs
  !lto
  !makeflags
)
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/95a1152b7bba4db2ecffda17b11e73832da88380
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $commit/firefox-symbolic.svg
  $commit/firefox.desktop
  $commit/org.mozilla.firefox.metainfo.xml
  $commit/0001-Install-under-remoting-name.patch
  $commit/0002-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2025/04/01/updated-gpg-key-for-signing-firefox-releases-2/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('63c4267799f2618dd7ac5997d0306bbcf2a5306caaca0056795bc6c61d00f8c8'
            'SKIP'
            'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
            '2a51d57d98fbda86f094bc991e1ad4dd6e8a9d32fd0836b1183bf70ec4b68915'
            '23f557fa7989adcae03cc9458d94716981dbcf0e9d6d52a289a2426e50b4b785'
            'f0118f1b092e471fe3c81c1e8b49a76a37f72f3263d00a18e939dcde80c90dac'
            'c7d6572fe1ac76f6adbfb10102f284fd55690396ac0a275a5cfea9a2efa22b58')
b2sums=('4b5fd2683a2b3aaf85fdf419cef5e4fab3660d623511bc0b3b2f463c04aae075e906309965730df1cd564778fd2d8e9b1262147016b4cd02b922d6952fbe9b03'
        'SKIP'
        '63a8dd9d8910f9efb353bed452d8b4b2a2da435857ccee083fc0c557f8c4c1339ca593b463db320f70387a1b63f1a79e709e9d12c69520993e26d85a3d742e34'
        '63c62c85ee70e22b02e9ea34e69f04f50403b7634b99fb0e996a83c963916dc4224041a0b265e54f6c224bd1777ddfdeb255037e3e30fec288695f3050278b05'
        '1a7fc030b1051df00df1b2f5b247b8c658de6cdfba0788041c830da3aaaa6ac974ab684e05feb80672aa2d2c22294cacfa93a71dc664b3e60becdd65e879fcee'
        'c1cbb2de5011ed88e77c22c6abbc944ac2bd0f6c95bddb75f668f40566e6cad8d0090e65a5ff498055612a359f82484b41202f74e1312236e17d099e71bbc952'
        '0420be311ae633c05d3a110b9fe5a8da288530d918ec9435c1a54d8d13bbbd06f5ee90977a9ee71d39e68bc26deb20264e712816e1dc5d7374b64a920e51b353')

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  # Make different channels installable in parallel
  patch -Np1 -i ../0001-Install-under-remoting-name.patch

  # Fix build with glibc 2.43
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1999625
  patch -Np1 -i ../0002-Patch-glsl-optimizer-to-build-with-glibc-2.43.patch

  # Appmenu patches
  patch -Np1 -i ../unity-menubar.patch

  echo -n "$_google_api_key" >google-api-key

  cat >../mozconfig <<END
ac_add_options --enable-application=browser
mk_add_options MOZ_OBJDIR=${PWD@Q}/obj

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd
ac_add_options --enable-linker=lld
ac_add_options --disable-install-strip
ac_add_options --disable-bootstrap
ac_add_options --with-wasi-sysroot=/usr/share/wasi-sysroot

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
ac_add_options --with-unsigned-addon-scopes=app,system
ac_add_options --allow-addon-sideload
export MOZILLA_OFFICIAL=1
export MOZ_APP_REMOTINGNAME=firefox

# Keys
ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
END
}

build() {
  cd firefox-$pkgver

  export MACH_BUILD_PYTHON_NATIVE_PACKAGE_SOURCE=pip
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZ_BUILD_DATE="$(date -u${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH} +%Y%m%d%H%M%S)"
  export MOZ_NOSPAM=1

  # malloc_usable_size is used in various parts of the codebase
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  # Breaks compilation since https://bugzilla.mozilla.org/show_bug.cgi?id=1896066
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  # LTO needs more open files
  ulimit -n 4096

  cat >.mozconfig ../mozconfig - <<END
ac_add_options --enable-lto=cross,thin
END
  ./mach build --priority normal
}

package() {
  cd firefox-$pkgver
  DESTDIR="$pkgdir" ./mach install

  local appdir="$pkgdir/usr/lib/firefox"
  touch "$appdir/is-packaged-app"

  install -Dvm644 /dev/stdin "$appdir/browser/defaults/preferences/vendor.js" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions in the application directory
pref("extensions.autoDisableScopes", 11);

// Enable GNOME Shell search provider
pref("browser.gnome-search-provider.enabled", true);
END

  install -Dvm644 /dev/stdin "$appdir/distribution/distribution.ini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=firefox
app.partner.archlinux=archlinux
END

  # Link up system ONNX runtime
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$appdir"

  # Install desktop icons and metadata
  local i theme=official
  for i in 16 22 24 32 48 64 128 256; do
    install -Dvm644 browser/branding/$theme/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done
  install -Dvm644 browser/branding/$theme/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"
  install -Dvm644 browser/branding/$theme/content/about-logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/firefox.svg"

  install -Dvm644 ../firefox-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dvm644 ../firefox.desktop -t "$pkgdir/usr/share/applications"
  install -Dvm644 ../org.mozilla.firefox.metainfo.xml -t "$pkgdir/usr/share/metainfo"

  # Install a wrapper to avoid confusion about binary path
  install -Dvm755 /dev/stdin "$pkgdir/usr/bin/firefox" <<END
#!/bin/sh
exec /usr/lib/firefox/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srfv "$pkgdir/usr/bin/firefox" "$appdir/firefox-bin"

  # Use system certificates
  if [[ -e $appdir/libnss3.so ]]; then
    ln -sfv ../libnssckbi.so -t "$appdir"
  fi

  # Register GNOME search provider
  install -Dvm644 /dev/stdin "$pkgdir/usr/share/gnome-shell/search-providers/firefox.search-provider.ini" <<END
[Shell Search Provider]
DesktopId=firefox.desktop
BusName=org.mozilla.firefox.SearchProvider
ObjectPath=/org/mozilla/firefox/SearchProvider
Version=2
END
}

source+=('https://github.com/Lexi-Ewald/unity-menubar/raw/9a69a0967c32991d488f3b47bb287ecf38aa1f55/unity-menubar.patch')
sha256sums+=('8ca5a55119f42a75565e8803a130f21133d285df63c0de58dc5d17babf20ad64')
b2sums+=('07579b32e1527662325b37a3df2a6311637cdeaecc1b62fb386051dabdb5917f3ad617482732c97b167e3766ac109dc3e5d59c525dec0033a0f8923a1f44165f')
provides=(firefox)
conflicts=(firefox)
