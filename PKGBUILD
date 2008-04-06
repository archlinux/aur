# $Id: PKGBUILD,v 1.22 2008/03/23 15:41:51 jgc Exp $
# Maintainer: kevin <kevin@archlinux.org>
# TU: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>
 
pkgname=boost
pkgver=1.34.1
_boostver=1_34_1
pkgrel=2
pkgdesc="Boost provides free peer-reviewed portable C++ source libraries."
arch=(i686 x86_64)
url="http://boost.sourceforge.net/"
depends=('python>=2.5' 'bzip2' 'zlib')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_${_boostver}.tar.gz
	05_all_1.34.1-function.patch
	07_all_1.34.1-CVE-2008-0171_and_0172.patch
	gcc-4.3.patch)
license=('custom')
md5sums=('5290a2a565d7d15a31bb1136a7c308d7'
         'bfa69fba1bc46e2e4c7d316f0c2e6c99'
         'da137f9c745601d6e723285e7e92d0dc'
         '7b4d72595cca0db01b9f6b3a336daa14')
 
build() {
  cd $startdir/src/${pkgname}_${_boostver}
  export CFLAGS="${CFLAGS} -fno-strict-aliasing"

  patch -Np1 -i ${startdir}/src/05_all_1.34.1-function.patch || return 1
  patch -Np1 -i ${startdir}/src/gcc-4.3.patch || return 1
  patch -Np0 -i ${startdir}/src/07_all_1.34.1-CVE-2008-0171_and_0172.patch || return 1

  # build bjam
  cd $startdir/src/${pkgname}_${_boostver}/tools/jam/src
  ./build.sh cc || return 1

  _bindir="bin.linuxx86"
  [ "${CARCH}" = "x86_64" ] && _bindir="bin.linux"

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
