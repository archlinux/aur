# Maintainer: Chris McClellan <chris.mcclellan203@gmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Brian Salcedo <brian@salcedo.tech>
# Contributor: Abigail G <dev@kb6.ee>

# This PKGBUILD is maintained on github:
# https://github.com/rubberduck203/js8call-improved-pkgbuild
# and based on the work of Michael Lass for the js8call AUR package:
# https://github.com/michaellass/AUR

pkgname=js8call-improved
pkgver=2.5.1
pkgrel=1
pkgdesc="Continued development of the JS8Call project"
arch=('any')
url="https://github.com/JS8Call-improved/JS8Call-improved/"
license=('GPL-3.0-only')
makedepends=(cmake)
depends=(
    qt6-base
    qt6-multimedia
    qt6-serialport
    libusb
    systemd-libs
    libxkbcommon-x11
    fftw
    boost
)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/js8call-improved/js8call-improved/archive/refs/tags/release/$pkgver.tar.gz
        js8call-desktop.patch)
sha1sums=('a3ebe04fc89ada9fca66565f10743e585f3d26cf'
          '0a89b3ae8beaddabf0575b99139d78efdeca27ca')
# As of 2.5.0 js8call-improved is the official upstream of js8call
# https://github.com/JS8Call-improved/JS8Call-improved/issues/115#issuecomment-3706458851
# https://github.com/JS8Call-improved/JS8Call-improved/releases/tag/release%2F2.5.0
provides=('js8call')
conflicts=('js8call')

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

    install -D -m755 build/JS8Call "$pkgdir/usr/bin/js8call"
    install -D -m644 icons/Unix/js8call_icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/js8call_icon.png"
    install -D -m644 JS8Call.desktop "$pkgdir/usr/share/applications/JS8Call.desktop"
}
