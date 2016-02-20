# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=lxappearance-obconf-gtk3
_pkgname=lxappearance-obconf
pkgver=0.2.2
pkgrel=3
pkgdesc='Plugin for LXAppearance to configure Openbox'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('lxappearance-gtk3' 'openbox' 'libsm' 'libobrender.so')
makedepends=('intltool')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
md5sums=('d958ac5514ba1707429ff6794ab59abf')

prepare() {
  cd $_pkgname-$pkgver

  # Hide theme preview as it's broken with GTK+ 3
  # https://sourceforge.net/p/lxde/bugs/768/
  sed -i /frame1/,+19d src/obconf.glade
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk3

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
