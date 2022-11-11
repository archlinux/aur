pkgname=headscale
pkgver=0.16.4
pkgrel=1
pkgdesc="An open source, self-hosted implementation of the Tailscale coordination server."
arch=('any')
url="https://github.com/juanfont/headscale"
license=('BSD')
depends=()
makedepends=('go')
optdepends=(
	'wireguard-tools: CLI tools for generating keys'
	'postgresql: alternative database provider'
)
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/derp.yaml")

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/juanfont/headscale/archive/refs/tags/v${pkgver}.tar.gz"
	'headscale.service'
	'headscale.sysusers'
	'headscale.tmpfiles'
)
sha256sums=('0395478f9dde68aa8ca23be8df6ff636d47166981d0995e4e31a8c7db12df8e8'
            '3cae7a3bfbb70bfda8dc4323d27cdcde0d841d1b3335c0f10525907eb3f6e650'
            '059353f4843dec6eb447c567fac890ef63cc9c8acea18840fcfc3f4a76d596db'
            '8a22d7193ceeac0be32725cf8108f963be3a21855e6099de964f810094d0adc7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
	sed -i 's-/var/run/headscale\.sock-/var/run/headscale/headscale\.sock-' config-example.yaml
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -D -m644 "config-example.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -D -m644 "config-example.yaml" "${pkgdir}/usr/share/${pkgname}/config-example.yaml"

	install -D -m644 "derp-example.yaml" "${pkgdir}/etc/${pkgname}/derp.yaml"
	install -D -m644 "derp-example.yaml" "${pkgdir}/usr/share/${pkgname}/derp-example.yaml"

	install -D -m644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -D -m644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -D -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
