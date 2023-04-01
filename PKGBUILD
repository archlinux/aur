# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=seamonkey
pkgver=2.53.15
pkgrel=1
pkgdesc="SeaMonkey internet suite"
arch=('x86_64')
license=('MPL')
depends=('dbus-glib' 'gtk3' 'hunspell' 'icu'
         'libevent' 'libpulse' 'libvpx' 'libxt' 'mime-types'
         'nss' 'sqlite' 'startup-notification')
makedepends=('autoconf2.13' 'clang' 'imake' 'llvm' 'mesa' 'python'
             'rustup' 'yasm' 'unzip' 'zip' 'nasm' 'cbindgen')
optdepends=('networkmanager: Location detection via available WiFi networks'
	    'libnotify: Notification integration'
	    'pulseaudio: Audio support')
_python2_pkgver=2.7.18
url="https://www.seamonkey-project.org/"
source=("https://archive.mozilla.org/pub/seamonkey/releases/$pkgver/source/seamonkey-$pkgver.source.tar.xz"
        "mozconfig"
        "https://www.python.org/ftp/python/$_python2_pkgver/Python-$_python2_pkgver.tar.xz"{,.asc})
sha256sums=('04a9dcd57217b1c630815b10d07e1865db14339b04930ec09d521733d6e8ec3f'
            '05bbf05f6a2f060ba3b69a420d57e95766880869a3e416cb05f60894bce1213b'
            'b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43'
            'SKIP')
validpgpkeys=('C01E1CAD5EA2C4F0B8E3571504C367C218ADD4FF')  # Benjamin Peterson
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

prepare() {
  cd "$pkgname-$pkgver"
  cp ../mozconfig .mozconfig

  # Build failure with rust 1.63.0 https://bugzilla.mozilla.org/show_bug.cgi?id=1783784
  rustup toolchain install 1.62.0

  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  cat >> .mozconfig <<EOF
  ac_add_options --with-google-location-service-api-keyfile=${PWD@Q}/google-api-key
  ac_add_options --with-google-safebrowsing-api-keyfile=${PWD@Q}/google-api-key
  ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key
EOF
}

build() {
  #Python 2 is EOL https://bugzilla.mozilla.org/show_bug.cgi?id=1756371
  cd "Python-$_python2_pkgver"
  ./configure --prefix=/usr \
              --disable-optimizations \
              --without-lto \
              --without-ensurepip
  DESTDIR="$srcdir"/fakeinstall make install
  cd ..
  export PATH="$PWD/fakeinstall/usr/bin:$PATH"
  cd "$pkgname-$pkgver"

  ./mach build
}

package() {
  cd "$pkgname-$pkgver"

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
