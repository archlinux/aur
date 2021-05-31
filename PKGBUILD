# Maintainer: Frédéric Tobias Christ <develop+mautrix-signal@ntr.li> <ftchrist:matrix.org>
pkgname='mautrix-signal'
pkgver=0.1.1
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge"
arch=('any')
url="https://github.com/tulir/mautrix-signal"
license=('AGPLv3')
depends=('python-aiohttp>=3' 'python-asyncpg>=0.20' 'python-attrs>=19.1' 'python-commonmark>=0.8' 'python-mautrix' 'python-magic>=0.4' 'python-ruamel-yaml>=0.15.35' 'signald>=0.13.1' 'python-yarl>=1' )
makedepends=('python-setuptools')
#checkdepends
optdepends=(
'python-phonenumbers>=8'
'python-pillow>=4: webp conversion and qr code login'
'python-prometheus_client>=0.6: metrics upload'
'pycryptodome>=3'
'python-olm>=3: end-to-bridge encryption support'
'python-qrcode>=6: qr code login'
#'signalstickers-client>=3' does not exist yet
'python-unpaddedbase64: end-to-bridge encryption support')
backup=("etc/${pkgname}/config.yaml")
install="${pkgname}.install"
source=( "${url}/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('92b85eab45d9d2d165298b114a5ee47bb89f93a2c6bfa7a30a3d6a1bac4870b3'
            'd916d5fbe521416bd5a52e1f27da87e45a0f4206801173f2b86e6d63f62c3b34'
            '807da72f363ce3850e1bf98b3d3a7a00bf174a1035c91a853861fcc6b5f499fc'
            'b515feb2b6fd37f2b0e9e3a16d64c73b22fa12b4a8af8b13f212f1da02817f81')
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    touch registration.yaml
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    _shared_dir="/usr/share/${pkgname}"

    python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr" --install-data="${_shared_dir}"

    install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 "${pkgdir}${_shared_dir}/example-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
	install -Dvm 640 registration.yaml "${pkgdir}/etc/${pkgname}/registration.yaml"
}
