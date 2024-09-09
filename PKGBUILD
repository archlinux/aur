# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=seamonkey
pkgver=2.53.19
pkgrel=1
pkgdesc="SeaMonkey internet suite"
arch=(x86_64)
url="https://www.seamonkey-project.org"
license=(MPL-2.0)
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
#  cargo
  rustup
  cbindgen
  clang
  imake
  llvm
  mesa
  nasm
#  python, fails with python 3.12
  unzip
  yasm
  zip
)
optdepends=(
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
)
install="$pkgname.install"
options=(!lto)
source=(
  "https://archive.seamonkey-project.org/releases/$pkgver/source/seamonkey-$pkgver.source.tar.xz"
  "mozconfig"
  https://www.python.org/ftp/python/3.11.10/Python-3.11.10.tar.xz{,.asc}
)
validpgpkeys=('A035C8C19219BA821ECEA86B64E628F8D684696D')  # Pablo Galindo Salgado <pablogsal@gmail.com>
sha256sums=(
  'a6c9a44d2a167f04fff5d4175ad61e934c6177852ab8ab56c319f242a73146e2'
  '9554b2823d05c7d406325daec629c8b3f64e7d6a32db1bae5683c57d41de529f'
  '07a4356e912900e61a15cb0949a06c4a05012e213ecd6b4e84d0f67aabbee372'
  'SKIP'
)

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

prepare() {
  # packed_simd no longer builds with 1.78.0
  # https://github.com/rust-lang/packed_simd/issues/360
  rustup toolchain update --profile minimal 1.77.2
  rustup default 1.77.2

  cd "$_archive"

  cp "$srcdir/mozconfig" .mozconfig

  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  {
    echo "ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key"
    echo "ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key"
    echo "ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key"
  } >> .mozconfig
}

build() {
  cd Python-3.11.10
  ./configure
  make
  make DESTDIR="$srcdir/pythoninstall" install
  cd ..
  PATH="$PWD/pythoninstall/usr/local/bin:$PATH"

  cd "$_archive"

  # Don't use mold - fails.
  LDFLAGS=$(printf '%s' "$LDFLAGS" | sed 's/-fuse-ld=[^[:space:]]*//')
  export LDFLAGS
  export MACH_USE_SYSTEM_PYTHON=1
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
