# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-gnome-themes-extra
pkgver=3.28
pkgrel=2
pkgdesc="Extra Themes for GNOME Applications (32-bit)"
url="https://gitlab.gnome.org/GNOME/gnome-themes-extra"
arch=(x86_64)
license=(LGPL2.1)
depends=(cantarell-fonts ${pkgname#lib32-})
makedepends=(intltool wayland-protocols lib32-gtk2 lib32-gtk3 git)
optdepends=('lib32-gtk-engines: HighContrast GTK2 theme')
provides=("lib32-gnome-themes-standard=$pkgver")
conflicts=(lib32-gnome-themes-standard)
replaces=('lib32-gnome-themes-standard<3.27.92')
groups=(gnome)
_commit=9f581269243dd7e76b3eb8cec9cf4128ab17da9e  # tags/3.28^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-themes-extra.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname#lib32-}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname#lib32-}
  mkdir m4
  intltoolize
  autoreconf -fvi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${pkgname#lib32-}
  ./configure --prefix=/usr --libdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname#lib32-}
  make DESTDIR="$pkgdir" install
  # remove unneeded stuff
  rm -fr ${pkgdir}/{usr/{bin,include,share},etc}
}

# vim:set ts=2 sw=2 et:
