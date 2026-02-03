# Maintainer: Xretic (https://github.com/unf6)
# Co-Maintainer: xZepyx (https://github.com/xZepyx)

pkgname=nucleus-cli        # AUR package name
pkgver=r0.0.0
pkgrel=1
pkgdesc="A blazingly fast CLI for managing and supercharging nucleus-shell."
arch=('x86_64')
url="https://github.com/unf6/nucleus"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('nucleus')      # allows other packages to satisfy dependencies
conflicts=('nucleus')     # avoids conflicts with other packages
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/nucleus"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/nucleus"
    export CGO_ENABLED=0

    go mod vendor

    go build \
        -mod=vendor \
        -trimpath \
        -buildmode=pie \
        -ldflags="-s -w" \
        -o nucleus
}

package() {
    cd "$srcdir/nucleus"

    install -Dm755 nucleus "$pkgdir/usr/bin/nucleus"  # binary installed as nucleus
}
