# Maintainer: Michele Mocciola <mickele>

pkgname=eficas
pkgver=2016.0
pkgrel=1
pkgdesc="ASter Command FIle Editor. Editor of Code_Aster's command files."
url="http://www.code-aster.org/"
license=('GPL')
depends=('python2' 'python2-pyqt' 'python2-numpy')
makedepends=('desktop-file-utils' 'gcc-fortran')
arch=('i686' 'x86_64')
_asterver=12.6.0
_astersubver=4
source=("http://www.code-aster.org/FICHIERS/aster-full-src-${_asterver}-${_astersubver}.noarch.tar.gz" "eficas.png" "eficas.desktop")

_installdir=/opt/eficas

build() {
    cd "${srcdir}/aster-full-src-${_asterver}"
    sed -e "s|should_continue()|# should_continue()|g" -i setup.py
}

package() {
  cd "${srcdir}/aster-full-src-${_asterver}"

  python2 setup.py install --prefix="${pkgdir}${_installdir}" eficas
  sed -e "s|python|python2|" -i "${pkgdir}${_installdir}/public/eficas-${pkgver}/eficasQt"

  install -d -m 755 "${pkgdir}/usr/bin/"
  ln -s /opt/eficas/bin/eficas "${pkgdir}/usr/bin/"

  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  cp "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"

  cd ${pkgdir}
  for _FILE in `find ./ -iname *.py`
  do
    sed "s|${pkgdir}||" -i ${_FILE}
  done

  sed -e "s|'/opt/eficas', '12.6', 'lib/aster/Cata/cata.py'|'/usr/lib/aster', '12.6', 'Cata/cata.py'|" -i opt/eficas/public/eficas-${pkgver}/Aster/prefs_ASTER.py
}
md5sums=('1603b6f94fdbdec2977b2e864b3b0f4a'
         '246438dfb94a62aff24fcd7b05f5a7d7'
         '0315674d3dd04af7f2125576d651a94b')
