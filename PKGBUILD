# Maintainer: Matt Parnell <mparnell at gmail dot com>
# Contributor: Piotr Serafin <piotr.serafin.71@gmail.com>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=tsduck
_pkgver=3.41-4299
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc="An extensible toolkit for MPEG/DVB transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=(git git-lfs make gcc cmake dos2unix which inetutils net-tools curl tar zip doxygen graphviz linux-api-headers libedit libusb pcsclite srt python jdk-openjdk)
makedepends=(asciidoctor)
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/tsduck/tsduck/archive/v${_pkgver}.tar.gz")
sha256sums=('1940946f5d15b9c1fea941e91d4685eb60cf4857a77f55eb3ad71d4e7e79ce65')

build() {
    cd "$pkgname-${_pkgver}"
    make NOTEST=1 NOGITHUB=1
}

package() {
    cd "$pkgname-${_pkgver}"

    make SYSROOT="$pkgdir" install
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # If pacman sees a /lib directory in a package, it will detect a conflict 
    # with the symlink on the filesystem. This uses /usr/lib directly.
    mv "$pkgdir/lib" "$pkgdir/usr/lib"
    mv "$pkgdir/usr/lib64"/* "$pkgdir/usr/lib"
    rm -rf "$pkgdir/usr/lib64"
}
