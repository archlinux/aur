# Maintainer: sfs sfslinux@gmail.com

pkgname=yad-light
_pkgname=yad
pkgver=14.1
pkgrel=3
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line w\o html, spell, sourceview'
url='https://github.com/v1cont/yad'
arch=('x86_64')
license=('GPL3')
depends=('gtk3')
makedepends=('autoconf' 'automake' 'intltool')
source=("https://git.altlinux.org/tasks/398769/build/100/x86_64/srpm/yad-14.1-alt1.src.rpm")
sha256sums=('520dc26b56c2da198798d65a34f19f409c2d4ff8721f1ad12c2a0be460935594')
replaces=('yad')
provides=('yad')
conflicts=('yad' 'yad-git' 'yad-gtk2')

prepare() {
  tar -xf v14.1.tar.gz
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp ../ru.po po && echo ru >> po/LINGUAS
#  patch -Np0 -i ../fix-missing-buttons.patch 
  patch -Np1 -i ../show-cursor-initially.patch 
  # use webkit2gtk-4.1
  sed -i 's|webkit2gtk-4.0|webkit2gtk-4.1|' configure.ac

  autoreconf -ivf
  intltoolize
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-icon-browser \
    --disable-html \
    --disable-spell \
    --disable-sourceview

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
