# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ctags-lsp-git
_pkgname="${pkgname%-git}"
pkgver=0.11.0.r8.gfe3d1f8
pkgrel=1
pkgdesc='LSP implementation using universal-ctags as backend - Build from the main branch'
url='https://github.com/netmute/ctags-lsp'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
depends=('ctags')
makedepends=('go' 'git')
provides=('ctags-lsp')
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
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o build -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
    cd "$_pkgname"
    install -Dm0755 build/ctags-lsp "$pkgdir/usr/bin/ctags-lsp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
