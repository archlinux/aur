# Maintainer: Michele Mocciola <mickele>

pkgname=salome-aster
pkgver=2015.2
_pkgsubver=2
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - ASTER Module"
url="http://www.code-aster.org/V2/spip.php?article295"
depends=('salome-gui>=7.6.0' 'salome-gui<7.7.0' 'aster' 'astk')
makedepends=()
arch=('i686' 'x86_64')
license=('LGPL')
source=("https://bitbucket.org/code_aster/salome-codeaster/get/${pkgver}.tar.gz" "http://www.code-aster.org/FICHIERS/SALOME-MECA-${pkgver}-LGPL-${_pkgsubver}.tgz" ${pkgname}.profile)

_source=code_aster-salome-codeaster-e854b3295450
_installdir=/opt/salome/aster

prepare() {
  # extracts salome_meca (we need salome_pyutils)
  cd "$srcdir"
  tail --lines=+834 SALOME-MECA-${pkgver}-LGPL.run > extracted.tar.gz
  tar xzf extracted.tar.gz

  # python -> python2
  cd "$srcdir/$_source"
  for _FILE in profile_init.sh salome/tests/test_run_aster_solver.py salome/aster_gui_tests.py tests/gui-supervision/aster-solver tests/gui-supervision/astk-tasks tests/gui-supervision/salome-supervisor.py
  do
    sed -e "s|python|python2|" -i ${_FILE}
  done
}

build() {
  cd "${srcdir}"
}

package() {
  source /etc/salome/profile.d/salome-kernel.sh

  cd "$srcdir/$_source"
  python2 setup.py install --prefix="${_installdir}" --root="${pkgdir}"
  
  mv "${srcdir}/V2015_2/tools/Salomemeca_pyutils-${pkgver:0:4}${pkgver:5:1}/lib/python2.7/site-packages"/* "${pkgdir}${_installdir}/lib/python2.7/site-packages/"
  
  install -D -m755 "${srcdir}/${pkgname}.profile" \
                   "${pkgdir}/etc/salome/profile.d/${pkgname}.sh"
}
md5sums=('653acb524798af15345153941365d8d6'
         'a78eae0b1937f06ced8e7f570b05f94b'
         '06386b053b5ab14dceea6532aa4e9bf5')
