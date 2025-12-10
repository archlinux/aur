# Maintainer: karboncore
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-globalmenu
pkgver=145.0
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
  ffmpeg4.4
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libpulse
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
commit=https://gitlab.archlinux.org/archlinux/packaging/packages/firefox/-/raw/452ee63a86a441703e9c1659a65e7456a70986e0
source=(
  https://archive.mozilla.org/pub/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz{,.asc}
  $commit/firefox-symbolic.svg
  $commit/firefox.desktop
  $commit/org.mozilla.firefox.metainfo.xml
  $commit/0001-Install-under-remoting-name.patch
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2025/04/01/updated-gpg-key-for-signing-firefox-releases-2/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)
sha256sums=('eb0828db0e942ad345c725e2cbf2ed3b90d23771b054b6db0ded57cfa10b8c9c'
            'SKIP'
            'a9b8b4a0a1f4a7b4af77d5fc70c2686d624038909263c795ecc81e0aec7711e9'
            '71fe797430198ac8c00b538dce537284cf526e48be0496698cf5a980d70c16da'
            '23f557fa7989adcae03cc9458d94716981dbcf0e9d6d52a289a2426e50b4b785'
            'ef63a12975f108f30b00bb3290d9ca76f311d8af9c1d5dfc0d8335ad57e8f77c')
b2sums=('a8007d06dce77197dfb40ab9a759287b6bcff4e56d1b2c7acfed9475aaa2f936948534d6e726a158550c70a28bad8ec8c7f1b99ca8165198c1952a484869b6c9'
        'SKIP'
        '63a8dd9d8910f9efb353bed452d8b4b2a2da435857ccee083fc0c557f8c4c1339ca593b463db320f70387a1b63f1a79e709e9d12c69520993e26d85a3d742e34'
        '2c7936949ef922307fb593bd0480a13bde2eab8ae24fc89071d809d6659384705f9b7838b1ae8bc46b98a152ba01fcffad606d4c84796ad9bfaaf20166f0a0fd'
        '1a7fc030b1051df00df1b2f5b247b8c658de6cdfba0788041c830da3aaaa6ac974ab684e05feb80672aa2d2c22294cacfa93a71dc664b3e60becdd65e879fcee'
        'ff0ba11844e99ab1b1fed91d70c6f45837198ba43e77313c8b9c48a621e40c459953fc35283b6b6eafb5641510a5ce1e18ebda4d7d076f8212810391c0a9234b')

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  mkdir mozbuild
  cd firefox-$pkgver

  # Make different channels installable in parallel
  patch -Np1 -i ../0001-Install-under-remoting-name.patch

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

  local vendorjs="$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"
  install -Dvm644 /dev/stdin "$vendorjs" <<END
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

  local distini="$pkgdir/usr/lib/firefox/distribution/distribution.ini"
  install -Dvm644 /dev/stdin "$distini" <<END
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
  ln -srv "$pkgdir/usr/lib/libonnxruntime.so" -t "$pkgdir/usr/lib/firefox"

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
  ln -srfv "$pkgdir/usr/bin/firefox" "$pkgdir/usr/lib/firefox/firefox-bin"

  local sprovider="$pkgdir/usr/share/gnome-shell/search-providers/firefox.search-provider.ini"
  install -Dvm644 /dev/stdin "$sprovider" <<END
[Shell Search Provider]
DesktopId=firefox.desktop
BusName=org.mozilla.firefox.SearchProvider
ObjectPath=/org/mozilla/firefox/SearchProvider
Version=2
END
}

source+=('https://github.com/Lexi-Ewald/unity-menubar/raw/a728a7e/unity-menubar.patch')
sha256sums+=('a2ba18071a8fd199e2ef6b8cb432d8d34c127e8876220e06c809e6895c2acece')
b2sums+=('dca97208ec3ab34dfc8b78e9cbe5a810e1d24827d1e0572eb8a261030ca7d0833b7dbfdd56214f6c668e63882ef3c2ec0151021c64fd138e5be2114fbb9ab07f')
provides=(firefox)
conflicts=(firefox)
