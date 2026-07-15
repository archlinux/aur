# Maintainer: xelframe <xelframe0@gmail.com>

pkgname=gfetch-git
pkgver=r1.87dbeb3
pkgrel=1
pkgdesc="Minimal system info fetch written in Go"
arch=('x86_64')
url="https://github.com/xelframe/gfetch"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('gfetch')
conflicts=('gfetch')
source=("git+https://github.com/xelframe/gfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gfetch"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/gfetch"
    export GOPATH="$srcdir/gopath"
    export GOCACHE="$srcdir/gocache"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" -o gfetch .
}

package() {
    cd "$srcdir/gfetch"
    install -Dm755 gfetch "$pkgdir/usr/bin/gfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
