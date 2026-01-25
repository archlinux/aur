# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=bit-font
_pkgname=bit
pkgver=0.3.0
pkgrel=2
pkgdesc='CLI/TUI Logo Designer + ANSI Font Library with Gradients, Shadows, and Multi-Format Export'
url='https://github.com/superstarryeyes/bit'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
makedepends=(go)
provides=('bit' 'ansifonts')
conflicts=('bit-font-git')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('b58bf458db0d8f2f5ee48628bcc9b7aaacccda0ab7d4216c5e404aa0e83e02f2'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

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
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/bit
    go build -o build ./cmd/ansifonts
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755  build/bit "$pkgdir/usr/bin/bit"
    install -Dm0755  build/ansifonts "$pkgdir/usr/bin/ansifonts"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
