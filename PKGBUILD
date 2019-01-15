_pkgname=weidu
pkgname=$_pkgname-git
pkgver=1
pkgrel=1

makedepends=("ocaml")
arch=("x86_64")

conflicts=("weidu-bin" "weidu")

url="https://github.com/WeiDUorg/weidu"
pkgdesc="WeiDU is a program used to develop, distribute and install modifications for games based on the Infinity Engine."

license=("GPLv2")

source=("git+https://github.com/WeiDUorg/elkhound"
        "git+https://github.com/WeiDUorg/weidu#branch=devel")

sha256sums=("SKIP" "SKIP")

pkgver() {
    cd "$srcdir/weidu"
    git describe --always | sed "s|-|.|g"
}

prepare() {
    cd "$srcdir/elkhound/src"
    ./configure

    cd "$srcdir/weidu"
    cp sample.Configuration Configuration
}

build() {
    cd "$srcdir/elkhound/src"
    make -j1

    cd "$srcdir/weidu"
    export PATH="$srcdir/elkhound/src/elkhound:$PATH"
    export OCAMLPARAM="safe-string=0,_"
    
    make -j1
}

package() {
    cd "$srcdir/weidu"
    install -D -m=0755 weidu.asm.exe "$pkgdir/usr/bin/weidu"
}


