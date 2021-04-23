# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=tatham-utils
pkgver=20210306.c678881
pkgrel=1
pkgdesc="Simon Tatham's utilities for symlinks, pipes, X selection and more"
depends=('perl' 'libx11' 'libxau' 'libxdmcp')
arch=('i686' 'x86_64')
license=('custom:MIT')
url="https://www.chiark.greenend.org.uk/~sgtatham/utils/"
source=("https://www.chiark.greenend.org.uk/~sgtatham/utils/after.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/base64.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/beep.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/buildrun.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/cvt-utf8.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/lns.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/multi.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/nntpid.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/reservoir.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/xclipglue.tar.gz"
        "https://www.chiark.greenend.org.uk/~sgtatham/utils/xcopy.tar.gz"
        "LICENCE")
md5sums=('99db513ec6de2be5a8e3bfd38af4e9d2'
         '09b838779d1e8dff7c7c38f368e8173a'
         '76145ae1210d32c76d53b2018433eb9a'
         'f66e409cf386c1c70eeb3df8d6a59a5c'
         '979ca80f7411f734688b64177924b267'
         '74672f2b0f2f405b54991c72b3fd8e82'
         '2274a117c37565440a6a0dbe417735d3'
         'f70574b70abe9b1b80989a9202f51aa4'
         '5d0f9266bc8480c6a478ff59d98caff0'
         '2f40a3c8ddc6e9fca3eef7b666ab036a'
         '66eb7335a53d345c81f78c0066847b1b'
         'a74527fc4312ab9ace4ed1c1290a11e4')

build() {
    for pgm in after base64 beep buildrun cvt-utf8 lns nntpid reservoir xclipglue xcopy ; do
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

    cd "$srcdir/beep"
    sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
    sed -i -e 's!\\fBbeep!\\fBst-beep!g' beep.1
    sed -i -e 's!^\.TH "beep"!.TH "st-beep"!g' beep.1
    make install
    mv "$pkgdir/usr/bin/beep" "$pkgdir/usr/bin/st-beep"
    mv "$pkgdir/usr/man/man1/beep.1" "$pkgdir/usr/man/man1/st-beep.1"

    cd "$srcdir/cvt-utf8"
    sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
    sed -i -e '1s=#!/usr/bin/env python=#!/usr/bin/python2=' cvt-utf8
    make install

    for pgm in after buildrun lns nntpid reservoir xclipglue xcopy ; do
        cd "$srcdir/$pgm"
        sed -i -e 's!/usr/local!'"$pkgdir/usr"! Makefile
        make install
    done

    cd "$srcdir"
    install -D -m 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

    echo "**************************************************************************"
    echo "* base64 was renamed st-base64 to avoid conflict with the one in coreutils."
    echo "* beep was renamed st-beep to avoid conflict with extra/beep."
    echo "**************************************************************************"
}

