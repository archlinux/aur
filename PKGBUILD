# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=bertini_real-git
pkgver=r1075.3dbac52
pkgrel=1
pkgdesc="Numerical decomposition of real algebraic sets, based on the Bertini homotopy continuation solver"
url="http://www.bertinireal.com/"
arch=('x86_64')
license=('custom: Bertini license')
depends=('bertini' 'boost' 'gmp' 'mpfr' 'openmpi')
optdepends=('python: Python interface'
            'python-sympy: Python interface'
            'python-scipy: Python interface'
            'python-numpy: Python interface'
            'python-algopy: Python interface'
            'python-mpmath: Python interface'
            'python-dill: Python interface'
            'python-matplotlib: Python interface')
provides=('bertini_real')
source=("git://github.com/ofloveandhate/bertini_real")
md5sums=('SKIP')

pkgver () {
  cd bertini_real
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${srcdir}/bertini_real
  libtoolize
  autoreconf -i
  CPPFLAGS="$CPPFLAGS -I/usr/include/bertini"
  ./configure --prefix=/usr CPPFLAGS="$CPPFLAGS" --includedir=/usr/include/bertini_real
  make
}

package() {
  cd ${srcdir}/bertini_real
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  make DESTDIR="${pkgdir}" install

  if python --version; then
    PYV=$(python -c 'from sys import version_info; print (str (version_info[0]) + "." + str (version_info[1]))')
    install -d "${pkgdir}/usr/lib/python${PYV}/site-packages"
    cp -r python/bertini_real "${pkgdir}/usr/lib/python${PYV}/site-packages/"
  fi
}
