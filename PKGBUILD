# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=vala-panel-appmenu
_gitcommit=6d30c2961a002789cbfe98827744edb2a9c2e3a1
_cmakevala_gitcommit=1bce300e6995c055296a79122d19993bc5085b75

pkgname=vala-panel-appmenu-common
pkgver=0.7.1+1+6d30c29
pkgrel=2
pkgdesc="Common libraries and translations for Vala Panel Application Menu"
url='https://github.com/rilian-la-te/vala-panel-appmenu'
arch=('any')
license=('LGPL3')
makedepends=(
  'bamf>=0.5.0'
  'cmake>=3.6'
  'glib2>=2.50'
  'gtk3>=3.22'
  'vala>=0.34'
)
conflicts=(
  'vala-panel-appmenu-budgie-git'
  'vala-panel-appmenu-mate-git'
  'vala-panel-appmenu-translations-git'
  'vala-panel-appmenu-valapanel-git'
)

source=(
  "git+https://github.com/rilian-la-te/vala-panel-appmenu.git#commit=${_gitcommit}"
  "git+https://github.com/rilian-la-te/cmake-vala.git#commit=${_cmakevala_gitcommit}"
  enable-only-common.diff
)
sha256sums=(
  'SKIP'
  'SKIP'
  'dbdc3293ff6e8cecdfb8b66d101cdc6254c8cf05e6352e3c03f7a02d8d7eb0c2'
)

prepare() {
  rm -rf "${srcdir}/${_srcname}/cmake"
  cd "${srcdir}/cmake-vala"
  cp -r . "${srcdir}/${_srcname}/cmake"

  cd "${srcdir}/${_srcname}"
  patch -p0 -i ../enable-only-common.diff
  mkdir -p build
}

build() {
  cd "${srcdir}/${_srcname}/build"
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DENABLE_APPMENU_GTK_MODULE=OFF \
    -DENABLE_REGISTRAR=OFF \
    -DENABLE_JAYATANA=OFF \
    -DENABLE_MATE=OFF \
    -DENABLE_XFCE=OFF \
    -DENABLE_VALAPANEL=OFF \
    -DENABLE_BUDGIE=OFF \
    -DENABLE_ONLY_COMMON=ON

  make
}

package() {
  cd "${srcdir}/${_srcname}/build"

  make -C "po" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install
}
