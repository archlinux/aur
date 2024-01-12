# Maintainer: Yunchuan "Winslow" Hu
# Contributor: Mark Austin <ganthore@gmail.com>
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

# This is a nearly completely rewrite of the original PKGBUILD which consist multiple errors in the actual running & used pip

pkgbase=setroubleshoot-git
pkgname=(setroubleshoot-git setroubleshoot-server-git)
pkgver=3.3.32.r3.g502d06c
pkgrel=1
pkgdesc="Provides tools to help diagnose SELinux problems"
groups=('selinux')
arch=('x86_64' 'aarch64')
url='https://gitlab.com/setroubleshoot'
license=('GPL2')
conflicts=("setroubleshoot")
provides=("setroubleshoot-git" "setroubleshoot-server-git")
makedepends=('audit' 'dbus' 'desktop-file-utils' 'gtk3' 'libnotify' 'libreport'
             'policycoreutils' 'polkit' 'python-gobject' 'python-pydbus'
             'python-slip' 'python-systemd' 'xdg-utils' 'python-dasbus')
source=(
    'setroubleshoot-git::git+https://gitlab.com/setroubleshoot/setroubleshoot#branch=main'
    'setroubleshoot.logrotate'
    'setroubleshoot.tmpfiles'
    'setroubleshoot-sysusers.conf'
)

sha256sums=('SKIP'
            '894a75c33d568f908f0c3fa7fe4d7f82824369695194aa005fe42cf961298893'
            'eb7321b7db2fd8951c7ce3c7c42680fcfe7641c3d7be9e8d69a8fbb992a9d086'
            'fa20d1ec3522aa877fc5462d56692b318b4c8af1cd9ecb62ec41ad6647662d77')


pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgbase}"
  export PYTHON=/usr/bin/python
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-auditpluginsdir=/etc/audit/plugins.d
  make
}

package_setroubleshoot-git() {
  pkgdesc="Provides tools to help diagnose SELinux problems - GUI"
  depends=('setroubleshoot-server-git' 'hicolor-icon-theme' 'python')

  cd "${pkgbase}"
  
  install -m644 -D "sealertauto.desktop" "${pkgdir}/etc/xdg/autostart/sealertauto.desktop"
  install -m755 -D "src/seapplet" "${pkgdir}/usr/bin/seapplet"

  install -m644 -D "setroubleshoot.desktop" "${pkgdir}/usr/share/applications/setroubleshoot.desktop"
  install -m644 -D "org.fedoraproject.sealert.service" "${pkgdir}/usr/share/dbus-1/services/org.fedoraproject.sealert.service"
  
  install -m644 -D "gui/16x16/setroubleshoot_icon.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/setroubleshoot_icon.png"
  install -m644 -D "gui/16x16/setroubleshoot_red_icon.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/setroubleshoot_red_icon.png"
  install -m644 -D "gui/22x22/setroubleshoot_icon.png" "${pkgdir}/usr/share/icons/hicolor/22x22/apps/setroubleshoot_icon.png"
  install -m644 -D "gui/22x22/setroubleshoot_red_icon.png" "${pkgdir}/usr/share/icons/hicolor/22x22/apps/setroubleshoot_red_icon.png"
  install -m644 -D "gui/24x24/setroubleshoot_icon.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/setroubleshoot_icon.png"
  install -m644 -D "gui/24x24/setroubleshoot_red_icon.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/setroubleshoot_red_icon.png"
  install -m644 -D "gui/32x32/setroubleshoot_icon.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/setroubleshoot_icon.png"
  install -m644 -D "gui/32x32/setroubleshoot_red_icon.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/setroubleshoot_red_icon.png"
  install -m644 -D "gui/48x48/setroubleshoot_icon.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/setroubleshoot_icon.png"
  install -m644 -D "gui/48x48/setroubleshoot_red_icon.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/setroubleshoot_red_icon.png"

  install -m644 -D "gui/scalable/setroubleshoot_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/setroubleshoot_icon.svg"
  install -m644 -D "gui/scalable/setroubleshoot_icon-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/setroubleshoot_icon-symbolic.svg"
  install -m644 -D "gui/scalable/setroubleshoot_red_icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/setroubleshoot_red_icon.svg"

  
  install -m644 -D "gui/browser.glade" "${pkgdir}/usr/share/setroubleshoot/gui/browser.glade"
  install -m644 -D "gui/bug_report.glade" "${pkgdir}/usr/share/setroubleshoot/gui/bug_report.glade"
  install -m644 -D "gui/fail_dialog.glade" "${pkgdir}/usr/share/setroubleshoot/gui/fail_dialog.glade"
  ln -s /usr/share/icons/hicolor/24x24/apps/setroubleshoot_icon.png "${pkgdir}/usr/share/setroubleshoot/gui/setroubleshoot_icon.png"
  install -m644 -D "gui/style.css" "${pkgdir}/usr/share/setroubleshoot/gui/style.css"
  install -m644 -D "gui/success_dialog.glade" "${pkgdir}/usr/share/setroubleshoot/gui/success_dialog.glade"

  # Build & install python-setroubleshoot
  cd src
  python setup.py build
  python setup.py install --root="$pkgdir" --optimize=1

}

