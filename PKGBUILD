# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.8.2
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
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        gtk3.patch)
sha256sums=('516ac4c83494ee99b2a0d2466458519a9a2668272eeff6d2162af3683b634104'
            'b2a0ea2f41cc65615255d044b2a9413fd1e8adf8ba70b7b742d0f3aee1d2d4f5')

prepare() {
  cd $_pkgname-$pkgver

  # Port to GTK+ 3
  patch -Np1 -i ../gtk3.patch

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
