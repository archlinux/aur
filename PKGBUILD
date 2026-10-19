pkgname=bashd-ls
pkgver=0.3.0
pkgrel=1
pkgdesc="Bash language server"
arch=(x86_64)
url=https://github.com/matkrin/bashd
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
optdepends=('shellcheck: The shellcheck integration')
source=("${pkgname%-ls}-$pkgver.tar.gz::https://github.com/matkrin/bashd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('648e28e36d0344f765088c3a5171b239afd933f94413bdc70d852dfa519c92fe')

prepare() {
    cd "${pkgname%-ls}-$pkgver"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${pkgname%-ls}-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    go build -ldflags "-X main.VERSION=$pkgver -compressdwarf=false -linkmode external" \
        -o "$pkgname" \
        "./cmd/${pkgname%-ls}"
}

package() {
    cd "${pkgname%-ls}-$pkgver"
    install -Dvm755 "$pkgname" -t "$pkgdir/usr/bin"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dvm644 docs/${pkgname%-ls}.1 -t "$pkgdir/usr/share/man/man1"
}
