# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=chronojump
pkgname=$_name-git
pkgver=1.9.0.1202.g8c3585bc
pkgrel=1
pkgdesc="Measurement, management and statistics of sport short-time tests"
arch=('x86_64')
url="http://chronojump.org/"
license=('GPL2')
depends=(python gtk2)
makedepends=(gtk-sharp-2 mono intltool git)
provides=($_name)
conflicts=($_name)
options=(!libtool)
install=$pkgname.install
source=("git+https://gitlab.gnome.org/GNOME/$_name.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/-/./g'
}

prepare() {
  cd "$_name"
  NOCONFIGURE=1 ./autogen.sh
  # Fix path to Mono 4.0 GAC (/usr/lib/mono/4.0-api/)
  sed -i 's|/mono/4.0/|/mono/4.0-api/|' configure
}

build() {
  cd "$_name"
  ./configure --prefix=/usr
  make
}

# Error in https://bugzilla.gnome.org/show_bug.cgi?id=774404
check() {
  cd "$_name"
  make -k check || true
}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
}
