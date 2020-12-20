# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Sepp\u00e4l\u00e4 <t-r-a-y@mbnet.fi>

pkgname=lib32-gtk2-minimal-git
pkgver=2.24.32
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) (32-bit)"
arch=('x86_64')
url="https://www.gtk.org/"
install=gtk2.install
depends=(lib32-atk lib32-pango lib32-cairo lib32-gdk-pixbuf2 lib32-libxcursor lib32-libxrandr lib32-libxi lib32-libxinerama lib32-libxcomposite lib32-libxdamage gtk2)
provides=(lib32-gtk2)
conflicts=(lib32-gtk2)
makedepends=('python')
license=('LGPL')
source=(git+https://gitlab.gnome.org/GNOME/gtk.git#branch=gtk-2-24)
sha256sums=('SKIP')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd gtk

  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --disable-cups \
      --disable-papi \
      --with-xinput=yes

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd gtk
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/{include,share}

  cd "${pkgdir}"/usr/bin
  mv gtk-query-immodules-2.0 gtk-query-immodules-2.0-32
  rm -f gtk-builder-convert gtk-demo gtk-update-icon-cache
}

