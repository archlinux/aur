# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=tatham-utils
pkgver=0
pkgrel=1
pkgdesc="Simon Tatham's utilities for symlinks, pipes, X selection and more"
depends=('perl' 'libx11' 'libxau' 'libxdmcp')
arch=('i686' 'x86_64')
license=('custom:MIT')
url="http://www.chiark.greenend.org.uk/~sgtatham/utils/"
source=("http://www.chiark.greenend.org.uk/~sgtatham/utils/after.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/base64.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/buildrun.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/cvt-utf8.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/lns.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/multi.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/nntpid.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/reservoir.tar.gz"
        "http://www.chiark.greenend.org.uk/~sgtatham/utils/xcopy.tar.gz"
        "LICENCE")
md5sums=('3202f0a45597eaef5cc0641d1b0fb88d'
         '599bc34656b2d3c21c8b1e6df63faf96'
         '740a428df60da6e170e1e506a7160806'
         'fc40ae4866ed5abd265caf33eaf52ad6'
         '1a44e74907f832587dcc0c23938d770a'
         'd3f090d3567e1af11337b41046673b2b'
         '2d4c5954083c5a5b9db4249487a93b3d'
         '6aab74f8037d03ac09dbba20142b49d5'
         '95e4d45b0a49eb06c38f0d1c72a3f86a'
         'a74527fc4312ab9ace4ed1c1290a11e4')

build() {
    for pgm in after base64 buildrun cvt-utf8 lns nntpid reservoir xcopy ; do
        cd "$srcdir/$pgm"
        make
    done
}

package() {
    cd "$srcdir/base64"
    sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
    sed -i -e 's!\\fBbase64!\\fBst-base64!g' base64.1
    sed -i -e 's!^\.TH "base64"!.TH "st-base64"!g' base64.1
    make install
    mv "$pkgdir/usr/bin/base64" "$pkgdir/usr/bin/st-base64"
    mv "$pkgdir/usr/man/man1/base64.1" "$pkgdir/usr/man/man1/st-base64.1"

    cd "$srcdir/cvt-utf8"
    sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
    sed -i -e '1s=#!/usr/bin/env python=#!/usr/bin/python2=' cvt-utf8
    make install

    for pgm in after buildrun lns nntpid reservoir xcopy ; do
        cd "$srcdir/$pgm"
        sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
        make install
    done

    cd "$srcdir"
    install -D -m 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

    echo "**************************************************************************"
    echo "* beep was omitted because it is in extra/beep."
    echo "* base64 was renamed st-base64 to avoid conflict with the one in coreutils."
    echo "**************************************************************************"
}
