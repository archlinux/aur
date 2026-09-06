# Maintainer: Iceflower S <iceflower@iceflower.eu>

pkgname=xddns
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic DNS updater"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/IceflowRE/xddns"
license=("MIT")
makedepends=("go")
options=("!debug")
backup=("etc/${pkgname}.yaml")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.example.yaml")
sha256sums=('2cfa4ea186dcb562e6cac4888702bcfa51cb47fe0f8f76e62fe771a6ea72848c'
            '3e8537e61d51dd4c47879444ab5275514d4da9ba172d57d7fdbba3d2e40f964f'
            '39604d099204cf6318ede27df796b93c2f542a5e50b30670a22bbeaaf2e1c2e0'
            'f4ae82d484fd94e54627e222096f974cd0b64943b717a374c295f91cf3965722')

prepare() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

check() {
	cd "${pkgname}-${pkgver}"
	go test -failfast ./...
}

build() {
	cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0

    go build \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -trimpath \
        -buildvcs=false \
        -ldflags "-bindnow -s -w -X github.com/iceflowre/xddns/xddns/internal.version=v${pkgver}" \
        -o "build/${pkgname}" \
        "./cmd/${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

	install -Dm644 "${srcdir}/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm600 "${srcdir}/${pkgname}.example.yaml" \
		"${pkgdir}/etc/${pkgname}.yaml"
}
