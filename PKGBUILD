# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=subctl
pkgver=0.20.0
pkgrel=0
pkgdesc='The subctl command-line utility simplifies the deployment and maintenance of Submariner by automating interactions with the Submariner Operator and providing diagnostic features.'
arch=(x86_64)
url='https://github.com/submariner-io/subctl'
license=(Apache)
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/submariner-io/subctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {

    local -a x=(
        github.com/submariner-io/subctl/pkg/version.Version=v${pkgver}
    )
    cd "${pkgname}-${pkgver}"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_CFLAGS="$CFLAGS -fno-lto"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o ./subctl -ldflags "${x[*]/#/-X=} -linkmode=external" ./cmd/
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 subctl "$pkgdir/usr/bin/subctl"

    install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}   
