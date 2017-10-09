#Maintainer: Yaseen Mowzer <yaseen@mowzer.co.za>
#Contributor: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Juergen Hoetzel <juergen@archlinux.org>
#Contributor: Comete <la_comete@tiscali.fr>

pkgname=python2-vpython
pkgver=6.11
pkgrel=2
pkgdesc="Easy-to-use 3D graphics module for Python."
arch=('i686' 'x86_64')
url="http://www.vpython.org"
depends=('gtkglextmm' 'python2-numpy' 'wxpython' 'tk' 'python2-fonttools' 'python2-polygon' 'python2-ttfquery')
makedepends=('python2-setuptools')
conflicts=('python-vpython')
replaces=('python-vpython')
license=('custom')
options=(!libtool)
_boostversion=1.64.0
_boostversion_underscore=${_boostversion//./_}
noextract=("vpython-wx-src.${pkgver}.tgz")
source=("http://sourceforge.net/projects/vpythonwx/files/${pkgver}-release/vpython-wx-src.${pkgver}.tgz"
        "https://downloads.sourceforge.net/project/boost/boost/${_boostversion}/boost_${_boostversion_underscore}.tar.bz2"
	"setup.patch")
sha256sums=('decfdb3112d24e29b5f6cb47f1ba9c2324520fa83bb34345179179eb572e1776'
            '7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332'
	    'e40de33b66a0f816135eb38ecacfa4b2504debb83d945e2d8e8e839251008830')

prepare() {
  cd "${srcdir}"

  rm -rf vpython-wx-${pkgver}
  mkdir vpython-wx-${pkgver}
  cd vpython-wx-${pkgver}
  tar -xzf "${srcdir}"/vpython-wx-src.${pkgver}.tgz
  patch -p0 < ../setup.patch

  sed -i "s|#![ ]*/usr/bin/env python[^2]|#!/usr/bin/env python2|" site-packages/vidle2/PyShell.py

  cp -r ../boost_${_boostversion_underscore}/boost include
}

build() {
  cd "${srcdir}/boost_${_boostversion_underscore}"
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=/usr/bin/python2 --with-libraries=python,signals

   b2 \
      variant=release \
      debug-symbols=off \
      threading=multi \
      runtime-link=shared \
      link=static \
      toolset=gcc \
      python=2.7 \
      cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
      cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
      linkflags="${LDFLAGS}" \
      --stagedir="${srcdir}/vpython-wx-${pkgver}" \
      stage
  cd "${srcdir}"/vpython-wx-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/vpython-wx-${pkgver}

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

