# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=hidpi-daemon
pkgver=18.04.5
pkgrel=1
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL')
depends=(
  'acpid'
  'python>=3.6'
  'python-pydbus'
  'python-gobject'
  'python-xlib'
  'libnotify')
makepdepends=(
  'python-pyflakes')
conflicts=('system76-driver<17.10.32')
source=(
  "https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=(
  '057df4821586fce7be303a442bd92cdc6a1ae6d9')

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
