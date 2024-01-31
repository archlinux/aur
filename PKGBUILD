pkgname="carapace"
pkgver=0.30.1
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://rsteube.github.io/carapace-bin/"
license=("MIT")
makedepends=("go")
source=(
    "https://github.com/rsteube/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ffccf041d14e7eb633750539f00c0cc81e3ca7d3da3b86db4f5798cde63a8b5f')

build(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go generate ./cmd/...
    go build -v -ldflags="-X main.version=v${pkgver}" ./cmd/carapace

}
check(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    go test -v ./cmd/...
}
package(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    install -Dm755 carapace \
        "${pkgdir}/usr/bin/carapace"
}
