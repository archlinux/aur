# Maintainer: Yunchuan "Winslow" Hu <i@winsloweric.com, winslows@student.ubc.ca>
# Contributor: Mark Austin <ganthore@gmail.com>
# Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

# This package is forked from https://aur.archlinux.org/packages/setroubleshoot
#
# This package was created to use the new upstream URL and workaround a build
# problem due to the depreciation of python-formatter.
# Issue:
# https://gitlab.com/setroubleshoot/setroubleshoot/-/commit/838f53a97ce44ea0f8f4d361afcb62a441f8633f

# This is a nearly completely rewrite of the original PKGBUILD which consist multiple errors in the actual running & used pip

# TODO: install man and app metadata

pkgbase=setroubleshoot-git
pkgname=setroubleshoot-git
pkgver=3.3.32.r3.g502d06c
pkgrel=5
pkgdesc="Provides tools to help diagnose SELinux problems"
groups=('selinux')
arch=('x86_64' 'aarch64')
url='https://gitlab.com/setroubleshoot'
license=('GPL2')
conflicts=("setroubleshoot")
provides=("setroubleshoot-git")

makedepends=('audit' 'dbus' 'desktop-file-utils' 'gtk3' 'libnotify' 'libreport'
             'policycoreutils' 'polkit' 'python-gobject' 'python-pydbus'
             'python-slip' 'python-systemd' 'xdg-utils' 'python-dasbus')

source=(
    'setroubleshoot-git::git+https://gitlab.com/setroubleshoot/setroubleshoot#branch=main'
)

sha256sums=('SKIP')

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

package() {
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

