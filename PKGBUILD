# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=gtkada-git
pkgver=25.0.0.r17.g054a067e5bcb
pkgrel=1
pkgdesc='a high-level portable graphical toolkit, based on the gtk+ toolkit'
arch=('aarch64' 'x86_64')
url='https://www.adacore.com/gtkada'
license=('GPL-3.0-with-GCC-exception')
options=('!lto')
conflicts=(gtkada)
provides=("gtkada=${pkgver%%.r*}")
depends=(cairo gcc-ada glib2 gtk3 fontconfig pango)
makedepends=(gcc-ada gprbuild gprtools)
source=("git+https://github.com/AdaCore/gtkada#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd gtkada
  git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gtkada
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd gtkada 

  make -j1 DESTDIR="${pkgdir}" install
  install -Dm644 COPYING3 "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING3
  install -Dm644 COPYING.RUNTIME "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.RUNTIME

  rm -rf "${pkgdir}"/usr/share/examples
  find "${pkgdir}" -iname "*.ali" | while read -r F; do sed -i '/gnat.adc/d' $F; done
}
