# Maintainer: Jelle van der Waa <jelle@archlinux.org

pkgname=libnest2d
pkgver=0.4
pkgrel=2
pkgdesc='2D irregular bin packaging and nesting library written in modern C++'
arch=(x86_64)
url='https://github.com/tamasmeszaros/libnest2d'
license=('LGPL')
depends=(nlopt polyclipping)
makedepends=(boost cmake git)
source=(git+https://github.com/tamasmeszaros/libnest2d#commit=da4782500da4eb8cb6e38e5e3f10164ec5a59778
        allow-disallowed-area.patch::https://patch-diff.githubusercontent.com/raw/tamasmeszaros/libnest2d/pull/18.patch
        fix-cpp-version.patch)
sha512sums=('SKIP'
            '3aa147e48671f61e15f1c779bf96852a62c5ec9d2dce7e4d2fa10e72769342f45961598ef961306a206455e86f3d9a2544ab7b03e28937541e88d98a6b34d491'
            '956919502f9110a79729c74745a9095fa82c9f914f6b527fc91ea4f2864960a5437588efa6cd50cdb4970b51ae05cbdae48913f80357a38342b494cd416ba28e')

prepare() {
  cd ${pkgname}
  # https://github.com/tamasmeszaros/libnest2d/pull/18
  patch -Np1 -i ${srcdir}/allow-disallowed-area.patch

  patch -Np1 -i ${srcdir}/fix-cpp-version.patch

  mkdir build
}

build() {
  cd ${pkgname}/build
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake .. -DLIBNEST2D_HEADER_ONLY=OFF -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd ${pkgname}/build
  make DESTDIR="${pkgdir}" install
}
