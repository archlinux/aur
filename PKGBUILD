# $Id: PKGBUILD 164237 2012-07-28 03:14:33Z stephane $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Adapted to mkl by Simone Riva
pkgbase="python-numpy-mkl"
pkgname="python-numpy-mkl"
true && pkgname=('python-numpy-mkl' 'python2-numpy-mkl')
#pkgname=('python-numpy')
pkgver=1.9.2
pkgrel=1
pkgdesc="Scientific tools for Python compiled with intel mkl"
arch=('i686' 'x86_64')
license=('custom')
options=('staticlibs')
url="http://numpy.scipy.org/"
depends=( 'intel-mkl' 'python' 'python2'  )
makedepends=( 'python-setuptools' 'python2-setuptools' 'intel-compiler-base' 'intel-fortran-compiler'  'python-nose' 'python2-nose' )

source=( http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz 
	  'site64.cfg' 'site32.cfg' 'intel.py' 'intelccompiler.py' '__init__2.py.patch' '__init__3.py.patch' )

md5sums=( 'a1ed53432dbcd256398898d35bc8e645' 
	  'e100a52fd644eb4a84217b3b7cce441a' 
	  '86934d30d5ba2fa6b938f58b284690f0' 
	  '5c116163f3309d774d183504ea662c67' 
	  'e01a59fb867cbf3b44a30ec71953a710'
	  'b50692cecf5ff9439f29753bf53961f7'
	  'b50692cecf5ff9439f29753bf53961f7'
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

  patch ${pkgdir}/usr/lib/python3.4/site-packages/numpy/distutils/fcompiler/__init__.py ${srcdir}/__init__3.py.patch
}
