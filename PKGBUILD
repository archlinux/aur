# Maintainer: Michele Mocciola <mickele>
pkgname=aster
pkgver=12.6.0
pkgrel=1
pkgdesc="Code-Aster"
url="http://www.code-aster.org/"
license=("GPL")
depends=('python2' 'astk>=1.13.8' 'metis4' 'med>=3.2.0' 'hdf5_18' 'mumps4')
makedepends=()
install="${pkgname}.install"
arch=('i686' 'x86_64')
_astersubver=4
source=("http://www.code-aster.org/FICHIERS/aster-full-src-${pkgver}-${_astersubver}.noarch.tar.gz")
options=(!strip)

_sourcedir=
_installdir=/usr
_installsuff=${pkgver:0:4}

prepare(){
  cd "${srcdir}"
  tar xzf "${srcdir}/aster-full-src-${pkgver}/SRC/aster-${pkgver}.tgz"
}

build() {
  cd "${srcdir}"

  cd "${srcdir}/aster-${pkgver}"
  LIBPATH="/usr/lib/hdf5_18 /usr/lib" INCLUDES="/usr/include/hdf5_18 /usr/include/metis-4 /usr/include" PYTHON="/usr/bin/python2" LRELEASE="lrelease-qt4" python2 waf configure --prefix="${pkgdir}${_installdir}" --enable-mumps --metis-libs=metis-4 --scotch-libs='esmumps scotch bz2 scotcherr' --install-as=${_installsuff} --enable-hdf5
  python2 waf build
  # python2 waf build_debug
}

package() {
  cd "${srcdir}/aster-${pkgver}"
  python2 waf install --install-tests
  # python2 waf install_debug
  for _FILE in share/aster/${_installsuff}/profile.sh share/aster/${_installsuff}/config.txt include/aster/${_installsuff}/asterf_config.h include/aster/${_installsuff}/asterc_config.h lib/aster/${_installsuff}/aster_pkginfo.py
  do
    sed -e "s|${pkgdir}||g" -i "${pkgdir}${_installdir}/${_FILE}"
  done
}
md5sums=('1603b6f94fdbdec2977b2e864b3b0f4a')
