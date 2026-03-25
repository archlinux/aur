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
source=()
noextract=()

package() {
  # 1. Web Interface
  install -d "${pkgdir}/var/www/html"
  cp -r "${startdir}/framework/html/"* "${pkgdir}/var/www/html/"

  # 2. Databases and Backups directories
  install -d "${pkgdir}/var/www/db"
  install -d "${pkgdir}/var/www/backup"

  # 3. System Utilities
  install -d "${pkgdir}/usr/bin"
  local bin_files=("issabel-menumerge" "issabel-menuremove" "issabel-dbprocess" "compareVersion" "search_ami_admin_pwd" "issabel-add-yum-exclude" "issabel-notification" "issabel-helper")
  for f in "${bin_files[@]}"; do
    if [ -f "${startdir}/additionals/usr/bin/$f" ]; then
      install -m755 "${startdir}/additionals/usr/bin/$f" "${pkgdir}/usr/bin/$f"
    fi
  done

  # 4. Privileged Scripts
  install -d "${pkgdir}/usr/share/issabel/privileged"
  install -m755 "${startdir}/framework/setup/usr/share/issabel/privileged/"* "${pkgdir}/usr/share/issabel/privileged/"

  # 5. Apache Configuration
  install -d "${pkgdir}/etc/httpd/conf/extra"
  install -m644 "${startdir}/additionals/etc/httpd/conf.d/issabel.conf" "${pkgdir}/etc/httpd/conf/extra/issabel.conf"
  install -m644 "${startdir}/additionals/etc/httpd/conf.d/issabel-htaccess.conf" "${pkgdir}/etc/httpd/conf/extra/issabel-htaccess.conf"

  # 6. PHP Configuration
  install -d "${pkgdir}/etc/php/conf.d"
  install -m644 "${startdir}/additionals/etc/php.d/issabel.ini" "${pkgdir}/etc/php/conf.d/issabel.ini"

  # 7. Sudoers
  install -d "${pkgdir}/etc/sudoers.d"
  install -m440 "${startdir}/additionals/etc/sudoers" "${pkgdir}/etc/sudoers.d/issabel"

  # 8. Logrotate and Cron
  install -d "${pkgdir}/etc/logrotate.d"
  install -m644 "${startdir}/additionals/etc/logrotate.d/"* "${pkgdir}/etc/logrotate.d/"
  install -d "${pkgdir}/etc/cron.d"
  install -m644 "${startdir}/additionals/etc/cron.d/issabel.cron" "${pkgdir}/etc/cron.d/issabel"

  # 9. Create directories for templates and cache
  install -d "${pkgdir}/var/www/html/var/templates_c"
  install -d "${pkgdir}/var/www/html/var/cache"
  install -d "${pkgdir}/var/www/html/cache"
}
