# Maintainer: Keiran <keiran@keircn.com>
pkgname=karu-git
pkgver=r16.bb92d3a
pkgrel=1
pkgdesc="A command-line tool for downloading and watching anime (git version)"
arch=('x86_64')
url="https://github.com/keircn/karu"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=('karu')
conflicts=('karu')
source=("$pkgname::git+https://github.com/keircn/karu.git")
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
    go build -trimpath -ldflags "-s -w -X main.version=$(git describe --tags --always --dirty 2>/dev/null || echo "dev")" -o karu cmd/karu/main.go
}

package() {
    cd "$pkgname"
    install -Dm755 karu "$pkgdir/usr/bin/karu"
}
