# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dol
pkgver=0.2.0
pkgrel=1
pkgdesc='Detect dark/light mode on the CLI'
url='https://github.com/netmute/dol'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
makedepends=('go')
provides=('dol')
conflicts=('dol-git' 'dol-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae9f26e680a1f229ee9896e8b29fc95b78a1b27e00f5442aebb6074d9c1c7461')

prepare() {
    cd "${pkgname}-${pkgver}"
    # export GOPATH="${srcdir}"
    # go mod download -modcacherw
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755  build/dol "$pkgdir/usr/bin/dol"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
