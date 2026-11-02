pkgname="carapace"
pkgver=1.8.2
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://carapace.sh/"
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/carapace-sh/carapace-bin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('56b934e1c94cb4e10d912c0158a74f8b727e430e6d9c8aff5bfb99e124fa3ace')

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
    CGO_ENABLED=0 go build -v -ldflags="-s -w -X main.version=v${pkgver} -compressdwarf=false -bindnow" \
        -tags "release,force_all" \
        ./cmd/carapace

}
package(){
    cd "${srcdir}/carapace-bin-${pkgver}"
    install -Dm755 carapace \
        "${pkgdir}/usr/bin/carapace"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/carapace/LICENSE"
}
