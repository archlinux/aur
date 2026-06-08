# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dehub-git
_pkgname="${pkgname%-git}"
pkgver=r669.8db9c8b
pkgrel=1
pkgdesc='A TUI to de-GitHub yourself. Control PRs, Actions, Issues, Notifications.'
url='https://github.com/DamianB-BitFlipper/dehub'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
license=('MIT')
depends=('github-cli')
makedepends=(
    'go'
    'git'
)
provides=('gh-dehub')
source=("${_pkgname}-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${_pkgname}-main"
    # export GOPATH="${srcdir}"
    # go mod download -modcacherw
    mkdir -p build
}

build() {
    cd "${_pkgname}-main"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o build -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 build/gh-dehub "$pkgdir/usr/bin/gh-dehub"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
