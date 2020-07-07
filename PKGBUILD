# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.10.0
pkgrel=2
pkgdesc='Lightweight X11 desktop panel for LXDE (GTK+ 3 version)'
arch=('x86_64')
license=('GPL2')
url='https://lxde.org/'
groups=('lxde-gtk3')
depends=('alsa-lib' 'curl' 'menu-cache' 'lxmenu-data' 'libfm-gtk3' 'libkeybinder3')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
source=(https://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
sha256sums=('4678cc8c5f1962376005ebf71ec1ee810115ac2e0e565f8d2e67dc12d01a3a7e')

prepare() {
  cd $_pkgname-$pkgver

  # Disable pager plugin as it breaks panel layout with GTK+ 3
  # https://sourceforge.net/p/lxde/bugs/773/
  sed -i '/pager.c/d' plugins/Makefile.am
  sed -i '/STATIC_PAGER/d' src/private.h
  sed -i 's/libwnck-3.0//' configure.ac
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr \
    --enable-gtk3

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
