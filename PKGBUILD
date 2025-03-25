# Maintainer: VCalV

pkgname="landrun"
_user="Zouuup"
pkgver=0.1.12
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
  "test.patch"
)
sha512sums=('05a39777e5e7d740a1606fea66a975b8efcea440cc2fdea19bebc68f649e01422780e287d840b9eb864e545e34b13a76f4096292df591a438c7247856d9eac16'
            '3e5a283fbcf9c65af5a5390048d0c73fa97cbc9eba9b14a761a1dadcc3f2e58ff7b71985fd8394d0b2d4b246b3b25379c2eaa3c2b1284cda421a57eba8e290be')

prepare() {
    cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="../test.patch"
}

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

    ./test.sh --keep-binary
}


package() {
    cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
    install -Dm755 landrun "${pkgdir}/usr/bin/${pkgname}"
}
