# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.44.3
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/k14s/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("bbc5170e4eacada904daf02e65657cfe3afe2c94c2ff2964ece5e54827c641c8dd92bc56eebdb6b169c87bc4c5e1a8cce63d080906c1a411f95fd02dec676305")

prepare() {
    rm -rf "${srcdir}/src/github.com/k14s/${pkgname}"
    mkdir -p "${srcdir}/src/github.com/k14s/${pkgname}"
    mv -T "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/k14s/${pkgname}"
}

build() {
    cd "${srcdir}/src/github.com/k14s/${pkgname}"
    
    export GOPATH="${srcdir}"
    export LDFLAGS="-X github.com/vmware/tanzu/carvel-ytt/pkg/version.Version=$pkgver"
    rm -f website/generated.go
    go fmt $(go list ./... | grep -v yaml.v2)
    go mod vendor
    go mod tidy
    rm -f pkg/website/generated.go
    go build -ldflags="${LDFLAGS}" -trimpath -o "ytt" "./cmd/ytt/..."
    ./ytt version
    go build -ldflags="${LDFLAGS}" -trimpath -o "./tmp/main" "./cmd/ytt-lambda-website/..."
}

package() {
	cd "${srcdir}/src/github.com/k14s/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
