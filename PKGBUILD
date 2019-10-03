# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Ben Greiner <code-arch@bnavigator.de>
_name=scikit-build
pkgname=("python-${_name}" "python2-${_name}")
pkgver=0.10.0
pkgrel=2
pkgdesc='Improved build system generator for CPython C, C++, Cython and Fortran extensions'
arch=('any')
url='https://github.com/scikit-build/scikit-build'
license=('MIT')
depends=(
	'cmake'
	'python-packaging'           'python2-packaging'
	'python-setuptools>=28.0.0'  'python2-setuptools>=28.0.0'
	'python-wheel>=0.29.0'       'python2-wheel>=0.29.0'
)
checkdepends=(
	'cython2>=0.25.1'
	'cython>=0.25.1'
	'flake8>=3.0.4'
	'python-path.py>=11.5.0'          'python2-path.py>=11.5.0'
	'python-pytest-cov>=2.7.1'        'python2-pytest-cov>=2.7.1'
	'python-pytest-mock>=1.10.4'      'python2-pytest-mock>=1.10.4'
	'python-pytest-runner>=5.1'       'python2-pytest-runner>=5.1'
	'python-pytest-virtualenv>=1.2.5' 'python2-pytest-virtualenv>=1.2.5'
	'python-pytest>=4.5.0'            'python2-pytest>=4.5.0'
	'python-requests'                 'python2-requests'
	'python-six>=1.10.0'              'python2-six>=1.10.0'
	'python-virtualenv'               'python2-virtualenv'
	'python2-flake8>=3.0.4'
	'python2-pathlib2'
	'gcc-fortran'
	'git'
	'ninja'
)
source=("https://files.pythonhosted.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7342017cc82dd6178e3b19377389b8a8d1f8b429d9cdb315cfb1094e34a0f526')

prepare() {
	cp -a $_name-$pkgver{,-py2}
}

build() {
	cd "$srcdir/${_name}-${pkgver}"
	python setup.py build

	cd "$srcdir/${_name}-${pkgver}-py2"
	python2 setup.py build
}

check () {
	local _mark='not (test_install_command or test_develop_command or test_test_command or test_hello_develop)'

	cd "$srcdir/$_name-$pkgver"
	pytest -k "$_mark"

	cd "$srcdir/$_name-$pkgver-py2"
	pytest2 -k "$_mark"
}

package_python-scikit-build() {
	depends=('python-setuptools' 'python-wheel')
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
	# shellcheck disable=SC2128
	install -D -m644 "${srcdir}/$_name-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-scikit-build() {
	depends=('python2-setuptools' 'python2-wheel')
	cd "$srcdir/$_name-$pkgver-py2"
	python2 setup.py install --optimize=1 --root="$pkgdir"
	# shellcheck disable=SC2128
	install -D -m644 "${srcdir}/$_name-$pkgver-py2/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

