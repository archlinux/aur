# Maintainer: Taras Shpot <mrshpot at gmail dot com>

pkgname=pd-jsusfx-git
pkgver=166.2150a49
pkgrel=1
pkgdesc="JSFX for Pd"
arch=("i686" "x86_64")
license=('Apache')
url="https://github.com/asb2m10/jsusfx"
depends=('pd')
makedepends=('git' 'cmake' 'php' 'nasm')
provides=('pd-jsusfx')
conflicts=('pd-jsusfx')
source=("git+https://github.com/asb2m10/jsusfx.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/jsusfx
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/jsusfx
     git submodule update --init --recursive
     cd pd
     cmake .
     cmake --build .
}

package() {
     cd $srcdir/jsusfx/pd
     cmake --build . --target install
     mkdir -p "$pkgdir/usr/lib/pd-externals/jsusfx"
     mkdir -p "$pkgdir/usr/bin"
     install -Dm644 dist/README.md "$pkgdir/usr/lib/pd-externals/jsusfx"
     sed -i -e '1i\#!/usr/bin/env python' dist/jsfx2abstract.py
     install -Dm755 dist/jsfx2abstract.py "$pkgdir/usr/bin/jsfx2abstract"
     install -Dm755 dist/externals/*.pd_linux "$pkgdir/usr/lib/pd-externals/jsusfx"
     install -Dm644 dist/externals/*.pd "$pkgdir/usr/lib/pd-externals/jsusfx"
     install -Dm644 dist/externals/*.jsfx "$pkgdir/usr/lib/pd-externals/jsusfx"
}
