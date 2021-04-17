# Maintainer: Piotr Serafin <piotr.serafin.71@gmail.com>
# Contributor: Mihai Bişog <mihai.bisog@gmail.com>

pkgname=tsduck
_pkgver=3.25-2237
pkgver=${_pkgver/-/_}
pkgrel=3
pkgdesc="An extensible toolkit for MPEG/DVB transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=(make gcc dos2unix which inetutils net-tools curl tar zip doxygen graphviz pcsclite srt python jdk11-openjdk)
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/tsduck/tsduck/archive/v${_pkgver}.tar.gz")
md5sums=('711f9695e46592ed9ef4879a8ad2a4fc')


build() {
    cd "$pkgname-${_pkgver}"
    make NOTEST=true
}

package() {
    cd "$pkgname-${_pkgver}"

    make SYSROOT="$pkgdir" install NOTEST=true
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # If pacman sees a /lib directory in a package, it will detect a conflict 
    # with the symlink on the filesystem. This uses /usr/lib directly.
    mv "$pkgdir/lib" "$pkgdir/usr/lib"
    mv "$pkgdir/usr/lib64"/* "$pkgdir/usr/lib"
    rm -rf "$pkgdir/usr/lib64"
}
