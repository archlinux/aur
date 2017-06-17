# $Id: PKGBUILD 164237 2012-07-28 03:14:33Z stephane $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Adapted to mkl by Simone Riva
pkgbase="python-numpy-mkl"
pkgname="python-numpy-mkl"
true && pkgname=('python-numpy-mkl' 'python2-numpy-mkl')
#pkgname=('python-numpy')
pkgver=1.13.0
pkgrel=3
pkgdesc="Scientific tools for Python compiled with intel mkl"
arch=('i686' 'x86_64')
license=('custom')
options=('staticlibs')
url="http://numpy.scipy.org/"
depends=( 'intel-mkl' 'python' 'python2'  )
makedepends=( 'python-setuptools' 'python2-setuptools' 'intel-compiler-base' 'intel-fortran-compiler'  'python-nose' 'python2-nose' 'cython' )

source=( https://github.com/numpy/numpy/archive/v${pkgver}.tar.gz 
	  'site64.cfg' 
	  'site32.cfg' 
	  https://raw.githubusercontent.com/numpy/numpy/v${pkgver}/numpy/distutils/fcompiler/intel.py 
	  'intelccompiler.py' 
	  '__init__2.py.patch' 
	  '__init__3.py.patch' )

sha256sums=( 'dbbaaf3e86d0d138d42c61b1243d580bd6351088f0bcf2e44a7374c4559a1845' # main pkg§
             '86cd68a695a5e1d76f8e53cda70c888c4ed04349f15c8096d4492e346e7187e1' # site64
             '882f2717deca0fd6a2e2384aac2dc7973c566f9cd2ba46777c3b5ffdffa814df' # site32
             'e289b6cbb552c547678818172b35cda58064bd39ec2b084c6390142ddf02c4f9' # intel.py
             'a3faf52563f265b8adbb912c6acf969787a9d423e960c877ea9abd128976f814' # intelccompiler.py
             '867e27caa396490e594c269ee24cc8f887a759fccf1f7e507690188f3f84e6f7' # __init__2.py.patch
             '867e27caa396490e594c269ee24cc8f887a759fccf1f7e507690188f3f84e6f7' # __init__3.py.patch
)

build() {

  cd "${srcdir}"
  
  if [ "$CARCH" = "i686" ]; then
      cp ${srcdir}/site32.cfg ${srcdir}/site.cfg
      _compiler=intel
  else
      cp ${srcdir}/site64.cfg ${srcdir}/site.cfg
      _compiler=intelem
  fi

  
  cp -a numpy-${pkgver} numpy-py2-${pkgver}

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}"
  cp ${srcdir}/site.cfg "${srcdir}/numpy-py2-${pkgver}"
  cp ${srcdir}/intelccompiler.py "${srcdir}/numpy-py2-${pkgver}/numpy/distutils"
  cp ${srcdir}/intel.py "${srcdir}/numpy-py2-${pkgver}/numpy/distutils/fcompiler/"
  cd "${srcdir}/numpy-py2-${pkgver}"

  #patch ${srcdir}/numpy-${pkgver}/numpy/numpy/core/src/multiarray/scalarapi.c ${srcdir}/numpy-1.6.2-python-3.3-build-fix.patch
  python2 setup.py config --compiler=intel build_clib --compiler=${_compiler} build_ext --compiler=${_compiler}

  echo "Building Python3"
  cd "${srcdir}"
  cp ${srcdir}/site.cfg "${srcdir}/numpy-${pkgver}"
  cp ${srcdir}/intelccompiler.py "${srcdir}/numpy-${pkgver}/numpy/distutils"
  cp ${srcdir}/intel.py "${srcdir}/numpy-${pkgver}/numpy/distutils/fcompiler/"
  cd "${srcdir}/numpy-${pkgver}"

  #patch -p1 -i ${srcdir}/numpy-1.6.2-python-3.3-build-fix.patch
  
  python setup.py config --compiler=intel build_clib --compiler=${_compiler} build_ext --compiler=${_compiler}
}

package_python2-numpy-mkl() {
  
  depends=('intel-mkl' 'python2')
  provides=( "python2-numpy=${pkgver}" )
  replaces=( "python2-numpy" )
  conflicts=( "python2-numpy" )
  optdepends=('python-nose: testsuite')

  cd "${srcdir}/numpy-py2-${pkgver}"
  python2 setup.py config_fc install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')

  patch ${pkgdir}/usr/lib/python2.7/site-packages/numpy/distutils/fcompiler/__init__.py ${srcdir}/__init__2.py.patch
}

package_python-numpy-mkl() {

  depends=('intel-mkl' 'python')
  provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
  replaces=('python3-numpy')
  conflicts=('python3-numpy' 'python-numpy')

  cd "${srcdir}/numpy-${pkgver}"
  python setup.py config_fc install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python3-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python3-numpy/"

  patch ${pkgdir}/usr/lib/python3.6/site-packages/numpy/distutils/fcompiler/__init__.py ${srcdir}/__init__3.py.patch
}
