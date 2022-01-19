# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui
pkgver=1.0.0
pkgrel=5
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject' 'python-pyxdg' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
	    'libappindicator-gtk3: needed for tray icon')

makedepends=('meson' 'desktop-file-utils' 'appstream-glib')
provides=("${pkgname}")
conflicts=("${pkgname}")
install=cpupower_gui.install
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/vagnum08/cpupower-gui/archive/v${pkgver}.tar.gz")
sha256sums=('09f8b9619e974abe00fc06c0d5528b6a36518f6b283b3db338349bada1d51492')

build() {
  sed -i '15d' "$srcdir/${pkgname}-${pkgver}/data/meson.build"
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
