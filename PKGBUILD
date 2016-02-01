# Maintainer: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=crafty
pkgver=25.0.1
pkgrel=1
pkgdesc="A computer chess program"
arch=('i686' 'x86_64')
url="http://www.cis.uab.edu/hyatt/"
license=('custom')
source=(http://www.cis.uab.edu/hyatt/crafty/source/$pkgname-$pkgver.zip
        http://www.cis.uab.edu/hyatt/crafty/book/book.bin
        http://www.cis.uab.edu/hyatt/crafty/book/books.bin
        copyright)
md5sums=('b7acc17fedd528d9651f4e5533263264'
         '6d527840579904bf0e0b0a456a580a9b'
         '966a852a2ccd3c32e9167061592928d3'
         '438cec9f32fb79f58822f97cf64e7afb')

prepare()
{
    cd "$srcdir"
    sed -i -e 's:./runprof:sh ./runprof:' -e \
        "s:'-DTEST:'-DBOOKDIR=\"\\\\\"/usr/share/crafty\\\\\"\" -DTEST:" \
        Makefile
    [[ $arch == "i686" ]] && sed -i -e '/opt/s/ -DINLINEASM//g' Makefile
    sed -i 's:"crafty.hlp":BOOKDIR"/crafty.hlp":' option.c

    # bug fix
    sed -i '/PopCnt/s/arg1/x/' boolean.c
}

build()
{
    cd "$srcdir"
    unset LDFLAGS
    make unix-gcc-profile
}

package()
{
    cd "$srcdir"
    install -Dm755 crafty "$pkgdir/usr/bin/crafty"
    install -Dm644 crafty.hlp "$pkgdir/usr/share/crafty/crafty.hlp"

    cd "$srcdir"
    install -m644 book.bin "$pkgdir/usr/share/crafty/"
    install -m644 books.bin "$pkgdir/usr/share/crafty/"
    install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
