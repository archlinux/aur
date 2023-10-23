# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=seamonkey
pkgver=2.53.17.1
pkgrel=2
pkgdesc="SeaMonkey internet suite"
arch=(x86_64)
url="https://www.seamonkey-project.org"
license=(MPL)
depends=(
  at-spi2-core
  bash
  cairo
  dbus
  dbus-glib
  fontconfig
  freetype2
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hunspell
  icu
  libevent
  libffi
  libpulse
  libvpx
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxrender
  libxt
  mime-types
  nspr
  nss
  pango
  pixman
  sqlite
  startup-notification
  zlib
)
makedepends=(
  autoconf2.13
  cbindgen
  clang
  imake
  llvm
  mesa
  nasm
  python
  rustup
  unzip
  yasm
  zip
)
optdepends=(
  'networkmanager: Location detection via available WiFi networks'
  'libnotify: Notification integration'
  'pulseaudio: Audio support'
)

source=(
  "https://archive.mozilla.org/pub/seamonkey/releases/$pkgver/source/seamonkey-$pkgver.source.tar.xz"
  "mozconfig"
)
sha256sums=(
  'df89e53df981d79e70ea8dd33774aa2cd6de2bdc7979b1edc63fb08f0aa3b996'
  '9d7b5df44fe6c73187acf9211ba3f59841912e0d06cfed12ec791b0193a838ec'
)
install="$pkgname.install"
options=(!lto)

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=e05d56db0a694edc8b5aaebda3f2db6a

_archive="$pkgname-$pkgver"

_rust_toolchain_version=1.72.0

prepare() {
  cd "$_archive"

  cp "$srcdir/mozconfig" .mozconfig

  rustup toolchain install "$_rust_toolchain_version"

  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  {
    echo "ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key"
    echo "ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key"
    echo "ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key"
  } >> .mozconfig
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN="$_rust_toolchain_version"

  # Don't use mold - fails.
  LDFLAGS=$(printf '%s' "$LDFLAGS" | sed 's/-fuse-ld=[^[:space:]]*//')
  export LDFLAGS
  ./mach build
}

package() {
  cd "$_archive"

  # shellcheck disable=SC1007
  DESTDIR="$pkgdir" INSTALL_SDK= ./mach install

  rm -rf "$pkgdir"/usr/lib/seamonkey/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/seamonkey/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/seamonkey/hyphenation"

  install -Dm644 comm/suite/branding/seamonkey/default128.png \
    "$pkgdir/usr/share/pixmaps/seamonkey.png"

  install -Dm644 toolkit/mozapps/installer/linux/rpm/mozilla.desktop \
    "$pkgdir/usr/share/applications/seamonkey.desktop"
  sed -i 's/@MOZ_APP_DISPLAYNAME@/SeaMonkey internet suite/' \
    "$pkgdir/usr/share/applications/seamonkey.desktop"
  sed -i 's/@MOZ_APP_NAME@/seamonkey/' "$pkgdir/usr/share/applications/seamonkey.desktop"
}
