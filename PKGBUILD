# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=github-release
_author=github-release
pkgname="golang-github-${_author}-${_name}"
pkgver=0.9.0
pkgrel=1
pkgdesc="Commandline app to create and edit releases on Github (and upload artifacts)"
arch=('x86_64' 'i686')
url="https://github.com/${_author}/${_name}"
license=('MIT')
depends=('go')
options=('!strip' '!emptydirs')
source=("$_name-$pkgver-$pkgrel.tar.gz::https://github.com/${_author}/${_name}/archive/v$pkgver.tar.gz")
sha256sums=('d421bee3af352ab79058d1e37b8f97d0772f890cd850ae2a21a7060e81985e1f')

check() {
    export GOPATH="$srcdir/build:/usr/share/gocode"
    mkdir -p "$srcdir"/build/src/github.com/$_author
    cp -a "$srcdir"/$_name-$pkgver "$srcdir"/build/src/github.com/$_author/$_name
    cd "$srcdir/build/src/github.com/$_author/$_name"
    go test -v $(go list ./...)
}

package() {
    mkdir -p "$pkgdir/usr/share/gocode/src/github.com/$_author/"
    cp -a --preserve=timestamps "${_name}-${pkgver}" "$pkgdir/usr/share/gocode/src/github.com/$_author/$_name"

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.* COPYING.*; do
        if [ -e "${_name}-${pkgver}/$f" ]; then
            install -Dm644 "${_name}-${pkgver}/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
        fi
    done
}
