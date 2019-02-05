# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy-openblas
pkgname=("python-numpy-openblas" "python2-numpy-openblas")
pkgver=1.16.1
pkgrel=2
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
makedepends=('cblas' 'lapack' 'python' 'python2' 'python-setuptools' 'python2-setuptools'
             'gcc-fortran' 'python-nose' 'python2-nose' 'cython' 'cython2')
checkdepends=('python-pytest' 'python2-pytest')
options=('staticlibs')
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz") 
sha256sums=('59485e2d172c4c3e27307969ef2c1220b98efcf59cbf373bec41da19f7b69b92')

prepare() {
  cp -a numpy-$pkgver{,-py2}
  cd numpy-$pkgver-py2

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  cd "$srcdir"/numpy-$pkgver
  python setup.py build

  cd "$srcdir"/numpy-$pkgver-py2
  python2 setup.py build
}

check() {
  # TODO: Fix fortran tests here (it works fine after installation)

  cd "$srcdir"/numpy-$pkgver
  python setup.py config_fc --fcompiler=gnu95 install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.7/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'

  cd "$srcdir"/numpy-$pkgver-py2
  python2 setup.py config_fc --fcompiler=gnu95 install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python2.7/site-packages:$PYTHONPATH" python2 -c 'import numpy; numpy.test()'
}

package_python2-numpy-openblas() {
  depends=("python2" "cython2" "openblas-lapack")
  optdepends=("python2-nose: testsuite")
  provides=("python2-numpy=${pkgver}")
  conflicts=("python2-numpy")

  _pyver=2.7

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}"/numpy-"$pkgver"-py2

  python2 setup.py config_fc --fcompiler=gnu95 build

  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyver}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyver}/numpy"

  mv "$pkgdir"/usr/bin/f2py{,2}
}

package_python-numpy-openblas() {
  depends=("python" "cython" "openblas-lapack")
  optdepends=("python-nose: testsuite")
  provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
  conflicts=("python3-numpy" "python-numpy")

  _pyver=3.7
  _pyinc=3.7m

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python3"
  cd "$srcdir/numpy-$pkgver"

  python setup.py config_fc --fcompiler=gnu95 build

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyinc}/numpy"

}

