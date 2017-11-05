# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=('python-scipy-mkl' 'python2-scipy-mkl')
pkgver=1.0.0
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('i686' 'x86_64')
url="http://www.scipy.org/"
license=('BSD')
makedepends=('gcc-fortran' 'python-numpy' 'python2-numpy' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("https://github.com/scipy/scipy/releases/download/v${pkgver}/scipy-${pkgver}.tar.xz")
sha256sums=('06b23f2a5db5418957facc86ead86b7752147c0461f3156f88a3da87f3dc6739')

build() {
	export LDFLAGS="-Wall -shared"

	# set by hand this flag if you want to compile with gcc
	export force_gcc=false

	if hash icc; then
		export use_intel_cc=true
		export use_gcc=false
	else
		export use_intel_cc=false
		export use_gcc=true
	fi

	if [ "$force_gcc" = true ]; then
		export use_intel_cc=false
		export use_gcc=true
	fi

	if [ "$use_intel_cc" = true ]; then
		export __INTEL_PRE_CFLAGS=" -D_Float128=__float128"
	fi

	# 2 builds
	cp -r scipy-${pkgver} scipy-${pkgver}-py2

	# build for python3
	cd scipy-${pkgver}
	if [ "$use_gcc" = true ]; then
		python3 setup.py config_fc --fcompiler=gnu95 build
	fi

	if [ "$use_intel_cc" = true ]; then
		export __INTEL_PRE_CFLAGS=" -D_Float128=__float128"
		python3 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
	fi

	# build for python2
	cd ../scipy-${pkgver}-py2

	for file in $(find . -name '*.py' -print); do
		sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
		sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
	done

	if [ "$use_gcc" = true ]; then
		python2 setup.py config_fc --fcompiler=gnu95 build
	fi

	if [ "$use_intel_cc" = true ]; then
		export __INTEL_PRE_CFLAGS=" -D_Float128=__float128"
		python2 setup.py config --compiler=intelem --fcompiler=intelem build_clib --compiler=intelem --fcompiler=intelem build_ext --compiler=intelem --fcompiler=intelem
	fi

}

check() {
	# we need to do a temp install so we can import scipy
	# also, the tests must not be run from the scipy source directory
	export LDFLAGS="-Wall -shared"

	#   cd ${srcdir}/scipy-${pkgver}
	#   python3 setup.py config_fc --fcompiler=gnu95 install \
	#     --prefix=/usr --root=${srcdir}/test --optimize=1
	#   export PYTHONPATH=${srcdir}/test/usr/lib/python3.6/site-packages
	#   cd ${srcdir}
	#   python -c "from scipy import test; test('full')"
	#
	#   cd ${srcdir}/scipy-${pkgver}-py2
	#   python2 setup.py config_fc --fcompiler=gnu95 install \
	#     --prefix=/usr --root=${srcdir}/test --optimize=1
	#   export PYTHONPATH=${srcdir}/test/usr/lib/python2.7/site-packages
	#   cd ${srcdir}
	#   python2 -c "from scipy import test; test('full')"
}

package_python-scipy-mkl() {

	depends=('python-numpy-mkl' 'qhull' 'python-nose')
	provides=('python3-scipy=${pkgver}' 'python-scipy=${pkgver}' 'scipy=${pkgver}')
	replaces=('python-scipy')
	conflicts=('python-scipy')
	optdepends=('python-pillow: for image saving module')

	cd scipy-${pkgver}
	export LDFLAGS="-Wall -shared"

	if [ "$use_gcc" = true ]; then
		python3 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root=${pkgdir} --optimize=1
	fi

	if [ "$use_intel_cc" = true ]; then
		export __INTEL_PRE_CFLAGS=" -D_Float128=__float128"
		python3 setup.py config_fc --fcompiler=intel install --prefix=/usr --root=${pkgdir} --optimize=1
	fi

	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}

package_python2-scipy-mkl() {

	depends=('python2-numpy-mkl' 'qhull' 'python2-nose')
	provides=('python2-scipy=${pkgver}' 'python2-scipy=${pkgver}' 'scipy=${pkgver}')
	replaces=('python2-scipy')
	conflicts=('python2-scipy')
	optdepends=('python2-pillow: for image saving module')

	cd scipy-${pkgver}-py2
	export LDFLAGS="-Wall -shared"

	if [ "$use_gcc" = true ]; then
		python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root=${pkgdir} --optimize=1
	fi

	if [ "$use_intel_cc" = true ]; then
		export __INTEL_PRE_CFLAGS=" -D_Float128=__float128"
		python2 setup.py config_fc --fcompiler=intel install --prefix=/usr --root=${pkgdir} --optimize=1
	fi

	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/python2-scipy/LICENSE"
}

# vim:set ts=2 sw=2 et:
