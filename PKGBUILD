# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=hidpi-daemon
pkgver=18.04.6
pkgrel=2
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL2')
depends=(
  'acpid'
  'python>=3.6'
  'python-pydbus'
  'python-gobject'
  'python-xlib'
  'libnotify')
source=("https://github.com/pop-os/hidpi-daemon/archive/${pkgver}.tar.gz")
sha256sums=('ecb6135128c84dd37499c642d017ee663d7e91479806b8d67d1452fb1769c370')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Build and install base package
  export PYTHONHASHSEED=0
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build

  # Install daemons and executables
  install -m755 -D hidpi-daemon ${pkgdir}/usr/lib/${pkgname}/hidpi-daemon
  install -m755 -D hidpi-notification ${pkgdir}/usr/lib/${pkgname}/hidpi-notification

  # Install desktop launchers
  install -m644 -D hidpi-daemon.desktop ${pkgdir}/etc/xdg/autostart/hidpi-daemon.desktop
  install -m644 -D hidpi-frontend.desktop ${pkgdir}/etc/xdg/autostart/hidpi-frontend.desktop

  # Install schema
  install -m644 -D com.system76.hidpi.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/com.system76.hidpi.gschema.xml

  # Create empty /var/lib package directory
  install -d ${pkgdir}/var/lib/${pkgname}
}
