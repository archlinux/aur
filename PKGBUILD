# Maintainer: Acxtrilla <acxtrilla@proton.me>
# Contributor: vmfunc (Celeste Hickenlooper) <https://github.com/vmfunc>

pkgname=sif
pkgver=2026.01.06
pkgrel=1
_tag=automated-release-cb22206
pkgdesc="A blazing-fast modular pentesting toolkit written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/vmfunc/sif"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go>=1.24')
optdepends=(
    'nuclei: for vulnerability scanning with nuclei templates'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmfunc/sif/archive/refs/tags/$_tag.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$_tag"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -o sif ./cmd/sif
}

check() {
    cd "$pkgname-$_tag"
    go test ./...
}

package() {
    cd "$pkgname-$_tag"
    install -Dm755 sif "$pkgdir/usr/bin/sif"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
