# Maintainer: VCalV

pkgname="landrun"
_user="Zouuup"
pkgver=0.1.15
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
sha512sums=('387b8f37318b295baa781ede946fdbf2a2e3564f66673c8cccd6ed4f04393a5422cc493e484c0ff20b8fcb861a5aef96276f8b6fe9ca31f8b418464b104ed266')

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
