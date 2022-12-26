# Maintainer: olddog <jeff@impcode.com>
# Contributer: kaptoxic
# Contributor: carloratm <carlo.ratm@gmail.com>

pkgname=barman
_realname=barman
pkgver=3.3.0
pkgrel=1
pkgdesc="Backup and recovery manager for PostgreSQL"
arch=('x86_64')
url="http://www.pgbarman.org"
license=('GPL3')
depends=('rsync' 'python' 'python-argh' 'python-psycopg2' 'python-dateutil' 'python-argcomplete')
makedepends=('python-distribute' 'python-sphinx' 'python-mock' 'python-pytest' )  # 'python-sphinx-bootstrap-theme' is in the AUR
optdepends=('python-boto3' 'python-botocore')
provides=('barman')
options=(!emptydirs)

source=(
  "https://github.com/EnterpriseDB/barman/releases/download/release/${pkgver}/barman-${pkgver}.tar.gz"
  barman.crond
  barman.logrotate
  passive-server.conf-template
  ssh-server.conf-template
  streaming-server.conf-template
)

md5sums=('fa17aa790e7bd8d19e371710f022bc96'
         '0e48345895f88b3939543c00928a199b'
         '58c5b20b8e1272ab4ce46757f6613e0d'
         'b43254374978938f7d21035a3356b531'
         'a98247fde653192d5587fff0c2b7b5fe'
         '6dda5a4abca99443e8956ffa719d0ce0')

package()
{
  cd "${srcdir}/barman-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 || exit 1

  # install LICENSE file
  install -Dm 0644 LICENSE -t      "${pkgdir}/usr/share/licenses/${pkgname}"

  # install docs
  install -Dm 0644 README.rst -t   "${pkgdir}/usr/share/doc/${pkgname}"

  # install the bash_completion
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  install -m 0644 scripts/barman.bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"

  # install example files
  cd doc
  install -Dm 0644 barman.conf -t  "${pkgdir}/usr/share/doc/${pkgname}/etc/"

  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/etc/cron.d/" \
           "${pkgdir}/usr/share/doc/${pkgname}/etc/barman.d/" \
           "${pkgdir}/usr/share/doc/${pkgname}/etc/logrotate.d/"
  install -m 0644 barman.crond     "${pkgdir}/usr/share/doc/${pkgname}/etc/cron.d/barman"
  install -m 0644 barman.logrotate "${pkgdir}/usr/share/doc/${pkgname}/etc/logrotate.d/barman"
  install -Dm 0644 passive-server.conf-template -t   "${pkgdir}/usr/share/doc/${pkgname}/etc/barman.d/"
  install -Dm 0644 ssh-server.conf-template -t       "${pkgdir}/usr/share/doc/${pkgname}/etc/barman.d/"
  install -Dm 0644 streaming-server.conf-template -t "${pkgdir}/usr/share/doc/${pkgname}/etc/barman.d/"

}

