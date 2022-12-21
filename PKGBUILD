# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>
# -git version: Berseker <berseker86@gmail.com>

pkgname=nitrogen-git
_gitname=nitrogen
pkgver=1.6.1r306.d48ccb8
pkgrel=1
pkgdesc="Background browser and setter for X windows - git version"
arch=('i686' 'x86_64')
url="https://github.com/l3ib/nitrogen"
license=('GPL')
makedepends=('git')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
conflicts=('nitrogen')

source=("${_gitname}::git+https://github.com/l3ib/nitrogen.git")
md5sums=('SKIP')

options=(!emptydirs)

pkgver() {
  cd "$srcdir/${_gitname}/"
  curver=$(sed -n 's/^AC_INIT(\[nitrogen\],\[\([0-9.]*\)\],\[daf@minuslab.net\])$/\1/p' configure.ac)
  printf "%sr%s.%s" "$curver" "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_gitname}/data"
  sed -i 's/^Categories=Utility;GTK;DesktopSettings;$/Categories=Settings;DesktopSettings;GTK;/' nitrogen.desktop.in
}

build() {
  cd "$srcdir/${_gitname}/"
  autoreconf -fi
  CXXFLAGS='-std=c++11 -g -O2' ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir/" install
  install -D -m644 data/nitrogen.desktop "${pkgdir}/usr/share/applications/nitrogen.desktop"
}