package_setroubleshoot-server-git() {
  cd "${pkgbase}"
  install -m644 -D "src/sedispatch.conf" "${pkgdir}/etc/audit/plugins.d/sedispatch.conf" 
  install -m755 -D "src/sealert" "${pkgdir}/usr/bin/sealert"
  install -m644 -D "setroubleshootd.service" "${pkgdir}/usr/lib/systemd/system/setroubleshootd.service"
  install -m644 -D "../setroubleshoot-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/setroubleshoot.conf"
  install -m644 -D "../setroubleshoot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/setroubleshoot.conf"
  install -m755 -D "src/sedispatch" "${pkgdir}/usr/bin/sedispatch"
  install -m755 -D "src/setroubleshootd" "${pkgdir}/usr/bin/setroubleshootd"
  
  install -m644 -D "org.fedoraproject.Setroubleshootd.service" "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.Setroubleshootd.service"
  install -m644 -D "org.fedoraproject.SetroubleshootFixit.service" "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.SetroubleshootFixit.service"
  install -m644 -D "org.fedoraproject.SetroubleshootPrivileged.service" "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.SetroubleshootPrivileged.service"

  install -m644 -D "src/setroubleshoot.conf" "${pkgdir}/etc/setroubleshoot/setroubleshoot.conf"
  install -m644 -D "org.fedoraproject.Setroubleshootd.conf" "${pkgdir}/etc/dbus-1/system.d/org.fedoraproject.Setroubleshootd.conf"
  install -m644 -D "org.fedoraproject.SetroubleshootFixit.conf" "${pkgdir}/etc/dbus-1/system.d/org.fedoraproject.SetroubleshootFixit.conf"
  install -m644 -D "org.fedoraproject.SetroubleshootPrivileged.conf" "${pkgdir}/etc/dbus-1/system.d/org.fedoraproject.SetroubleshootPrivileged.conf"

  install -m644 -D "org.fedoraproject.setroubleshootfixit.policy" "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.setroubleshootfixit.policy"

  install -m644 -D "src/SetroubleshootFixit.py" "${pkgdir}/usr/share/setroubleshoot/SetroubleshootFixit.py"
  install -m644 -D "src/SetroubleshootPrivileged.py" "${pkgdir}/usr/share/setroubleshoot/SetroubleshootPrivileged.py"

for lang in "as" "bg" "bn" "bn_IN" "ca" "cs" "da" "de" "el" "en_GB" "es" "eu" "fi" "fr" "fur" "gl" "gu" "he" "hi" "hr" "hu" "it" "ja" "kn" "ko" "mai" "ml" "mr" "ms" "nb" "nds" "nl" "nn" "or" "pa" "pl" "pt" "pt_BR" "ru" "si" "sk" "sr" "sr@latin" "sv" "ta" "te" "th" "tr" "uk" "zh_CN" "zh_TW"; do
  if [ -f "${srcdir}/locale/$lang/LC_MESSAGES/setroubleshoot.pmo" ]; then
    install -Dm644 "${srcdir}/locale/$lang/LC_MESSAGES/setroubleshoot.pmo" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/setroubleshoot.pmo"
  fi
  if [ -f "${srcdir}/locale/$lang/LC_MESSAGES/setroubleshoot.mo" ]; then
    install -Dm644 "${srcdir}/locale/$lang/LC_MESSAGES/setroubleshoot.mo" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/setroubleshoot.mo"
  fi
done
  
  mkdir -p "${pkgdir}/run/setroubleshoot/"
  chmod 755 "${pkgdir}/run/setroubleshoot/"
  mkdir -p "${pkgdir}/var/lib/setroubleshoot"
  touch "${pkgdir}/var/lib/setroubleshoot/setroubleshoot_database.xml"
  touch "${pkgdir}/var/lib/setroubleshoot/email_alert_recipients"
  chown -R setroubleshoot "${pkgdir}/var/lib/setroubleshoot"
  chmod 600 "${pkgdir}/var/lib/setroubleshoot/setroubleshoot_database.xml"
  chmod 600 "${pkgdir}/var/lib/setroubleshoot/email_alert_recipients"
  chmod 750 "${pkgdir}/etc/audit/plugins.d/"
  sudo sed -i 's/active = no/active = yes/g' /etc/audit/plugins.d/af_unix.conf
}
