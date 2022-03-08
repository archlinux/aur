pkgname=headscale
pkgver=0.14.0
pkgrel=1
pkgdesc="An open source, self-hosted implementation of the Tailscale coordination server."
arch=('any')
url="https://github.com/juanfont/headscale"
license=('BSD')
depends=('tailscale')
makedepends=('go')
optdepends=(
	'wireguard-tools: CLI tools for generating keys'
	'postgresql: alternative database provider'
)
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}/config.yaml")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/juanfont/headscale/archive/refs/tags/v${pkgver}.tar.gz"
	'headscale.service'
)
sha256sums=('aabbc69c7ba1c3da70a34256fe53e8bb3897b19fb70ff03dfc01f06847a11e93'
            '000457ad0cfaca8513c0f1be5b0a04beb673576e019c7184e5fb3a78e57738ab')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -v -o headscale -ldflags "-s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=${pkgver}" ./cmd/headscale
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "config-example.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
