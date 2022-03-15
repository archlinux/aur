# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=headscale
pkgname="${_pkgname}-git"
pkgver=0.15.0.beta5.r2.g61440c4
pkgrel=1
pkgdesc="An open source, self-hosted implementation of the Tailscale coordination server."
arch=('x86_64')
url="https://github.com/juanfont/headscale"
license=('BSD')
depends=('tailscale')
makedepends=('git' 'go')
optdepends=(
	'wireguard-tools: CLI tools for generating keys'
	'postgresql: alternative database provider'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/juanfont/headscale.git"
	'headscale.service'
)
sha256sums=(
	'SKIP'
	'db54439a60d6efdc812bc9d1cbe9fecc1d7134398a75f88927b561ebcb8d5cba'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	install -D -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "${srcdir}/${_pkgname}/config-example.yaml" "${pkgdir}/etc/${_pkgname}/config-example.yaml"
	install -D -m644 "${srcdir}/${_pkgname}/config-example.yaml" "${pkgdir}/etc/${_pkgname}/config.yaml"
	install -D -m644 "${srcdir}/${_pkgname}/derp-example.yaml" "${pkgdir}/etc/${_pkgname}/derp.yaml"
	install -D -m644 "${srcdir}/${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
	install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d -m755 "${pkgdir}/var/lib/${_pkgname}"
}
