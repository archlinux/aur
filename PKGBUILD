# myswiat - mariusz
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgbase=lxappearance-git
pkgname=('lxappearance-git' 'lxappearance-gtk3-git')
pkgver=0.6.3.1r72
pkgrel=1
url="https://wiki.lxde.org/en/LXAppearance"
pkgdesc="Feature-rich GTK+ theme switcher of the LXDE Desktop from git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'glib2' 'menu-cache')
makedepends=('git' 'intltool' 'pkgconfig' 'autoconf' 'perl' 'gtk-doc')
provides=('lxappearance')
conflicts=('lxappearance')
source=("git://git.lxde.org/lxde/lxappearance.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  printf %sr%s $(git describe --tags | sed 's|-|.|g'| cut -c8-) $(git rev-list --count HEAD)
}

build() {
  [ -d gtk2 ] || cp -r ${pkgbase%-git} gtk2
  cd gtk2
  ./configure --sysconfdir=/etc --prefix=/usr --enable-dbus
  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r ${pkgbase%-git} gtk3
  cd gtk3
  ./configure --prefix="/usr" --sysconfdir="/etc" --enable-man --enable-gtk3 --enable-dbus
  make
}

package_lxappearance-git() {
  depends=('gtk2')
  cd gtk2
  
  make DESTDIR="$pkgdir" install
}

package_lxappearance-gtk3-git() {
  pkgdesc+=' (GTK+ 3 version)'
  depends=('gtk3')
  conflicts=('lxappearance')

  cd gtk3
  make DESTDIR="$pkgdir" install
}
