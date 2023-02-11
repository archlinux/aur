# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname=ytt
_ns="k14s"
pkgname="${_pkgname}-git"
pkgver=r1176.292f57d
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("git+https://github.com/${_ns}/${_pkgname}/")
sha256sums=('SKIP')
provides=("ytt")
conflicts=("ytt")

pkgver() {
	cd "${srcdir}/src/github.com/${_ns}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "${srcdir}/src/github.com/${_ns}/${_pkgname}"
	mkdir -p "${srcdir}/src/github.com/${_ns}/${_pkgname}"
	mv -T "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/${_ns}/${_pkgname}"
}

build() {
    cd "${srcdir}/src/github.com/${_ns}/${_pkgname}"
    
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
	cd "${srcdir}/src/github.com/${_ns}/${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
