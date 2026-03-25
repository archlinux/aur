# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic), Gemini (Google), and Qwen 3.5 (Alibaba)
pkgname=issabel-system
pkgver=5.0.0
pkgrel=1
pkgdesc="Issabel System Module - Network and System Management"
arch=('any')
url="https://github.com/IssabelFoundation/system"
license=('GPL')
depends=('issabel-framework' 'php-legacy' 'iproute2' 'net-tools' 'postfix' 'tar' 'mariadb' 'sqlite')
install=issabel-system.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/IssabelFoundation/system/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/system-$pkgver"
  
  # Web Modules
  install -d "${pkgdir}/var/www/html/modules"
  cp -r "modules/"* "${pkgdir}/var/www/html/modules/"

  # Libraries
  install -d "${pkgdir}/var/www/html/libs"
  [ -f "setup/paloSantoNetwork.class.php" ] && install -m644 "setup/paloSantoNetwork.class.php" "${pkgdir}/var/www/html/libs/"
  
  # Backup script
  install -d "${pkgdir}/var/www/backup"
  [ -f "setup/automatic_backup.php" ] && install -m644 "setup/automatic_backup.php" "${pkgdir}/var/www/backup/"

  # Privileged scripts
  install -d "${pkgdir}/usr/share/issabel/privileged"
  [ -d "setup/usr/share/issabel/privileged" ] && install -m755 setup/usr/share/issabel/privileged/* "${pkgdir}/usr/share/issabel/privileged/"

  # System utilities
  install -d "${pkgdir}/usr/bin"
  [ -d "setup/usr/sbin" ] && install -m755 setup/usr/sbin/* "${pkgdir}/usr/bin/"

  # Module installer data
  install -d "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}"
  cp -r "setup" "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}/"
  [ -f "menu.xml" ] && install -m644 "menu.xml" "${pkgdir}/usr/share/issabel/module_installer/issabel-system-${pkgver}-${pkgrel}/"
}
