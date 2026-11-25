# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gpk
_pkgname=glazepkg
pkgver=0.7.0
pkgrel=1
pkgdesc='See all your installed packages in one place.'
url='https://github.com/neur0map/glazepkg'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
license=('GPL-3.0-or-late')
makedepends=('go')
provides=('gpk')
conflicts=('gpk-git' 'gpk-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2571f6005046d77dee9d5f0f4d2e5981887988d43c3cf6c8d1da5e8aa7d91c48')

prepare() {
    cd "${_pkgname}-${pkgver}"
    # export GOPATH="${srcdir}"
    # go mod download -modcacherw
    mkdir -p build
}

build() {
    cd "${_pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -tags noselfupdate -ldflags="-linkmode=external -X main.version=${pkgver}" -o build ./cmd/gpk
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755  build/gpk "$pkgdir/usr/bin/gpk"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
