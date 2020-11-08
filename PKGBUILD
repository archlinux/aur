# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=go-humanize
_author=dustin
pkgname="golang-github-${_author}-${_name}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Go Humans! (formatters for units to human friendly sizes)"
arch=('x86_64' 'i686')
url="https://github.com/${_author}/${_name}"
license=('MIT')
depends=('go')
options=('!strip' '!emptydirs')
source=("$_name-$pkgver-$pkgrel.tar.gz::https://github.com/dustin/${_name}/archive/v$pkgver.tar.gz")
sha256sums=('e4540bd50ac855143b4f2e509313079c50cf5d8774f09cc10dbca5ae9803d8ba')

check() {
    export GOPATH="$srcdir/build:/usr/share/gocode"
    mkdir -p "$srcdir"/build/src/github.com/$_author
    cp -a "$srcdir"/$_name-$pkgver "$srcdir"/build/src/github.com/$_author/$_name
    cd "$srcdir"/build/src/github.com/$_author/$_name
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
