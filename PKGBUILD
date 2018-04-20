# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=hidpi-daemon
pkgver=17.10.3
pkgrel=1
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL')
depends=(
  'python>=3.6'
  'python-pydbus'
  'python-gobject'
  'python-xlib'
  'libnotify')
makepdepends=(
  'python-pyflakes')
source=(
  "https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=(
  '3445b11aaef52f3a53818bd8f31bf9c16f137eee')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Build and install base package
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

  # Install daemons and executables
  install -m755 -D hidpi-daemon ${pkgdir}/usr/lib/${pkgname}/hidpi-daemon
  install -m755 -D hidpi-notification ${pkgdir}/usr/lib/${pkgname}/hidpi-notification

  # Install desktop launchers
  install -m644 -D hidpi-daemon.desktop ${pkgdir}/etc/xdg/autostart/hidpi-daemon.desktop
  install -m644 -D hidpi-frontend.desktop ${pkgdir}/etc/xdg/autostart/hidpi-frontend.desktop

  # Install schema
  install -m644 -D com.system76.hidpi.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/com.system76.hidpi.gschema.xml

  # Create empty /var/lib package directory
  mkdir -p ${pkgdir}/var/lib/${pkgname}

  # Clean up
  rm -rf ${pkgdir}/usr/lib/python*/site-packages/hidpidaemon/{__pycache__,tests}
}
