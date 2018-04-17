# myswiat - mariusz
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgbase=lxappearance-git
pkgname=('lxappearance-gtk2-git' 'lxappearance-gtk3-git')
pkgver=0.6.3.r11.2d6fc0b
pkgrel=1
url="https://wiki.lxde.org/en/LXAppearance"
pkgdesc="Feature-rich GTK+ theme switcher of the LXDE Desktop from git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'glib2' 'menu-cache')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'libxslt' 'gtk-doc')
provides=('lxappearance')
conflicts=('lxappearance')
source=("git://git.lxde.org/lxde/lxappearance.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  printf %s $(git describe --tags | sed 's|-|.r|'| sed 's+-g+.+') 
}

build() {
  [ -d gtk2 ] || cp -r ${pkgbase%-git} gtk2
  cd gtk2
  ./autogen.sh
  ./configure --sysconfdir=/etc --prefix=/usr --enable-man --enable-dbus
  make
  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r ${pkgbase%-git} gtk3
  cd gtk3
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk3 --enable-man --enable-dbus
  make
}

package_lxappearance-gtk2-git() {
  depends=('gtk2')
  conflicts=('lxappearance')
  provides=('lxappearance')
  cd gtk2
  
  make DESTDIR="$pkgdir" install
}

package_lxappearance-gtk3-git() {
  pkgdesc+=' (GTK+ 3 version)'
  depends=('gtk3')
  conflicts=('lxappearance')
  provides=('lxappearance')

  cd gtk3
  make DESTDIR="$pkgdir" install
}
