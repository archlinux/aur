pkgname=headscale
pkgver=0.12.1
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

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/juanfont/headscale/archive/refs/tags/v${pkgver}.tar.gz"
	'headscale.service'
)
sha256sums=('8f9592e91b9a6dcdecc947810cd67d0fcb29c5e188557f8015794b5afd1f393a'
            'db54439a60d6efdc812bc9d1cbe9fecc1d7134398a75f88927b561ebcb8d5cba')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -v -o headscale -ldflags "-s -w -X github.com/juanfont/headscale/cmd/headscale/cli.Version=${pkgver}" ./cmd/headscale
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "config-example.yaml" "${pkgdir}/etc/${pkgname}/config.json"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}
