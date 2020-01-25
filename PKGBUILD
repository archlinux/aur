# Maintainer:  AppleBloom <rat.o.drat@gmail.com>

_pkgname="easystroke"
pkgname="$_pkgname-git"
pkgver=0.6.0.r9.gf7c1614
pkgrel=2
pkgdesc="Gesture-recognition application for X11."
arch=("i686" "x86_64")
url="https://github.com/thjaeger/easystroke/wiki"
license=("custom")
depends=("gtkmm3" "boost-libs" "libxtst" "dbus-glib" "xorg-server")
makedepends=("boost" "xorgproto" "intltool" "gettext" "xorg-server-devel" "help2man" "git")
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+https://github.com/thjaeger/easystroke.git"
        "sigc.patch"
        "dont-ignore-xshape-when-saving.patch"
        "add-toggle-option.patch"
        "abs.patch")
md5sums=("SKIP"
         "25fb4b21e36501276285caa788e1acd0"
         "b9cd799d59ec868371e8e6c538d43bf6"
         "39013c97c368735967a2f6897c96d614"
         "cf43fd18e370a37d9e780df97f1cbf92")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "$_pkgname"
  for patch in ../*.patch
  do
    patch -i "$patch"
  done
}

build() {
  cd "$_pkgname"
  make
  make man
}

package() {
  cd "$_pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
