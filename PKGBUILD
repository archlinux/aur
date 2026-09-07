# Maintainer: Iceflower S <iceflower@iceflower.eu>

pkgname=xddns
pkgver=0.2.0
pkgrel=2
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
sha256sums=('4f81c304f239cf8777aa16b006186d33a2572fef52c76bdb1ded425df7f96db4'
            'b99b90b2ae36c77ce0092df8b87c24298e70c51125e61ec729fecf1d4557d5dc'
            '39604d099204cf6318ede27df796b93c2f542a5e50b30670a22bbeaaf2e1c2e0'
            'aea197172d4ba31207f19daa61f417f4ad9244415322f19df8481beebdc08ccf')

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
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

	install -Dm644 "${srcdir}/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm600 "${srcdir}/${pkgname}.example.yaml" \
		"${pkgdir}/etc/${pkgname}.yaml"
}
