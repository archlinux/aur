# Maintainer: Keiran <keiran@keircn.com>
pkgname=prefine-git
pkgver=r17.565ac13
pkgrel=1
pkgdesc="A command-line tool for downloading and watching anime (git version)"
arch=('x86_64')
url="https://github.com/priory-io/prefine"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('prefine')
conflicts=('prefine')
source=("$pkgname::git+https://github.com/priory-io/prefine.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export CGO_ENABLED=0
    export GOOS=linux
    export GOARCH=amd64
    
    go mod tidy
    go build -trimpath -ldflags "-s -w -X main.version=$(git describe --tags --always --dirty 2>/dev/null || echo "dev")" -o prefine cmd/prefine/main.go
}

package() {
    cd "$pkgname"
    install -Dm755 prefine "$pkgdir/usr/bin/prefine"
}

