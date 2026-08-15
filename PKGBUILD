# Maintainer: RubenKelevra <rubenkelevra@gmail.com>

pkgname=tunnel-client
pkgver=0.0.11
pkgrel=1
pkgdesc='Connect private MCP servers to OpenAI-hosted products through a secure tunnel'
arch=(
	'x86_64'
	'aarch64'
)
url='https://github.com/openai/tunnel-client'
license=('Apache-2.0')
depends=(
	'ca-certificates'
)
makedepends=(
	'go'
)
optdepends=(
	'cloudflared: supervise a Cloudflare Tunnel when configured'
	'xdg-utils: open the embedded web UI in the default browser'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}@.service"
)
b2sums=(
	'3dca23e7b1c274785cba4645ea409c2c277dcd9c6ef058263e49463953b7964be2c774effb60a56cd485acd7d9363150d890694378da3382e30fbedf5dedbdf9'
	'b74c5f3fe7b69ee0b861e98d42dca668529ca6e883fb51b16f0ac5954d6e2f4d2540174d87b885dbef1baa4880ecc6bd779abd4234720d538e2408a9a5e09632'
)

prepare() {
	cd -- "${pkgname}-${pkgver}" || return 1
	go mod vendor
}

build() {
	cd -- "${pkgname}-${pkgver}" || return 1

	export CGO_ENABLED=0
	export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -buildvcs=false'
	export GOTOOLCHAIN=local

	go build \
		-o "${pkgname}" \
		./cmd/client
}

package() {
	cd -- "${pkgname}-${pkgver}" || return 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
