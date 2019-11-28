# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Ben Greiner <code-arch@bnavigator.de>
_name=scikit-build
pkgname="python-${_name}"
pkgver=0.10.0
pkgrel=3
pkgdesc='Improved build system generator for CPython C, C++, Cython and Fortran extensions'
arch=('x86_64')
url='https://github.com/scikit-build/scikit-build'
license=('MIT')
depends=(
	'cmake'
	'python-distro'
	'python-packaging'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'cython'
	'flake8'
	'gcc-fortran'
	'git'
	'ninja'
	'python-path.py'
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-mock'
	'python-pytest-runner'
	'python-pytest-virtualenv'
	'python-requests'
	'python-six'
	'python-virtualenv'
)
source=("https://files.pythonhosted.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7342017cc82dd6178e3b19377389b8a8d1f8b429d9cdb315cfb1094e34a0f526')

prepare() {
	cd "$srcdir/${_name}-${pkgver}"

	# Compatibility with Python 3.8
	sed -i \
		-e 's,^import platform$,import distro\nimport platform,' \
		-e 's,platform\.linux_distribution()\[0\],distro.id(),' \
		skbuild/platform_specifics/linux.py
}

build() {
	cd "$srcdir/${_name}-${pkgver}"

	python setup.py build
}

check() {
	cd "$srcdir/$_name-$pkgver"

	pytest -k 'not (test_install_command or test_develop_command or test_test_command or test_hello_develop or test_setup_requires_keyword_include_cmake)'
}

package() {
	cd "$srcdir/$_name-$pkgver"

	python setup.py install --optimize=1 --root="$pkgdir"

	install -D -m644 \
		"${srcdir}/$_name-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

