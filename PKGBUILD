# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-themes-extra-gtk2
_pkgname=gnome-themes-extra
pkgver=3.28+r6+g45b1d457
pkgrel=1
pkgdesc="Extra Themes for GNOME Applications (GTK2 themes)"
url="https://gitlab.gnome.org/GNOME/gnome-themes-extra"
arch=(x86_64)
license=(LGPL2.1)
depends=(gtk-engines)
makedepends=(intltool git)
options=('!emptydirs')
_commit=45b1d457c63b1c7f6c8dcb7fe29b23ec7cd63a14  # master
source=("git+https://gitlab.gnome.org/GNOME/gnome-themes-extra.git#commit=$_commit")
sha256sums=('80722bc5cafa1e58b416f752d1cd03b04bc0a7b7f2b9a17f8486b6068f550d73')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --disable-gtk3-engine
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make -C themes/Adwaita/gtk-2.0 DESTDIR="$pkgdir" install
  make -C themes/Adwaita-dark/gtk-2.0 DESTDIR="$pkgdir" install
  make -C themes/HighContrast/gtk-2.0 DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
