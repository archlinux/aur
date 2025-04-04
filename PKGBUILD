# Maintainer: VCalV

pkgname="landrun"
_user="Zouuup"
pkgver=0.1.14
pkgrel=1
pkgdesc="Run any Linux process in a secure, unprivileged sandbox using Landlock LSM"
arch=('x86_64')
url="https://github.com/${_user}/${pkgname}"
license=('MIT')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=()
makedepends=(go)
checkdepends=(curl)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('54ada4a13b6fb3c61686a88fbd6e464c2f81b21fc0a5f8901eec546220e6f027ffa536d20c7db52cf3e018278e8d1079f7c3d990c3f81c8fb9f2d9e1c55b79d1')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o landrun cmd/landrun/main.go
}

check() {
    cd "${pkgname}-${pkgver}"

    ./test.sh --keep-binary --no-build
}


package() {
    cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
    install -Dm755 landrun "${pkgdir}/usr/bin/${pkgname}"
}
