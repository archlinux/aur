# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xtrkcad-hg
pkgver=r5254
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('cmake' 'mercurial' 'gettext' 'freeimage' 'inkscape')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=(hg+http://hg.code.sf.net/p/xtrkcad-fork/xtrkcad)
sha512sums=('SKIP')
_hgname='xtrkcad'

pkgver() {
  cd ${_hgname}
  printf "r%s" "$(hg identify -n)"
}

build() {
  cd ${_hgname}
  cmake \
      -DUNIX=1 \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_EXE_LINKER_FLAGS="-lm" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DXTRKCAD_USE_GETTEXT="ON" \
      -DCMAKE_EXE_LINKER_FLAGS="-lm -Wl,--allow-multiple-definition"
  make -j4
}

package() {
  cd ${_hgname}
  make DESTDIR=${pkgdir} install
  mv "${pkgdir}/usr/bin/xtrkcad-beta" "${pkgdir}/usr/bin/xtrkcad"
  mv "${pkgdir}/usr/share/xtrkcad-beta" "${pkgdir}/usr/share/xtrkcad"
  install -Dm644 "app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "app/lib/xtrkcad.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}
