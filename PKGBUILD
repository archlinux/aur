# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=star-cshl
pkgver=2.7.10a
pkgrel=3
pkgdesc="STAR aligns RNA-seq reads to a reference genome using uncompressed suffix arrays"
arch=("x86_64")
url="https://github.com/alexdobin/STAR"
license=("GPL3")
makedepends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexdobin/STAR/archive/${pkgver}.tar.gz"
        "STAR-2.7.10a-missing-include.patch")
sha1sums=('daaa3b889d7b38927df5c8e80a9bc032b0a4560f'
          'fd09f494e1d6c5a474e41c610a355bf7a46f1aaf')

prepare() {
  cd "$srcdir/STAR-${pkgver}"
  patch -p1 -i "${srcdir}/STAR-2.7.10a-missing-include.patch"
}

build() {
    cd "$srcdir/STAR-${pkgver}/source"

    make STAR
    mv STAR STARshort
    make clean
    make STARlong
}

package() {
    cd "$srcdir/STAR-${pkgver}/source"

    install -Dm755 STARshort "$pkgdir/usr/bin/STAR"
    install -Dm755 STARlong "$pkgdir/usr/bin/STARlong"
    install -Dm644 parametersDefault "$pkgdir/usr/share/doc/star-cshl/parameters"

    cd "$srcdir/STAR-${pkgver}/doc"

    install -Dm644 STARmanual.pdf "$pkgdir/usr/share/doc/star-cshl/STARmanual.pdf"
}
