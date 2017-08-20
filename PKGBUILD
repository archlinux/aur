# $Id$
# Maintainer: Jerome Leclanche <jiri.tyr@gmail.com>

_ver_num="0.5"
_ver_full="$_ver_num-beta"
_gourl="github.com/bullettrain-sh"

pkgname=bullettrain
pkgver="${_ver_full/-/}"
pkgrel=1
pkgdesc="Bullettrain prompt builder written in Go"
url="https://github.com/bullettrain-sh"
arch=("i686" "x86_64")
license=("MIT")
makedepends=("go" "godep")
depends=("nerd-fonts-complete")
source=(
    "bullettrain-go-core.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-core/tar.gz/v$_ver_full"
    "bullettrain-go-git.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-git/tar.gz/v$_ver_num"
    "bullettrain-go-golang.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-golang/tar.gz/v$_ver_num"
    "bullettrain-go-nodejs.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-nodejs/tar.gz/v$_ver_num"
    "bullettrain-go-php.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-php/tar.gz/v$_ver_num"
    "bullettrain-go-python.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-python/tar.gz/v$_ver_num"
    "bullettrain-go-ruby.tar.gz::https://codeload.github.com/bullettrain-sh/bullettrain-go-ruby/tar.gz/v$_ver_num")
sha256sums=(
    "5754f34fabf1ae33192de25c6740d397b03aa5ebc359be014f977cbf7a2e3e47"
    "720122e3b587029bf760b3f9ab23f201bfb20ba2717989d57dabbcf591ad1b77"
    "17f601268cf634ebc34dba08df10792342a62e8c7be04134944f9ac8188ac956"
    "43f6b0fdea1912a3cb12e37878ca08139b875ff1117fd4b68ec1729345fd7bd4"
    "52c8b44199f35f179467d887bf58b12efb42b6bbde50805af94c201de1cd6809"
    "4eaea5eafa2b8d2dfd299f65e116a9e59dcc03fcb411f133eb3b0cc81ef9f198"
    "3ed92c63d6f012e5ffbd4b5428d24276658857a9e46f2fe99134c108fadf1141")


prepare() {
    rm -rf "${srcdir}/src/$_gourl"
    mkdir -p "$srcdir/src/$_gourl"
    for N in core git golang nodejs php python ruby; do
        if [ $N == 'core' ]; then
            mv -f "bullettrain-go-$N-$_ver_full" "$srcdir/src/$_gourl/bullettrain-go-$N"
        else
            mv -f "bullettrain-go-$N-$_ver_num" "$srcdir/src/$_gourl/bullettrain-go-$N"
        fi
    done
    msg2 "Fetching dependencies"
    GOPATH="$srcdir" go get -u github.com/mgutz/ansi
}


build() {
    msg2 "Build program"
    cd "$srcdir/src/$_gourl/bullettrain-go-core"
    GOPATH="$srcdir" go build -a -o "$srcdir/bullettrain" bullettrain.go
}


package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/bullettrain" "$pkgdir/usr/bin/bullettrain"
}
