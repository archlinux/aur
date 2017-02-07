# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-core-git')
pkgver=r8904.03e04a93e
pkgrel=1
pkgdesc="A mailing list management system"
arch=(any)
provides=('mailman-core')
conflicts=('mailman' 'mailman-core-git')
makedepends=('python-setuptools' 'git')
depends=('python-zope-interface' 'python-zope-event' 'python-zope-configuration'
         'python-zope-component' 'python-passlib'
         'python-flufl-lock' 'python-flufl-i18n' 'python-flufl-bounce' 'python-falcon'
         'python-alembic' 'python-lazr-config' 'python-lazr-smtptest'
         'python-aiosmtpd' 'python-atpublic' 'python-dnspython' 'python-requests'
         'python-sqlalchemy' 'postfix')
optdepends=('python-mailman-hyperkitty-plugin: Plugin to send emails to Hyperkitty for archival')
url="https://gitlab.com/mailman/mailman"
license=('LGPL')
options=(!emptydirs)
install=mailman-core.install
backup=('var/lib/mailman/var/etc/mailman.cfg')
source=('git+https://gitlab.com/mailman/mailman.git'
        'mailman.sysusers'
        'mailman.service'
        'mailman.cfg')
sha256sums=('SKIP'
            'a99bf88267184fee0568856ac09bb682224ee67029cfc20f603a43fe5f053dad'
            '81048cb6a27490fb36881b2eb88567b2ea2271b481dd0254fe9a398e6ca9beaf'
            'f48dac59786be58c6a8b5fe2a12f4f356872d87600be64506f22066508847f3a')

pkgver() {
  cd "$srcdir/mailman"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  # install systemd files
  install -Dm 644 mailman.service "$pkgdir/usr/lib/systemd/system/mailman.service"
  install -Dm 644 mailman.sysusers "$pkgdir/usr/lib/sysusers.d/mailman.conf"

  # copy configuration file and create symlink in /etc
  install -dm 770 "$pkgdir/var/lib/mailman"
  install -Dm 644 "mailman.cfg" "$pkgdir/var/lib/mailman/var/etc/mailman.cfg"

  cd "$srcdir/mailman"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
