pkgname="carapace"
pkgver=1.7.0
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://carapace.sh/"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('602129487eb5df2f67f659438e1b76c18a2b25dc1cdbed396ddf544a75fad45c')

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
