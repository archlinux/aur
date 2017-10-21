# Maintainer: jtts
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=gnome-themes-standard
pkgname=lib32-$_pkgbasename
pkgver=3.22.3+13+ga993fdc0
pkgrel=1
pkgdesc="Default themes for the GNOME desktop (32-bit)"
url="https://git.gnome.org/browse/gnome-themes-standard"
arch=(x86_64)
license=(GPL2)
depends=(cantarell-fonts ttf-dejavu lib32-librsvg $_pkgbasename)
makedepends=(gcc-multilib intltool lib32-gtk2 lib32-gtk3 gnome-common git)
optdepends=('lib32-gtk-engines: HighContrast GTK2 theme')
groups=(gnome)
replaces=(lib32-gnome-themes)
conflicts=(gnome-themes lib32-gnome-themes)
options=(!emptydirs)
_commit=a993fdc050a001fe7880b29155908772f874efb4  # master
source=("git+https://git.gnome.org/browse/gnome-themes-standard#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbasename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbasename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename
  ./configure --prefix=/usr --libdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgbasename
  make DESTDIR="${pkgdir}" install

  # remove unneeded stuff
  rm -fr ${pkgdir}/{usr/{bin,include,share},etc}
}
