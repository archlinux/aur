# Maintainer: nomisge <nomisge @ live . de>

_name=pytest-archon
pkgname=python-${_name}
pkgver=0.0.7
pkgrel=1
pkgdesc="A little tool that helps you structure (large) Python projects"
arch=('any')
url="https://github.com/jwbargsten/${_name}"
license=('Apache')
depends=(
	'python-pytest'
)
makedepends=(
	'python-setuptools'
	'python-setuptools-scm'
	'python-build'
	'python-installer'
	'python-wheel'
)
checkdepends=(
	'python-pytest>=7.2'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc8ad638ad5d616b0cbe5a1d1c4dced638375f9645c00e8fc8b8df43612514d5')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python -m build --wheel --no-isolation
}
	
check() {
	cd "${srcdir}/${_name}-${pkgver}"
	#Not working at the moment, thus commented out
	# ModuleNotFoundError: No module named 'jaraco.versioning'
#	PYTHONPATH="$PWD/dist/pytest_archon-$pkgver-py3-non-any.whl" \
#		pytest -vv -p no:ruff -p no:mypy
}

package() {
	cd "${_name}-${pkgver}"
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	python -m installer --destdir="$pkgdir" dist/*.whl
#	rm -R "${pkgdir}/${site_packages}"/{tests,build}
}
