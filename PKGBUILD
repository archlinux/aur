# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
pkgname=prometheus-bird-exporter
pkgver=1.2.5
pkgrel=1
pkgdesc='Bird protocol state exporter for bird routing daemon to use with Prometheus'
arch=('x86_64')
url='https://github.com/czerwonk/bird_exporter'
license=('MIT')
depends=('bird')
makedepends=('go')
conflicts=("${pkgname}-git")
backup=("etc/default/${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/czerwonk/bird_exporter/archive/1.2.5.tar.gz"
        "${pkgname}.service"
        "envvars")
sha512sums=('d10b38f40570a672b9555a97a072e0671add5db8a4124b986fa70d4da069545bce2299129c692f15a1fbe9be40dc14e061bf486f68df8ab4ae2c7c51a3ada763'
            'c4fd4be00e8030702c323c364853a08f21ff27e47a0b20e0b4f6e5a9b6ebc1a4f6a15c1eace25bf677354904659340a5ec0b518846cfcd7c865423edd175188d'
            'e7495d7ca7fc54cc47dc73ac9542b9741810603d9312f9c386fc7e6ce3081e484ff3e13c8c2cbdc12935826d5b198cb06edb00266a3335f65aeae8b4147278f6')

build() {
	cd "${srcdir}/bird_exporter-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -trimpath -buildmode=pie -mod=readonly -modcacherw \
        -ldflags "-extldflags \"${LDFLAGS}\"" -o "${pkgname}"

    # TODO: Convert bird_exporter.1.md?
    # https://github.com/czerwonk/bird_exporter/issues/37
}

package() {
	cd "${srcdir}/bird_exporter-${pkgver}/"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/envvars" "${pkgdir}/etc/default/${pkgname}"
}
