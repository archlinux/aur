# $Id: PKGBUILD 102844 2013-12-22 01:57:44Z bgyorgy $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=lxpolkit-git
pkgver=0.1.0.r34.g55fc5d4
pkgrel=5
epoch=1
pkgdesc="Simple polkit authentication agent for LXDE"
arch=('i686' 'x86_64')
url="http://blog.lxde.org/?p=674"
license=('GPL')
groups=('lxde')
depends=('gtk2' 'polkit')
provides=('lxpolkit')
conflicts=('lxpolkit')
makedepends=('git' 'intltool')
source=("$pkgname::git://lxde.git.sourceforge.net/gitroot/lxde/lxpolkit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long| sed -r 's,([^-]*)-g,r\1-g,;s,-,.,g'
}

prepare() {
  cd $pkgname
  # Don't conflict with MATE and Razor-qt (they have their own polkit agents)
  sed -i '/^NotShowIn/ s/GNOME;KDE;/GNOME;KDE;MATE;Razor;/' data/lxpolkit.desktop.in.in
  sed -e '/AM_INIT_AUTOMAKE/s,-Werror,,' -i configure.ac
  # Get current automake major and minor version
  automakeVer=$(automake --version|head -1|awk '{print$4}'|sed -e 's,\.[^.]*$,,')
  sed -e "/AM_INSTALLED_VERSION/s,1.11,${automakeVer}," -i autogen.sh
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/lxpolkit
  make CFLAGS="$CFLAGS -Wno-deprecated-declarations -Wno-format -Wno-format-security"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
