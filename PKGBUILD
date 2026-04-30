pkgname="carapace"
pkgver=1.6.5
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://carapace.sh/"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0d3f3d2c60acc48bce48d27810ca510388699ca1d5a4db2fd154a22797a601e')

prepare() {
    cd "${srcdir}/carapace-bin-${pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}
build(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    go generate ./cmd/...
    go build -v -ldflags="-X main.version=v${pkgver} -linkmode external -compressdwarf=false -bindnow" ./cmd/carapace

}
package(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    install -Dm755 carapace \
        "${pkgdir}/usr/bin/carapace"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/carapace/LICENSE"
}
