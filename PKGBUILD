# Maintainer: Chris McClellan <chris.mcclellan203@gmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: Abigail G <dev@kb6.ee>

# This PKGBUILD is maintained on github:
# https://github.com/rubberduck203/js8call-improved-pkgbuild
# and based on the work of Michael Lass for the js8call AUR package:
# https://github.com/michaellass/AUR

pkgname=js8call-improved
pkgver=2.4.0
pkgrel=2
pkgdesc="Continued development of the JS8Call project"
arch=('any')
url="https://github.com/JS8Call-improved/JS8Call-improved/"
license=('GPL-3.0-only')
makedepends=(cmake)
depends=(qt6-base qt6-multimedia qt6-serialport libusb systemd-libs libxkbcommon-x11 fftw boost)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/js8call-improved/js8call-improved/archive/refs/tags/release/$pkgver.tar.gz
        js8call-desktop.patch)
sha1sums=('fcbff999455ceedc0ef63107fa2446caad736d11'
          '75242cb737e604e9c728daad5a833ee9595dd185')
# There is incompatibility in settings between JS8Call v2.2.x, JS8Call-2.3.x and JS8Call-improved 2.4.0.
# Settings between JS8Call 2.3.x and JS8Call-improved are compatible. 
# Either can read the settings from JS8Call 2.2.x
# https://github.com/JS8Call-improved/JS8Call-improved/releases/tag/release%2F2.4.0
conflicts=('js8call<2.3')

prepare() {
    mv "$srcdir/JS8Call-improved-release-$pkgver" "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/js8call-desktop.patch"
    mkdir -p build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    cmake \
        -Wno-dev \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/$pkgname-$pkgver"
    cmake --build .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m755 build/JS8Call-improved "$pkgdir/usr/bin/js8call-improved"
    install -D -m644 icons/Unix/js8call_icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/js8call_icon.png"
    install -D -m644 js8call.desktop "$pkgdir/usr/share/applications/js8call-improved.desktop"
}
