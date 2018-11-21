# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=vala-panel-appmenu
_gitcommit=6d30c2961a002789cbfe98827744edb2a9c2e3a1
_cmakevala_gitcommit=1bce300e6995c055296a79122d19993bc5085b75

pkgname=budgie-vala-panel-appmenu-applet
pkgver=0.7.1+1+6d30c29
pkgrel=2
pkgdesc="Vala Panel Application Menu for Budgie Desktop"
url='https://github.com/rilian-la-te/vala-panel-appmenu'
arch=('i686' 'x86_64')
license=('LGPL3')
depends=(
  'appmenu-gtk-module>=0.6.94'
  'budgie-desktop'
  'vala-panel-appmenu-common>=0.7.1'
)
optdepends=(
  'appmenu-qt4: for qt4 menus'
  'appmenu-qt5: for qt5 menus'
  'libdbusmenu-gtk2: for Chromium/Google Chrome support'
  'libdbusmenu-gtk3: for Chromium/Google Chrome support'
)
makedepends=(
  'bamf>=0.5.0'
  'cmake>=3.6'
  'gobject-introspection'
  'glib2>=2.50'
  'gtk3>=3.22'
  'libwnck3>=3.4.8'
  'vala>=0.34'
)
conflicts=('vala-panel-appmenu-budgie-git')

source=(
  "git+https://github.com/rilian-la-te/vala-panel-appmenu.git#commit=${_gitcommit}"
  "git+https://github.com/rilian-la-te/cmake-vala.git#commit=${_cmakevala_gitcommit}"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  rm -rf "${srcdir}/${_srcname}/cmake"
  cd "${srcdir}/cmake-vala"
  cp -r . "${srcdir}/${_srcname}/cmake"

  cd "${srcdir}/${_srcname}"
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
    -DENABLE_BUDGIE=ON

  make
}

package() {
  cd "${srcdir}/${_srcname}/build"
  make -C "lib" DESTDIR="${pkgdir}" install
  make -C "data" DESTDIR="${pkgdir}" install

  # These files have moved to vala-panel-appmenu-common package.
  rm -rf "${pkgdir}/usr/share"

  # Document and license.
  cd "${srcdir}/${_srcname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
