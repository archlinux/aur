# Maintainer: noobping <hello (at) noobping _dot_ dev>

pkgname=matrix-registration-bot
pkgver=1.1.5
pkgrel=1
pkgdesc="A bot that is used to create and manage registration tokens for a matrix server"
arch=(any)
license=(AGPLv3)
url="https://github.com/moan0s/matrix-registration-bot/"
depends=('python-pyaml' 'python-aiohttp' 'python-pytest' 'python-simplematrixbotlib' 'python-cachetools' 'python-atomicwrites' 'python-peewee')
makedepends=('python-setuptools')
optdepends=(
  "python-olm: e2be"
  "python-pycryptodome: e2be"
  "python-unpaddedbase64: e2be"
)
backup=(etc/${pkgname}.yaml)
install=${pkgname}.install
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"${url}/archive/v${pkgver/_rc/-rc}.tar.gz"
    "sysusers-${pkgname}.conf"
    "tmpfiles-${pkgname}.conf"
    "${pkgname}.service")
sha256sums=('1bf1a90b5437ae3957d6cf8b98842abdc9754960a2c38cde2fcb1a1e1ca91670'
            'c0eae8f31f2dc2138dffe56a962fdc7260196368ec71c517754cff361ba581ce'
            '0f046e2d55d96dfe623934835df39b044e8598b99eb881a8f5e7215a4c956602'
            'ee6184309496fab44bc0b6a132d25b340f9d0f66af7ccd3a93250844d56c54c4')

package() {
  cd "${srcdir}/"
  install -Dm644 ${pkgname}.service -t  ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 sysusers-${pkgname}.conf ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 tmpfiles-${pkgname}.conf ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf

  cd "${pkgname}-${pkgver/_rc/-rc}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm600 example_config.yml ${pkgdir}/etc/${pkgname}.yaml
}
