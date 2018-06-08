# Maintainer: Raghavendra Bhuvan <rage28@googlemail.com>
pkgname=git-user
pkgver=v2.0.5
pkgrel=1
pkgdesc=" Git plugin that allows you to save multiple user profiles and set them as project defaults"
arch=('any')
url="https://github.com/gesquive/${pkgname}.git"
license=('MIT')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl="github.com/gesquive/${pkgname}"

prepare() {
    # if a global GOPATH is already set push save it
    if [ ! -z "$GOPATH" ];then
        PREV_GOPATH=$GOPATH
    fi
    unset GOPATH
}

build() {
    GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
    GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/$GOPATH"
    cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH" &>/dev/null || :

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.* COPYING.*; do
        if [ -e "$srcdir/src/$_gourl/$f" ]; then
        install -Dm644 "$srcdir/src/$_gourl/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
        fi
    done

    unset GOPATH
    # if previous GOPATH detected export it back
    if [ ! -z "$PREV_GOPATH" ];then
        export GOPATH=${PREV_GOPATH}
        unset PREV_GOPATH
    fi
}
