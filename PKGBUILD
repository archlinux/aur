# Maintainer: Mark Austin <ganthore@gmail.com>
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

# This package is forked from https://aur.archlinux.org/packages/setroubleshoot
#
# This package was created to use the new upstream URL and workaround a build
# problem due to the depreciation of python-formatter.
# Issue:
# https://gitlab.com/setroubleshoot/setroubleshoot/-/commit/838f53a97ce44ea0f8f4d361afcb62a441f8633f

pkgbase=setroubleshoot-git
pkgname=(setroubleshoot-git setroubleshoot-server-git)
pkgver=3.3.29.r45.g116e3e6
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
    --localstatedir=/var/lib \
    --with-auditpluginsdir=/etc/audisp/plugins.d
  make
}

package_setroubleshoot-git() {
  pkgdesc="Provides tools to help diagnose SELinux problems - GUI"
  depends=('setroubleshoot-server-git' 'hicolor-icon-theme' 'python')

  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install

  # Remove setroubleshoot-server files
  rm "${pkgdir}/etc/audisp/plugins.d/sedispatch.conf"
  rmdir "${pkgdir}/etc/audisp/plugins.d"
  rmdir "${pkgdir}/etc/audisp"
  rm -r "${pkgdir}/etc/dbus-1/system.d"
  rmdir "${pkgdir}/etc/dbus-1"
  rm "${pkgdir}/etc/setroubleshoot/setroubleshoot.conf"
  rmdir "${pkgdir}/etc/setroubleshoot"
  rm "${pkgdir}/usr/bin/sedispatch"
  rm "${pkgdir}/usr/bin/setroubleshootd"
  rm -r "${pkgdir}/usr/lib/$(/usr/bin/python -c 'import sys;print("python%d.%d" % sys.version_info[:2])')/"
  rmdir "${pkgdir}/usr/lib"
  rm "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.Setroubleshootd.service"
  rm "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.SetroubleshootFixit.service"
  rm "${pkgdir}/usr/share/dbus-1/system-services/org.fedoraproject.SetroubleshootPrivileged.service"
  rmdir "${pkgdir}/usr/share/dbus-1/system-services"
  rm -r "${pkgdir}/usr/share/doc/"
  rm -r "${pkgdir}/usr/share/locale/"
  rm "${pkgdir}/usr/share/man/man8/sedispatch.8"
  rm "${pkgdir}/usr/share/man/man8/setroubleshootd.8"
  rm "${pkgdir}/usr/share/polkit-1/actions/org.fedoraproject.setroubleshootfixit.policy"
  rmdir "${pkgdir}/usr/share/polkit-1/actions"
  rmdir "${pkgdir}/usr/share/polkit-1"
  rm "${pkgdir}/usr/share/setroubleshoot/SetroubleshootFixit.py"
  rm "${pkgdir}/usr/share/setroubleshoot/SetroubleshootPrivileged.py"
  rm "${pkgdir}/usr/share/metainfo/setroubleshoot.appdata.xml"
}

package_setroubleshoot-server-git() {
  pkgdesc="SELinux troubleshoot server"
  # FIXME: split the dependencies between setroubleshoot-server and setroubleshoot
  depends=('audit' 'dbus' 'desktop-file-utils' 'gtk3' 'libnotify' 'libreport'
           'policycoreutils' 'polkit' 'python-gobject' 'python-pydbus'
           'python-slip' 'python-systemd' 'xdg-utils')

  cd "${pkgbase}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/var/lib/${pkgname}"
  touch "${pkgdir}/var/lib/${pkgname}/setroubleshoot_database.xml"
  touch "${pkgdir}/var/lib/${pkgname}/email_alert_recipients"

  install -m644 -D "${srcdir}/setroubleshoot.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -m644 -D "${srcdir}/setroubleshoot.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -m644 -D "${srcdir}/setroubleshoot-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  chmod 750 "${pkgdir}/etc/audisp/plugins.d/"

  # Remove setroubleshoot files
  rm "${pkgdir}/etc/xdg/autostart/sealertauto.desktop"
  rmdir "${pkgdir}/etc/xdg/autostart"
  rmdir "${pkgdir}/etc/xdg"
  rm "${pkgdir}/usr/bin/sealert"
  rm "${pkgdir}/usr/bin/seapplet"
  rm "${pkgdir}/usr/share/applications/setroubleshoot.desktop"
  rmdir "${pkgdir}/usr/share/applications"
  rm "${pkgdir}/usr/share/dbus-1/services/sealert.service"
  rmdir "${pkgdir}/usr/share/dbus-1/services"
  rm -r "${pkgdir}/usr/share/icons/"
  rm "${pkgdir}/usr/share/man/man1/seapplet.1"
  rm "${pkgdir}/usr/share/man/man8/sealert.8"
  rm -r "${pkgdir}/usr/share/setroubleshoot/gui/"
}
