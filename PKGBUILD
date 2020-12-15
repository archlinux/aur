# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=xo-sql-git
_pkgname=xo
pkgver=r204.6fe83c5
pkgrel=1
pkgdesc='Command line tool to generate idiomatic Go code for SQL databases'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/xo"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('xo')
conflicts=('xo')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external" \
        -o $_pkgname
}

package() {
    cd $_pkgname
    install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
