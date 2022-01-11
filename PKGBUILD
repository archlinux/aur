# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=docker-backup-git
pkgver=r37.4fc51ee
pkgrel=1
pkgdesc="A tool to create & restore complete, self-contained backups of Docker containers"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/${pkgname%-git}"
license=('MIT')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build \
        -ldflags "-X main.Version=$pkgver" \
        -o "${pkgname%-git}" .
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
