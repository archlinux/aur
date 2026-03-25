# Maintainer: guglovich <your@email.com>
pkgname=issabelpbx
pkgver=2.12.0
pkgrel=1
pkgdesc="IssabelPBX - Asterisk Configuration GUI"
arch=('any')
url="https://github.com/IssabelFoundation/issabelPBX"
license=('GPL')
depends=('issabel-framework' 'php-legacy' 'mariadb' 'asterisk' 'gettext' 'perl' 'wget' 'mpg123' 'sox')
optdepends=('php-pear-db: Database abstraction')
install=issabelPBX.install
backup=('etc/issabelpbx.conf' 'etc/amportal.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IssabelFoundation/issabelPBX/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/issabelPBX-$pkgver"
  
  # Copy all modules to admin/modules
  install -d "${pkgdir}/var/www/html/admin/modules"
  for module in */; do
    [ -d "$module" ] && [ "$module" != "build/" ] && [ "$module" != ".git/" ] && cp -r "$module" "${pkgdir}/var/www/html/admin/modules/"
  done
  
  # Copy framework files
  [ -d "framework" ] && cp -r "framework/"* "${pkgdir}/var/www/html/admin/"

  # Config files
  install -d "${pkgdir}/etc"
  [ -f "framework/amp_conf/htdocs/admin/issabelpbx.conf" ] && install -m644 "framework/amp_conf/htdocs/admin/issabelpbx.conf" "${pkgdir}/etc/issabelpbx.conf"
  [ -f "framework/amp_conf/etc/amportal.conf" ] && install -m644 "framework/amp_conf/etc/amportal.conf" "${pkgdir}/etc/amportal.conf"

  # Logrotate
  install -d "${pkgdir}/etc/logrotate.d"
  [ -f "build/5.0/files/issabelpbx.logrotate" ] && install -m644 "build/5.0/files/issabelpbx.logrotate" "${pkgdir}/etc/logrotate.d/issabelpbx"

  # Log directory
  install -d "${pkgdir}/var/log/asterisk"
}
