pkgname="carapace"
pkgver=1.0.3
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://rsteube.github.io/carapace-bin/"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=(
    "https://github.com/rsteube/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('e1c63fd3d24b0bc5176b9c17a245763761e082185b30b4227f4f25dd10e70871')

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
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/carapace/LICENSE"
}
