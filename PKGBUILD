# Maintainer: guglovich <your@email.com>
pkgname=issabel-pbx
pkgver=5.0.0
pkgrel=1
pkgdesc="Issabel PBX Module - Core PBX Logic and AGI"
arch=('any')
url="https://github.com/IssabelFoundation/pbx"
license=('GPL')
depends=('issabel-framework' 'issabel-system' 'asterisk' 'psmisc' 'sqlite')
install=issabel-pbx.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/IssabelFoundation/pbx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pbx-$pkgver"
  
  # Web Modules
  install -d "${pkgdir}/var/www/html/modules"
  cp -r "modules/"* "${pkgdir}/var/www/html/modules/"

  # Asterisk AGI and MOH
  install -d "${pkgdir}/var/lib/asterisk/agi-bin"
  install -d "${pkgdir}/var/lib/asterisk/moh"
  [ -d "setup/asterisk/agi-bin" ] && cp -r "setup/asterisk/agi-bin/"* "${pkgdir}/var/lib/asterisk/agi-bin/"
  [ -d "setup/asterisk/moh" ] && cp -r "setup/asterisk/moh/"* "${pkgdir}/var/lib/asterisk/moh/"

  # Utilities
  install -d "${pkgdir}/usr/bin"
  [ -f "setup/bin/asterisk.reload" ] && install -m755 "setup/bin/asterisk.reload" "${pkgdir}/usr/bin/asterisk.reload"

  # Cron
  install -d "${pkgdir}/etc/cron.daily"
  [ -f "setup/etc/cron.daily/asterisk_cleanup" ] && install -m755 "setup/etc/cron.daily/asterisk_cleanup" "${pkgdir}/etc/cron.daily/asterisk_cleanup"

  # Privileged scripts
  install -d "${pkgdir}/usr/share/issabel/privileged"
  [ -d "setup/usr/share/issabel/privileged" ] && install -m755 setup/usr/share/issabel/privileged/* "${pkgdir}/usr/share/issabel/privileged/"

  # Asterisk config
  install -d "${pkgdir}/etc/asterisk"
  [ -f "setup/etc/asterisk/sip_notify_custom_issabel.conf" ] && install -m644 "setup/etc/asterisk/sip_notify_custom_issabel.conf" "${pkgdir}/etc/asterisk/"

  # Module installer
  install -d "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}"
  cp -r "setup" "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}/"
  [ -f "menu.xml" ] && install -m644 "menu.xml" "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}/"
}
