# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.9.1
pkgrel=1
pkgdesc='Lightweight X11 desktop panel for LXDE (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('alsa-lib' 'menu-cache' 'lxmenu-data' 'libfm-gtk3' 'libkeybinder3')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz)
sha256sums=('11c7be044616c457cd18555758ae00c953c118cbfe0b0d6f4010bdacecc751b1')

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
