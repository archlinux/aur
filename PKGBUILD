# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ctags-lsp
pkgver=0.10.2
pkgrel=1
pkgdesc='LSP implementation using universal-ctags as backend'
url='https://github.com/netmute/ctags-lsp'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
optdepends=('gcc: gcc backend support'
    'clang: clang backend support'
    'zig: zig backend support')
makedepends=(go)
provides=(ctags-lsp)
conflicts=(${pkgname%-*})
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ec3fdcaca155811ad9b532c6e7b5366d2f0e52d4d673c97652c9f8af8a156b8')
# validpgpkeys=()

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
    install -Dm0755 build/ctags-lsp "$pkgdir/usr/bin/ctags-lsp"
}
