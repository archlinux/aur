# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-core')
pkgver=3.2.2
pkgrel=1
pkgdesc="A mailing list management system"
arch=(any)
conflicts=('mailman')
makedepends=('python-setuptools')
depends=('python-zope-interface' 'python-zope-event' 'python-zope-configuration'
         'python-zope-component' 'python-passlib' 'python-click'
         'python-flufl-lock' 'python-flufl-i18n' 'python-flufl-bounce' 'python-falcon'
         'python-alembic' 'python-lazr-config' 'python-lazr-smtptest'
         'python-aiosmtpd' 'python-atpublic' 'python-dnspython' 'python-requests'
         'postfix')
optdepends=('python-mailman-hyperkitty-plugin: Plugin to send emails to Hyperkitty for archival')
url="https://gitlab.com/mailman/mailman"
license=('LGPL')
options=(!emptydirs)
install=$pkgname.install
backup=('var/lib/mailman/var/etc/mailman.cfg')
source=("mailman-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman/-/archive/${pkgver}/mailman-${pkgver}.tar.gz"
        'mailman.sysusers'
        'mailman.service'
        'mailman.cfg')
sha256sums=('6f1fcff0d258bdaecbd995c822a24da06e95a6c658986a08d26ec58c21102660'
            'a99bf88267184fee0568856ac09bb682224ee67029cfc20f603a43fe5f053dad'
            '81048cb6a27490fb36881b2eb88567b2ea2271b481dd0254fe9a398e6ca9beaf'
            'f48dac59786be58c6a8b5fe2a12f4f356872d87600be64506f22066508847f3a')

package() {
  # install systemd files
  install -Dm 644 "mailman.service" "$pkgdir/usr/lib/systemd/system/mailman.service"
  install -Dm 644 "mailman.sysusers" "$pkgdir/usr/lib/sysusers.d/mailman.conf"

  # copy configuration file and create symlink in /etc
  install -dm 770 "$pkgdir/var/lib/mailman"
  install -Dm 644 "mailman.cfg" "$pkgdir/var/lib/mailman/var/etc/mailman.cfg"
  mkdir "$pkgdir/etc"
  ln -s "$pkgdir/var/lib/mailman/var/etc/mailman.cfg" "$pkgdir/etc/mailman.cfg"

  cd "$srcdir/mailman-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
