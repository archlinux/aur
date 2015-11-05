pkgname=prismatik
_sname=Lightpack
pkgver=5.11.2
pkgrel=1
pkgdesc="A controler for usb driven LED backlights."
arch=('i686' 'x86_64')
url="https://github.com/woodenshark/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
makedepends=('git' 'libusb' 'pkg-config')
provides=('lightpack' 'prismatik')
install='prismatik.install'
source=(
    "https://github.com/woodenshark/${_sname}/archive/${pkgver}.tar.gz"
    "include_qdatastream.patch"
)
sha256sums=(
    '09163cd082b2c49170c838f06820a13e7afb2c615e3aba523c8b46206325df43'
    '788d7bb283a80913d07eeb7b0ed66c00da0869ea71f72861a4c503061ef9075d'
)

build() {
    cd "$_sname-$pkgver/Software"
    patch -p1 -i ${srcdir}/include_qdatastream.patch
    qmake-qt5 -recursive
    make
}

check() {
    cd "$_sname-$pkgver/Software"
    make check
}

package() {
    cd "$_sname-$pkgver"
    install -Dm755 "Software/src/bin/Prismatik" "${pkgdir}/usr/bin/prismatik"
    install -Dm644 "Software/dist_linux/deb/etc/udev/rules.d/93-lightpack.rules" "${pkgdir}/etc/udev/rules.d/93-lightpack.rules"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/prismatik/README.md"
    install -Dm644 "Software/CHANGELOG" "${pkgdir}/usr/share/doc/prismatik/CHANGELOG"
}
