# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=lxappearance-obconf-gtk3
_pkgname=lxappearance-obconf
pkgver=0.2.4
pkgrel=1
pkgdesc='Plugin for LXAppearance to configure Openbox (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('lxappearance-gtk3' 'openbox' 'libobrender.so')
makedepends=('intltool' 'git')
conflicts=($_pkgname)
source=(git+https://github.com/lxde/lxappearance-obconf.git#tag=${pkgver})
sha256sums=('63299027fdce3acfc55eb1ae601f4a0ab4b0be0ebe055f21df46d80ff4d3f437')

prepare() {
  cd $_pkgname

  # Hide theme preview as it's broken with GTK+ 3
  # https://sourceforge.net/p/lxde/bugs/768/
  sed -i /frame1/,+19d src/obconf.glade

  ./autogen.sh
}

build() {
  cd $_pkgname
  CFLAGS+=' -Wno-implicit-function-declaration -Wno-int-conversion'
  ./configure --prefix=/usr --enable-gtk3

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
