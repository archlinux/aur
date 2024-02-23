# Maintainer: Yunchuan "Winslow" Hu <i@winsloweric.com, winslows@student.ubc.ca>
# Contributor: Mark Austin <ganthore@gmail.com>
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

# This package is forked from https://aur.archlinux.org/packages/setroubleshoot-server
#
# This package was created to use the new upstream URL and workaround a build
# problem due to the depreciation of python-formatter.
# Issue:
# https://gitlab.com/setroubleshoot/setroubleshoot/-/commit/838f53a97ce44ea0f8f4d361afcb62a441f8633f

pkgbase=setroubleshoot-server-git
pkgname=setroubleshoot-server-git
pkgver=3.3.32.r3.g502d06c
pkgrel=5
pkgdesc="Provides tools to help diagnose SELinux problems - SETroubleshoot dbus daemon"
groups=('selinux')
arch=('x86_64' 'aarch64')
url='https://gitlab.com/setroubleshoot'
license=('GPL2')
conflicts=("setroubleshoot-server")
provides=("setroubleshoot-server")

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
  cd "setroubleshoot-git"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "setroubleshoot-git"
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

package() {
  pkgdesc="SELinux troubleshoot server"

  cd "setroubleshoot-git"
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

  install -m755 -D "src/SetroubleshootFixit.py" "${pkgdir}/usr/share/setroubleshoot/SetroubleshootFixit.py"
  install -m755 -D "src/SetroubleshootPrivileged.py" "${pkgdir}/usr/share/setroubleshoot/SetroubleshootPrivileged.py"

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
  
  echo SETroubleshootD requires an audit event socket to function, you might want to execute the following command to enable it
  echo sudo sed -i 's/active = no/active = yes/g' /etc/audit/plugins.d/af_unix.conf
}
