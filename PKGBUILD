# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-core')
_pkgbase='mailman'
_commit=5bd0f593724f9a696bbefc91ea9c2127b66fa231
pkgver=3.0.0
pkgrel=1
pkgdesc="A mailing list management system"
arch=(any)
conflicts=('mailman')
makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-zope-interface' 'python-zope-event' 'python-zope-configuration'
         'python-zope-component' 'python-passlib' 'python-nose2' 'python-httplib2'
         'python-flufl-lock' 'python-flufl-i18n' 'python-flufl-bounce' 'python-falcon'
         'python-alembic' 'python-lazr-config' 'python-lazr-smtptest' 'python-mock'
         'python-sqlalchemy' 'postfix')
optdepends=('python-mailman-hyperkitty-plugin: Plugin to send emails to Hyperkitty for archival')
url="https://gitlab.com/mailman/mailman"
license=('LGPL')
options=(!emptydirs)
install=$pkgname.install
backup=('var/lib/mailman/var/etc/mailman.cfg')
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman/repository/archive.tar.gz?ref=${pkgver}"
				'mailman.sysusers'
        'mailman.service'
        'mailman.cfg')
sha256sums=('0cc28e99bbe5a8e0638f9437d1fa8490fb69634cdef30324c7a5e63719581fc2'
            'a99bf88267184fee0568856ac09bb682224ee67029cfc20f603a43fe5f053dad'
            '96c8fad27e6af4272c1eaeaab77f33bb0b4bf86e4b21e0c4ceca3a5c9d37f0a8'
            'f48dac59786be58c6a8b5fe2a12f4f356872d87600be64506f22066508847f3a')

package() {
  # install systemd files
  install -Dm 644 "${_pkgbase}.service" "$pkgdir/usr/lib/systemd/system/${_pkgbase}.service"
  install -Dm 644 "${_pkgbase}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgbase}.conf"

  # copy configuration file and create symlink in /etc
  install -dm 770 "$pkgdir/var/lib/mailman"
  install -Dm 644 "${_pkgbase}.cfg" "$pkgdir/var/lib/mailman/var/etc/${_pkgbase}.cfg"

  cd "$srcdir/$_pkgbase-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
