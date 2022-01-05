# Maintainer: Frédéric Tobias Christ <dev+mautrix-signal@ntr.li> <ftchrist:matrix.org>
pkgname='mautrix-signal'
pkgver=0.2.1
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge"
arch=('any')
url="https://github.com/tulir/mautrix-signal"
license=('AGPLv3')
depends=('python-aiohttp>=3' 'python-asyncpg>=0.20' 'python-attrs>=19.1' 'python-commonmark>=0.8' 'python-mautrix' 'python-magic>=0.4' 'python-ruamel-yaml>=0.15.35' 'signald>=0.15' 'python-yarl>=1' )
makedepends=('python-setuptools')
#checkdepends
optdepends=(
'python-phonenumbers>=8'
'python-pillow>=4: webp conversion and qr code login'
'python-prometheus_client>=0.6: metrics upload'
'python-pycryptodome>=3'
'python-olm>=3: end-to-bridge encryption support'
'python-qrcode>=6: qr code login'
'python-signalstickers-client>=3'
'python-unpaddedbase64: end-to-bridge encryption support')
backup=("etc/${pkgname}/config.yaml")
install="${pkgname}.install"
source=( "${url}/archive/refs/tags/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('68ea168db3d7a99b52f84a9d1d6f96bf914e31a5787b6d4d97923974156a09c4'
            '87a479c5216fa79dbe20ff776f67f5ab70ad0f9705da4b274cc662003545c4be'
            '3203dcff48579a2420eff4289a03ea1b3a9f47031c39f514e8c9a2d119625725'
            '5badc8727dfbf4531f93e86ae475c64753952ee60090a043be22b9dd9a124ca5')

prepare() {
    mv "${srcdir}/signal-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
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
