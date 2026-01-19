# Maintainer: Josh Elias <josh at daemontech dot tools>
pkgname=gurren-git
pkgver=0.1.0.r0.gcc5802d
pkgrel=1
pkgdesc="A fast, terminal-based SSH tunnel manager with TUI and background daemon (development version)"
arch=('x86_64')
url="https://github.com/JoshElias/gurren"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('gurren')
conflicts=('gurren')
source=("git+https://github.com/JoshElias/gurren.git")
sha256sums=('SKIP')

pkgver() {
    cd gurren
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd gurren
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o gurren .
}

package() {
    cd gurren
    install -Dm755 gurren "$pkgdir/usr/bin/gurren"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
