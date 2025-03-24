# Maintainer: VCalV

pkgname="landrun"
_user="Zouuup"
pkgver=0.1.11
pkgrel=2
pkgdesc="Run any Linux process in a secure, unprivileged sandbox using Landlock LSM"
arch=('x86_64')
url="https://github.com/${_user}/${pkgname}"
license=('LGPL-2.0-only')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=()
makedepends=(go)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "test.patch"
)
sha512sums=(
    '06d221a26a15d4bb6a149b1a0fa683c3a0dd920a26e802acbd8a4d35417e7659c53fbe06a7e1ab82b7ca0e5045ef592a2497e7a73dc062d0f3d420546bb14191'
    '5aed5a500cec87cb3ecf63454edc74e8ccfa5f28527b1fe9248b0842d078069302f777dc20d070b5a98009be0e019ece4b62035f9c66ce193954308976f4ba12'
)

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

    ./test.sh
}


package() {
    cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
    install -Dm755 landrun "${pkgdir}/usr/bin/${pkgname}"
}
