# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ctags-lsp-git
_pkgname="${pkgname%-git}"
pkgver=0.10.2.r10.gcddb8c7
pkgrel=1
pkgdesc='LSP implementation using universal-ctags as backend - Built from the main bransh'
url='https://github.com/netmute/ctags-lsp'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
makedepends=(go)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    # export GOPATH="${srcdir}"
    # go mod download -modcacherw
    mkdir -p build
}

build() {
    cd "$_pkgname"
    export GOPATH="${srcdir}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/ctags-lsp" build/ctags-lsp
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}
