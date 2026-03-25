# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic), Gemini (Google), and Qwen 3.5 (Alibaba)
# Arch Linux Port of Issabel Framework
pkgname=issabel-framework
pkgver=5.0.0
pkgrel=1
pkgdesc="Unified Communications PBX Framework (Issabel) - Arch Linux Port"
arch=('any')
url="https://github.com/IssabelFoundation/framework"
license=('GPL2' 'GPL3')
depends=('php-legacy' 'php-legacy-gd' 'apache' 'mariadb' 'sqlite' 'sudo' 'net-tools')
optdepends=('asterisk: PBX functionality')
install=issabel-framework.install
backup=(
  'etc/httpd/conf/extra/issabel.conf'
  'etc/httpd/conf/extra/issabel-htaccess.conf'
  'etc/php/conf.d/issabel.ini'
  'etc/sudoers.d/issabel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/IssabelFoundation/framework/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/framework-$pkgver"
  
  # 1. Web Interface
  install -d "${pkgdir}/var/www/html"
  cp -r "framework/html/"* "${pkgdir}/var/www/html/"

  # 2. Databases and Backups directories
  install -d "${pkgdir}/var/www/db"
  install -d "${pkgdir}/var/www/backup"

  # 3. System Utilities
  install -d "${pkgdir}/usr/bin"
  for f in issabel-menumerge issabel-menuremove issabel-dbprocess compareVersion search_ami_admin_pwd issabel-notification issabel-helper; do
    [ -f "additionals/usr/bin/$f" ] && install -m755 "additionals/usr/bin/$f" "${pkgdir}/usr/bin/$f"
  done

  # 4. Privileged Scripts
  install -d "${pkgdir}/usr/share/issabel/privileged"
  [ -d "framework/setup/usr/share/issabel/privileged" ] && install -m755 framework/setup/usr/share/issabel/privileged/* "${pkgdir}/usr/share/issabel/privileged/"

  # 5. Apache Configuration
  install -d "${pkgdir}/etc/httpd/conf/extra"
  [ -f "additionals/etc/httpd/conf.d/issabel.conf" ] && install -m644 "additionals/etc/httpd/conf.d/issabel.conf" "${pkgdir}/etc/httpd/conf/extra/issabel.conf"
  [ -f "additionals/etc/httpd/conf.d/issabel-htaccess.conf" ] && install -m644 "additionals/etc/httpd/conf.d/issabel-htaccess.conf" "${pkgdir}/etc/httpd/conf/extra/issabel-htaccess.conf"

  # 6. PHP Configuration
  install -d "${pkgdir}/etc/php/conf.d"
  [ -f "additionals/etc/php.d/issabel.ini" ] && install -m644 "additionals/etc/php.d/issabel.ini" "${pkgdir}/etc/php/conf.d/issabel.ini"

  # 7. Sudoers
  install -d "${pkgdir}/etc/sudoers.d"
  [ -f "additionals/etc/sudoers" ] && install -m440 "additionals/etc/sudoers" "${pkgdir}/etc/sudoers.d/issabel"

  # 8. Logrotate and Cron
  install -d "${pkgdir}/etc/logrotate.d"
  [ -d "additionals/etc/logrotate.d" ] && install -m644 additionals/etc/logrotate.d/* "${pkgdir}/etc/logrotate.d/"
  install -d "${pkgdir}/etc/cron.d"
  [ -f "additionals/etc/cron.d/issabel.cron" ] && install -m644 "additionals/etc/cron.d/issabel.cron" "${pkgdir}/etc/cron.d/issabel"

  # 9. Create directories for templates and cache
  install -d "${pkgdir}/var/www/html/var/templates_c"
  install -d "${pkgdir}/var/www/html/var/cache"
  install -d "${pkgdir}/var/www/html/cache"
}
