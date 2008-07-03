# Maintainer: kevin <kevin@archlinux.org>
# TU: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>
 
pkgname=boost
pkgver=1.35.0
_boostver=1_35_0
pkgrel=1
pkgdesc="Boost provides free peer-reviewed portable C++ source libraries."
arch=(i686 x86_64)
url="http://www.boost.org/"
depends=('python>=2.5' 'bzip2' 'zlib')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_${_boostver}.tar.gz serialization_gcc43.patch)
md5sums=('a6b7d92c335c83e69a968a7a7926c933' '43b88598f62485295301f75b94972b81')
license=('custom')
 
build() {
  cd $startdir/src/${pkgname}_${_boostver}
  export CFLAGS="${CFLAGS} -fno-strict-aliasing"
  patch -p5 < ../serialization_gcc43.patch || return 1

  # build bjam
  cd $startdir/src/${pkgname}_${_boostver}/tools/jam/src
  ./build.sh cc || return 1

  _bindir="bin.linuxx86"
  [ "${CARCH}" = "x86_64" ] && _bindir="bin.linuxx86_64"

  install -m755 -d ${startdir}/pkg/usr/bin
  install -m755 ${_bindir}/bjam ${startdir}/pkg/usr/bin/bjam || return 1
 
  # build bcp
  cd ${startdir}/src/${pkgname}_${_boostver}/tools/bcp
  ../jam/src/${_bindir}/bjam || return 1
  install -m755 ${startdir}/src/${pkgname}_${_boostver}/dist/bin/bcp \
                   ${startdir}/pkg/usr/bin/bcp || return 1

  # build libs
  cd ${startdir}/src/${pkgname}_${_boostver}
  # default "debug release <runtime-link>static/dynamic <threading>single/multi"
  # --layout=system removes the -gcc suffix from libraries and installs
  # includes in /usr/include/boost.
  ./tools/jam/src/${_bindir}/bjam \
            release debug-symbols=off threading=single,multi \
			runtime-link=shared link=shared,static \
            --prefix=${startdir}/pkg/usr \
            -sPYTHON_ROOT=/usr \
            -sPYTHON_VERSION=2.5 \
            -sTOOLS=gcc \
            --layout=system \
            install || return 1

  # build pyste
  cd ${startdir}/src/${pkgname}_${_boostver}/libs/python/pyste/install
  python setup.py install --root=${startdir}/pkg || return 1

  # license
  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}_${_boostver}/LICENSE_1_0.txt \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
