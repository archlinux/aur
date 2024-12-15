# Maintainer: Korbinian Maier <korbinian.maier@posteo.com>

pkgname=cornrow
pkgver=1.0.0
pkgrel=1
pkgdesc="Bluetooth and Airplay Audio Daemon for SBCs (Raspberry Pi, etc)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mincequi/cornrow"
license=('GPL-2.0-only')
depends=(
    'boost'
    'sbc'
    'alsa-lib'
    'avahi'
    'openssl'
    'bluez-qt5'
    'libavcodec.so'
    'qt5-connectivity'
    'qt5-websockets'
)
makedepends=(
    'git'
    'cmake'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mincequi/cornrow/archive/refs/tags/v${pkgver}.tar.gz"
    "0001-Persistence-fix-boost-get_child.patch"
    "cornrow-user.conf"
)
sha256sums=(
    '522a69a30ff75a442c63d2b4f8415949e5212060a915f9bbad2be61e068e202a'
    '94cd67cf3a49fea89e0a81cdbf488d69a7a93013c2f6f6f34bd5ceb0b5c4f92d'
    '9b9f979a40712ba3e6f44761e06d244d7ca363982111399ebc658ce0a0ae728e'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/0001-Persistence-fix-boost-get_child.patch"
}

build() {
    cd "$pkgname-$pkgver"
    cmake \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -W no-dev

    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    ./build/cornrowd/cornrowd --version
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install -C build
    install -vDm644 "$srcdir/cornrow-user.conf" "$pkgdir/usr/lib/sysusers.d/cornrow.conf"
    install -vDm644 "cornrowd/etc/cornrowd.conf" "$pkgdir/etc/cornrowd.conf"
}
