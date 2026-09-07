# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=rbedit-git
pkgver=0.2.r7.gca227ff
pkgrel=1
pkgdesc="Dependency-Free Bencode Editor"
arch=('any')
url="https://github.com/rakshasa/rbedit"
license=('GPL-2.0-or-later')
provides=('rbedit')
conflicts=('rbedit')
makedepends=('git' 'go')
depends=('glibc')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
    cd rbedit
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd rbedit
    # Build rbedit
    export GOFLAGS="-buildmode=pie -trimpath"
    export CGO_LDFLAGS="$LDFLAGS"
    go build -buildmode=pie -o rbedit ./cmd/rbedit

    # Build docs
    go build -o rbedit-markdown ./cmd/rbedit-markdown
    ./rbedit-markdown docs/cli
}

package() {
    install -Dm755 "$srcdir"/rbedit/rbedit -t "$pkgdir"/usr/bin/
    install -dm755 "$pkgdir"/usr/share/doc/rbedit/
    install -m644 "$srcdir"/rbedit/docs/cli/* -t "$pkgdir"/usr/share/doc/rbedit/
}

