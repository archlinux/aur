# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=redshift-wlr-gamma-control
pkgver=1.12+r25+g7da875d
_commit=7da875d34854a6a34612d5ce4bd8718c32bec804
pkgrel=1
pkgdesc='Redshift fork supporting color temperature adjustment with wlroots'
arch=(i686 x86_64)
url=https://github.com/minus7/redshift/tree/wayland
license=(GPL3)
depends=(glib2 hicolor-icon-theme libdrm libxxf86vm python wayland)
makedepends=(git intltool)
optdepends=('python-gobject: for redshift-gtk'
            'gtk3: for redshift-gtk'
            'geoclue: for geolocation support'
            'sway: Wayland environment using the wlr-gamma-control protocol')
provides=(redshift)
conflicts=(redshift)
source=(git+${url/\/tree*/}#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's#v##;s#-#+#g;s#+#+r#'
}

build() {
  cd redshift
  ./bootstrap
  ./configure \
    --prefix=/usr \
    --enable-drm \
    --enable-randr \
    --enable-vidmode \
    --enable-geoclue2 \
    --enable-wayland \
    --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package() {
  cd redshift
  make DESTDIR="$pkgdir" install
  install -Dm 644 COPYING -t "$pkgdir"/usr/share/licenses/redshift
}
