# Maintainer: Michele Mocciola <mickele>

pkgname=eficas
pkgver=2015.2
pkgrel=1
pkgdesc="ASter Command FIle Editor. Editor of Code_Aster's command files."
url="http://www.code-aster.org/"
license="GPL"
depends=('python2' 'python2-pyqt' 'python2-numpy')
makedepends=('desktop-file-utils' 'gcc-fortran')
arch=('i686' 'x86_64')
_asterver=12.4.0
_astersubver=1
source=("http://www.code-aster.org/FICHIERS/aster-full-src-${_asterver}-${_astersubver}.noarch.tar.gz" "eficas.png" "eficas.desktop")

build() {
    cd "${srcdir}/aster-full-src-${_asterver}"
    sed -e "s|should_continue()|# should_continue()|g" -i setup.py
}

package() {
  cd "${srcdir}/aster-full-src-${_asterver}"

  python2 setup.py install --prefix="${pkgdir}/opt/eficas" eficas
  sed -e "s|python|python2|" -i "${pkgdir}/opt/eficas/public/${pkgname}-${pkgver}/eficasQt"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s /opt/eficas/bin/eficas "${pkgdir}/usr/bin/"

  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"
}
md5sums=('5378bf134ae67ef80e74967b73c3d0e5'
         '246438dfb94a62aff24fcd7b05f5a7d7'
         '0315674d3dd04af7f2125576d651a94b')
