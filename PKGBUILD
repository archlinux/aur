# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# TU: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>
 
pkgname=boost
pkgver=1.41.0
_boostver=1_41_0
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries"
arch=('i686' 'x86_64')
url="http://www.boost.org/"
depends=('bzip2' 'zlib')
makedepends=('python>=2.6')
optdepends=('python: for python bindings')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${_boostver}.tar.gz)
license=('custom')
options=(!ccache)
md5sums=('ddb04c9b9164a36a91dcf36819666dd9')

build() {
  cd "${srcdir}/${pkgname}_${_boostver}"

  # build bjam
  cd ${srcdir}/${pkgname}_${_boostver}/tools/jam/src
  ./build.sh cc || return 1

  _bindir="bin.linuxx86"
  [ "${CARCH}" = "x86_64" ] && _bindir="bin.linuxx86_64"

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 ${_bindir}/bjam ${pkgdir}/usr/bin/bjam || return 1
 
  # build bcp
  cd ${srcdir}/${pkgname}_${_boostver}/tools/bcp
  ../jam/src/${_bindir}/bjam || return 1
  install -m755 ${srcdir}/${pkgname}_${_boostver}/dist/bin/bcp \
                ${pkgdir}/usr/bin/bcp || return 1

  # build libs
  cd ${srcdir}/${pkgname}_${_boostver}
  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  ./tools/jam/src/${_bindir}/bjam \
            release debug-symbols=off threading=single,multi \
            runtime-link=shared link=shared,static \
            cflags=-fno-strict-aliasing \
            --prefix=${pkgdir}/usr \
            -sPYTHON_ROOT=/usr \
            -sPYTHON_VERSION=2.6 \
            -sTOOLS=gcc \
            --layout=tagged \
            install || return 1

  # build pyste
  cd ${srcdir}/${pkgname}_${_boostver}/libs/python/pyste/install
  python setup.py install --root=${pkgdir} || return 1

  # license
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/${pkgname}_${_boostver}/LICENSE_1_0.txt \
                ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
