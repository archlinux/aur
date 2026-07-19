# Maintainer: RubenKelevra <rubenkelevra@gmail.com>

pkgname=tunnel-client
pkgver=0.0.10
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
b2sums=('cb7b64612e08dd958ed2e10db7ba8f2e31b4f238b14d8f8c9ba959b5e7fc9924521bc9fa41b03ac21b042ab633c15287e6dcbbcd4d1f858fb1341422b75ff009'
        'b74c5f3fe7b69ee0b861e98d42dca668529ca6e883fb51b16f0ac5954d6e2f4d2540174d87b885dbef1baa4880ecc6bd779abd4234720d538e2408a9a5e09632')

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_ENABLED=0
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false'
	export GOTOOLCHAIN=local

	go build \
		-o "${pkgname}" \
		./cmd/client
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}@.service" -t "${pkgdir}/usr/lib/systemd/system"
}
