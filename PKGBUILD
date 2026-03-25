# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic), Gemini (Google), and Qwen 3.5 (Alibaba)
# Arch Linux Port of Issabel PBX
pkgname=issabel-pbx
pkgver=5.0.0
pkgrel=1
pkgdesc="Issabel PBX Module - Core PBX Logic and AGI (Arch Linux Port)"
arch=('any')
url="https://github.com/IssabelFoundation/pbx"
license=('GPL')
depends=('issabel-framework' 'issabel-system' 'asterisk' 'psmisc' 'sqlite')
install=issabel-pbx.install
source=()

package() {
  # Web Modules
  install -d "${pkgdir}/var/www/html/modules"
  cp -r "${startdir}/modules/"* "${pkgdir}/var/www/html/modules/"

  # Asterisk AGI and MOH
  install -d "${pkgdir}/var/lib/asterisk/agi-bin"
  install -d "${pkgdir}/var/lib/asterisk/moh"
  cp -r "${startdir}/setup/asterisk/agi-bin/"* "${pkgdir}/var/lib/asterisk/agi-bin/"
  cp -r "${startdir}/setup/asterisk/moh/"* "${pkgdir}/var/lib/asterisk/moh/"

  # System Utilities
  install -d "${pkgdir}/usr/bin"
  install -m755 "${startdir}/setup/bin/asterisk.reload" "${pkgdir}/usr/bin/asterisk.reload"

  # Cron
  install -d "${pkgdir}/etc/cron.daily"
  install -m755 "${startdir}/setup/etc/cron.daily/asterisk_cleanup" "${pkgdir}/etc/cron.daily/asterisk_cleanup"

  # Privileged and Config
  install -d "${pkgdir}/usr/share/issabel/privileged"
  install -m755 "${startdir}/setup/usr/share/issabel/privileged/"* "${pkgdir}/usr/share/issabel/privileged/"

  install -d "${pkgdir}/etc/asterisk"
  install -m644 "${startdir}/setup/etc/asterisk/sip_notify_custom_issabel.conf" "${pkgdir}/etc/asterisk/"

  # Module Installer Data
  install -d "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}"
  cp -r "${startdir}/setup" "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}/"
  install -m644 "${startdir}/menu.xml" "${pkgdir}/usr/share/issabel/module_installer/issabel-pbx-${pkgver}-${pkgrel}/"
}
