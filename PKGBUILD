# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
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
depends=('gtk3' 'alsa-lib' 'menu-cache' 'lxmenu-data' 'libfm-gtk3' 'libkeybinder3')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        lxpanel-0.8.0-gtk3.patch
        0001-netstat-some-fixes-for-GTK3.patch
        0001-batt-plugin-Fix-with-GTK3.patch
        0001-launchtaskbar-fix-scroll-event-with-GTK3.patch
        0001-Replace-old-unused-commands.patch)
sha256sums=('c657eb049a0f59e7b2d1ad6cb621c272833b765705c19089e48b3c248351b1e0'
            '2397d98806df273f32d35d66fcc532fdf08bec783e727b0ecfb30b7fcb9851df'
            '0e5c6b9a71f3b694359efb35495143b7ec32a8d85d4923575cf85b0411150261'
            '229e6c9f30afae117a6075477d5c0065314eb4ff7b33fba3d00aa24b848b1b8b'
            '95d27e94b57e823a56295244c4cf07ac3da37600d4bced7128a059b2817f0679'
            'dccd778ba6930f52d4a87cc38d898f18c13f19efbae94aadaec180133e700053')

prepare() {
  cd $_pkgname-$pkgver

  # Port to GTK+ 3
  patch -Np1 -i ../lxpanel-0.8.0-gtk3.patch
  patch -Np1 -i ../0001-netstat-some-fixes-for-GTK3.patch
  patch -Np1 -i ../0001-batt-plugin-Fix-with-GTK3.patch
  patch -Np1 -i ../0001-launchtaskbar-fix-scroll-event-with-GTK3.patch
  patch -Np1 -i ../0001-Replace-old-unused-commands.patch
  rm data/ui/*.ui

  # Disable pager plugin as it breaks panel layout with GTK+ 3
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
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
