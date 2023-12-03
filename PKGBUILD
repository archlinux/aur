# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: Frédéric Tobias Christ <dev+mautrix-signal@ntr.li> <ftchrist:matrix.org>
pkgname='mautrix-signal'
pkgver=0.4.3
pkgrel=3
pkgdesc="A Matrix-Signal puppeting bridge"
arch=('any')
url="https://github.com/mautrix/signal"
license=('AGPL')
depends=(
  'python-aiohttp'
  'python-asyncpg'
  'python-attrs'
  'python-commonmark'
  'python-mautrix'
  'python-magic'
  'python-ruamel-yaml'
  'python-yarl' 
  'signald'
)
makedepends=('python-setuptools')
optdepends=(
  'python-aiosqlite: Support for SQLite-Database '
  'python-olm: end-to-bridge encryption support'
  'python-phonenumbers: Formatted phone numbers'
  'python-pillow: webp conversion and qr code login'
  'python-prometheus_client: metrics upload'
  'python-pycryptodome'
  'python-qrcode: qr code login'
  'python-signalstickers-client: stickers'
  'python-unpaddedbase64: end-to-bridge encryption support'
)
backup=(
  "etc/${pkgname}/config.yaml"
  "etc/${pkgname}/registration.yaml"
)
install="${pkgname}.install"
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('e75636e845d4b9d84070efec510b7358b93a4fb0d6ffe4300dbdb9260725ba53'
            '8990ebe7df080cd6eddd5af17b49dbf4c4b5e5216b8211b5afc9cf096f38cd5f'
            '3203dcff48579a2420eff4289a03ea1b3a9f47031c39f514e8c9a2d119625725'
            '5badc8727dfbf4531f93e86ae475c64753952ee60090a043be22b9dd9a124ca5')

prepare() {
  mv "${srcdir}/signal-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  touch registration.yaml
    
  # Adapt signald paths for convenience
  sed -i "s|~/.config/signald/avatars|/var/lib/signald/avatars|g" mautrix_signal/example-config.yaml
  sed -i "s|~/.config/signald/data|/var/lib/signald/data|g" mautrix_signal/example-config.yaml
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
