# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=hidpi-daemon-git
pkgver=18.04.6.r1.g8f165bb
pkgrel=1
pkgdesc="Daemon to manage HiDPI and LoDPI monitors on X"
arch=('any')
url="https://github.com/pop-os/hidpi-daemon"
license=('GPL2')
depends=('acpid' 'libnotify' 'python-gobject' 'python-pydbus' 'python-xlib')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "system76-${pkgname%-git}")
replaces=("system76-$pkgname")
source=('git+https://github.com/pop-os/hidpi-daemon.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm755 "${pkgname%-git}" hidpi-notification prime-dialog -t \
    "$pkgdir/usr/lib/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" hidpi-frontend.desktop -t \
    "$pkgdir/etc/xdg/autostart"
  install -Dm644 com.system76.hidpi.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
  install -d "$pkgdir/var/lib/${pkgname%-git}"
}
