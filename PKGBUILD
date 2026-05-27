# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=quien-git
_pkgname=quien
pkgver=0.9.0.r1.g6bd4f22
pkgrel=1
pkgdesc="A better whois and domain intelligence toolkit"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
depends=('glibc')
makedepends=(
    'go'
    'git'
)
provides=('quien')
conflicts=('quien' 'quien-bin')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
    go mod download -modcacherw
}

build() {
    cd "${_pkgname}-main"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build \
        -ldflags="-linkmode=external -X main.version=$pkgver" \
        -o "$_pkgname"
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 "${_pkgname}" "$pkgdir/usr/bin/quien"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    go clean -modcache
}

# vim: ts=4 sw=4 et:
