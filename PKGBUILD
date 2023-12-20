# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
# Maintainer: noobping <hello (at) noobping _dot_ dev>
# Contributor: k8ieone <rostik.medved (at) gmail _dot_ com>
# Contributor: satcom886 <rostik.medved (at) gmail _dot_ com>
#
# PKGBUILD based on bobpaul's ${pkgname}-git package

pkgname=maubot
pkgver=0.4.2
pkgrel=1
pkgdesc="A plugin-based Matrix bot system"
arch=(any)
license=(AGPL3)
url="https://github.com/maubot/maubot"
depends=('sudo' 'python-sqlalchemy' 'python-aiohttp' 'python-aiosqlite' 'python-asyncpg' 'python-attrs' 'python-bcrypt' 'python-click' 'python-colorama' 'python-commonmark' 'python-jinja' 'python-mautrix' 'python-packaging' 'python-questionary' 'python-ruamel-yaml' 'python-yarl')
makedepends=('python-pre-commit' 'python-isort' 'python-black' 'yarn')
optdepends=(
  "python-olm: e2be"
  "python-pycryptodome: e2be"
  "python-unpaddedbase64: e2be"
)
backup=(etc/${pkgname}/config.yaml)
install=${pkgname}.install
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"${url}/archive/v${pkgver/_rc/-rc}.tar.gz"
    "sysusers-${pkgname}.conf"
    "tmpfiles-${pkgname}.conf"
    "${pkgname}.service")
sha256sums=('f8a6d03cba8a9e92ed20c31ea5080c8b9b0876a2e692207e4de293dbed513bd2'
            '1c28db3c74b2d634f97b25c3b117a5d8198dbb3c8afb1fa31a429ab3479334b7'
            '3fda190e5e5a2dff7c6192c27427a902c286069fac6b56e9abf61b021d49bf9a'
            '8dfbed8ad630cc5ab0e111a7e5da3245ddf82881a00ed6b540bfdcb7ece33083')

prepare() {
  cd "${pkgname}-${pkgver/_rc/-rc}"
  msg2 'Applying patch to permit use of newest mautrix version'
  sed -i -E "s/([0-9a-z_.-]+).=.*/\1/" requirements.txt optional-requirements.txt
  msg2 'Build static files for management frontend'
  cd "${pkgname}/management/frontend"
  yarn -s
  yarn build -s
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_rc/-rc}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd "${pkgname}"
  install -Dm600 example-config.yaml ${pkgdir}/etc/${pkgname}/config.yaml
  install -Dm600 example-config.yaml ${pkgdir}/usr/share/${pkgname}/example-config.yaml

  cd "${srcdir}/"
  install -Dm644 ${pkgname}.service -t  ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 sysusers-${pkgname}.conf ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 tmpfiles-${pkgname}.conf ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf

  rm ${pkgdir}/usr/example-config.yaml
}
