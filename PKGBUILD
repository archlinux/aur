pkgname="carapace"
pkgver=1.0.7
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://carapace.sh/"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('bfcd950178023909b0854bc6bded5b57d1c00123943e9dbcdfddf2a632c71ff4')

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
