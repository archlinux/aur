# Maintainer: jtts
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_pkgbasename=gnome-themes-standard
pkgname=lib32-$_pkgbasename
pkgver=3.20
pkgrel=1
pkgdesc="Default themes for the GNOME desktop (32-bit)"
arch=(x86_64)
url="http://www.gnome.org"
license=(GPL2)
depends=(cantarell-fonts ttf-dejavu lib32-librsvg $_pkgbasename)
makedepends=(gcc-multilib intltool lib32-gtk2 lib32-gtk3)
optdepends=('lib32-gtk-engines: HighContrast GTK2 theme')
groups=(gnome)
replaces=(lib32-gnome-themes)
conflicts=(gnome-themes lib32-gnome-themes)
options=('!emptydirs')
source=(http://download.gnome.org/sources/$_pkgbasename/${pkgver:0:4}/$_pkgbasename-$pkgver.tar.xz)
sha256sums=('1cde84b34da310e6f2d403bfdbe9abb0798e5f07a1d1b4fde82af8e97edd3bdc')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="${pkgdir}" install

  # remove unneeded stuff
  rm -fr ${pkgdir}/{usr/{bin,include,share},etc}
}
