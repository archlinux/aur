# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-core')
_pkgbase='mailman'
_commit=dfb807e04037786a62e7635d0b37e0695a77d5d6
pkgver=3.1.0b3
pkgrel=1
pkgdesc="A mailing list management system"
arch=(any)
conflicts=('mailman')
makedepends=('python-setuptools')
depends=('python-zope-interface' 'python-zope-event' 'python-zope-configuration'
         'python-zope-component' 'python-passlib' 'python-httplib2'
         'python-flufl-lock' 'python-flufl-i18n' 'python-flufl-bounce' 'python-falcon'
         'python-alembic' 'python-lazr-config' 'python-lazr-smtptest'
         'python-aiosmtpd' 'python-atpublic' 'python-dnspython' 'python-requests'
         'python-sqlalchemy' 'postfix')
optdepends=('python-mailman-hyperkitty-plugin: Plugin to send emails to Hyperkitty for archival')
url="https://gitlab.com/mailman/mailman"
license=('LGPL')
options=(!emptydirs)
install=$pkgname.install
backup=('var/lib/mailman/var/etc/mailman.cfg')
source=("mailman-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman/repository/archive.tar.gz?ref=${pkgver}"
				'mailman.sysusers'
        'mailman.service'
        'mailman.cfg')
sha256sums=('0e7b1ae906c845ffc2be1419d872c56554eaaa5adb8f3edcb1fcf546eb57246b'
            'a99bf88267184fee0568856ac09bb682224ee67029cfc20f603a43fe5f053dad'
            '96c8fad27e6af4272c1eaeaab77f33bb0b4bf86e4b21e0c4ceca3a5c9d37f0a8'
            'f48dac59786be58c6a8b5fe2a12f4f356872d87600be64506f22066508847f3a')

package() {
  # install systemd files
  install -Dm 644 "mailman.service" "$pkgdir/usr/lib/systemd/system/mailman.service"
  install -Dm 644 "mailman.sysusers" "$pkgdir/usr/lib/sysusers.d/mailman.conf"

  # copy configuration file and create symlink in /etc
  install -dm 770 "$pkgdir/var/lib/mailman"
  install -Dm 644 "mailman.cfg" "$pkgdir/var/lib/mailman/var/etc/mailman.cfg"

  cd "$srcdir/mailman-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
