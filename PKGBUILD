# Maintainer: Jasmin <jasmin@example.com>
pkgname=lazybeads-git
pkgver=r51.c8d1bfe
pkgrel=1
pkgdesc="Terminal UI for managing beads issues, inspired by LazyGit"
arch=('x86_64')
url="https://github.com/codegangsta/lazybeads"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('beads: required for issue management')
provides=('lazybeads')
conflicts=('lazybeads')
source=("${pkgname}::git+https://github.com/codegangsta/lazybeads.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o lazybeads .
}

package() {
    cd "$pkgname"
    install -Dm755 lazybeads "$pkgdir/usr/bin/lazybeads"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
