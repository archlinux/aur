# Maintainer: noobping <hello (at) noobping _dot_ dev>
# Contributor: k8ieone <rostik.medved (at) gmail _dot_ com>
# Contributor: satcom886 <rostik.medved (at) gmail _dot_ com>
#
# PKGBUILD based on bobpaul's ${pkgname}-git package

pkgname=maubot
pkgver=0.3.1
pkgrel=1
pkgdesc="A plugin-based Matrix bot system"
arch=(any)
license=(AGPLv3)
url="https://github.com/maubot/maubot"
depends=(
	'sudo'
  'python-sqlalchemy>=1'
  'python-aiohttp>=3'
  'python-aiosqlite>=0.16'
  'python-asyncpg>=0.20'
  'python-attrs>=18.1.0'
  'python-bcrypt>=3'
  'python-click>=7'
  'python-colorama>=0.4'
  'python-commonmark>=0.9'
  'python-jinja>=2'
  'python-mautrix>=0.15.5'
  'python-packaging>=10'
  'python-questionary>=1'
  'python-ruamel-yaml>=0.15.35'
  'python-yarl>=1'
)
makedepends=('python-pre-commit>=2.10.1' 'python-isort>=5.10.1' 'python-black>=22.3' 'yarn')
optdepends=(
  "python-olm: e2be"
  "python-pycryptodome: e2be"
  "python-unpaddedbase64: e2be"
)
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"${url}/archive/v${pkgver/_rc/-rc}.tar.gz"
    "maubot-db-upgrade"
    "sysusers-maubot.conf"
    "tmpfiles-maubot.conf"
    "maubot.service")
sha256sums=('f3189ab1846274efe20649ecd31943a1c7b12ecb52d845e62d8e7a0fdf3db933'
            '4755b413047ab20905499e487c42a4d0d8ee52161c3921c8fba3682248575e3a'
            'e2f01fd60338dd576bb72dee2f536210cb54540ace4a40aa94b5aebe6944ba0f'
            'b29dfcccd4012c117918e9210f01e7c28aa9b7e05c592811a71af0a4ba255770'
            '8b24bc78b2c390a201d4d0a31bb949c810365c6d656a4c5bb331e35b38931b57')

prepare() {
  cd "${pkgname}-${pkgver/_rc/-rc}"
  msg2 'Applying patch to permit use of newest mautrix version'
  sed -i 's/^mautrix==/mautrix>=/' requirements.txt
  # I don't think we need ^^^^ this
  # (actually we need that...)
  msg2 'Build static files for management frontend'
  cd "${pkgname}/management/frontend"
  yarn -s
  yarn build -s
}

package() {
  cd "$srcdir/${pkgname}-${pkgver/_rc/-rc}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  cd "${pkgname}"
  install -D -m760 -o${pkgname} example-config.yaml ${pkgdir}/etc/${pkgname}/config.yaml

  cd "$srcdir/"
  install -Dm755 maubot-db-upgrade -t $pkgdir/usr/bin/
  install -Dm644 maubot.service -t  ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 sysusers-maubot.conf $pkgdir/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 tmpfiles-maubot.conf $pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf

  rm $pkgdir/usr/example-config.yaml
  install -Dm700 -o${pkgname} -g${pkgname} -d $pkgdir/var/lib/${pkgname}/{plugins,trash,logs}
}
