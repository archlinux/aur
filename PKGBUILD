# Maintainer: kevin <kevin@archlinux.org>
# TU: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>
 
pkgname=boost
pkgver=1.37.0
_boostver=1_37_0
pkgrel=1
pkgdesc="Boost provides free peer-reviewed portable C++ source libraries."
arch=(i686 x86_64)
url="http://www.boost.org/"
depends=('python>=2.5' 'bzip2' 'zlib')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${_boostver}.tar.gz 0001-date_time-gcc-4.3-fix.patch)
license=('custom')
 
build() {
  cd ${srcdir}/${pkgname}_${_boostver}
  export CFLAGS="${CFLAGS} -fno-strict-aliasing"
  #patch -Np1 -i ${srcdir}/0001-date_time-gcc-4.3-fix.patch || return 1

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
  # default "debug release <runtime-link>static/dynamic <threading>single/multi"
  # --layout=system removes the -gcc suffix from libraries and installs
  # includes in /usr/include/boost.
  ./tools/jam/src/${_bindir}/bjam \
            release debug-symbols=off threading=single,multi \
			runtime-link=shared link=shared,static \
            --prefix=${pkgdir}/usr \
            -sPYTHON_ROOT=/usr \
            -sPYTHON_VERSION=2.5 \
            -sTOOLS=gcc \
            --layout=system \
            install || return 1

  # build pyste
  cd ${srcdir}/${pkgname}_${_boostver}/libs/python/pyste/install
  python setup.py install --root=${pkgdir} || return 1

  # license
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/${pkgname}_${_boostver}/LICENSE_1_0.txt \
                ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
md5sums=('c38b88bb4ebc6d0d9193f432842273d2'
         'd7f821056540ef08eb1d5ebd5ed017f1')
