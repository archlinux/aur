# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dol
pkgver=0.1.2
pkgrel=1
pkgdesc='Detect dark/light mode on the CLI'
url='https://github.com/netmute/dol'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
makedepends=('go')
provides=('dol')
conflicts=('dol-git' 'dol-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('c9f915413dc11f796f3c223e86d24c56878c6fc692919d58685631362d810c67'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

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
