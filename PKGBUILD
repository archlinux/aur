# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.8.1
pkgrel=3
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
        git-fixes.patch
        0001-batt-plugin-Fix-with-GTK3.patch)
sha256sums=('c657eb049a0f59e7b2d1ad6cb621c272833b765705c19089e48b3c248351b1e0'
            '97895bbaf67231ea1e24f0ed98f434a124bcbbe8fd65a600447cc31e155b5c45'
            '1b72f27d705c66a312315441bdd1faaf60b727fb5bff323b3a632f9c11faf421')

prepare() {
  cd $_pkgname-$pkgver

  # Apply fixes from git
  patch -Np1 -i ../git-fixes.patch
  patch -Np1 -i ../0001-batt-plugin-Fix-with-GTK3.patch

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
