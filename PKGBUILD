# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui-git
pkgver=0.7.2.r1.ge150dae
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
                      'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('git' 'meson' 'pkg-config' 'appstream-glib' 'desktop-file-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/vagnum08/cpupower-gui.git"
              "fix-dbus.patch")
noextract=()
md5sums=('SKIP'
         '8904610ac7990f088fb96b1eb312c2fa')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -Np1 -i ../fix-dbus.patch
    # Fix systemd lib path
    sed -i "s@'/lib'@'lib'@" data/services/meson.build
}


build() {
  meson --prefix /usr --buildtype=plain "$srcdir/${pkgname%-git}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}


