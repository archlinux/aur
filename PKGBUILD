# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

_pkgname=numpy
#pkgbase=python-numpy-openblas
#pkgname=("python2-numpy-openblas" "python-numpy-openblas")
pkgname=python2-numpy-openblas
pkgver=1.9.2
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
source=("http://downloads.sourceforge.net/numpy/numpy-${pkgver}.tar.gz"
        site.cfg
       ) 

md5sums=('a1ed53432dbcd256398898d35bc8e645'
         '6f15bb8fe3d12faa8983a9e18bbea2a9')

package() {
  package_python2-numpy-openblas
}

package_python2-numpy-openblas() {
  depends=("python2" "openblas-lapack")
  options=('staticlibs')
  makedepends=("python2-distribute" "gcc-fortran" "python2-nose")
  optdepends=("python2-nose: testsuite")
  provides=("python2-numpy=${pkgver}")
  conflicts=("python2-numpy")

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  cd "${srcdir}"
  cp -a "$_pkgname-$pkgver"{,-py2}

  echo "Building Python2"
  cd "$_pkgname-$pkgver"-py2
  cp ${startdir}/site.cfg .

  python2 setup.py config_fc --fcompiler=gnu95 config
  python2 setup.py config_fc --fcompiler=gnu95 build

  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyver}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyver}/numpy"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name "*.py")
}

package_python-numpy-openblas() {
  depends=("python" "openblas-lapack")
  options=('staticlibs')
  makedepends=("python-distribute" "gcc-fortran" "python-nose")
  optdepends=("python-nose: testsuite")
  provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
  conflicts=("python3-numpy" "python-numpy")

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir"
  cp -a "$_pkgname-$pkgver"{,-py3}

  echo "Building Python3"
  cd "$_pkgname-$pkgver"-py3
  cp ${startdir}/site.cfg .

  python2 setup.py config_fc --fcompiler=gnu95 config
  python2 setup.py config_fc --fcompiler=gnu95 build

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyinc}/numpy"

}

