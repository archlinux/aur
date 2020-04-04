# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
# Contributor: Thomas Conneely tc116 at le dot ac dot uk

pkgname=epson-alc1100-filter
pkgver=1.2
pkgrel=3
pkgdesc="Print driver for Epson ALC1100 colour laser printer"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:EAPL')
depends_i686=('libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
depends_x86_64=('lib32-libstdc++5' 'ghostscript' 'psutils' 'sed' 'grep' 'gawk' 'bc')
makedepends=('coreutils')
optdepends=('cups: printing support')
source=("http://download.ebz.epson.net/dsc/f/01/00/01/58/64/87f759442ccaa26a3be70620d1aab13e7f713d60/Epson-ALC1100-filter-${pkgver}.tar.gz")
md5sums=('59d2925146af0e5f9770d600a8dea173')

build() {
    cd $srcdir/Epson-ALC1100-filter-$pkgver

    # In January 2020, upstream broke this binary. They attempted to
    # replace all occurrences of "pipsplus-bugs@avasys.jp" with
    # "linux-printer@epson.jp". This doesn't work very well in a binary,
    # since the strings have different lengths. We're undoing this
    # change now.
    #
    # md5sum of working (unstripped) binary: 8c24e07a7dd3bca8b7b1e52ad6e6e76b
    dd if=alc1100 of=alc1100.tmp bs=1 count=$((0x6FE04))
    printf 'pipsplus-bugs@avasys.jp' >>alc1100.tmp
    dd if=alc1100 of=alc1100.tmp bs=1 skip=$((0x6FE1A)) oflag=append conv=notrunc
    mv alc1100.tmp alc1100
}

package() {
    cd $srcdir/Epson-ALC1100-filter-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc
    make DESTDIR=$pkgdir install

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.en.txt $pkgdir/usr/share/licenses/$pkgname
    cp EAPL.ja.txt $pkgdir/usr/share/licenses/$pkgname
}
