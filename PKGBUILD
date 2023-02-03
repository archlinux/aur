# Maintainer: nomisge <nomisge @ live . de>

_name=pytest-archon
pkgname=python-${_name}
pkgver=0.0.3
pkgrel=0
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
)
checkdepends=(
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93ef6cf4248dca31b2ef9ea4b46ddf81f9f2eebbdd19cc283629a8462e911263')

build() {
	cd "${_name}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python -m build --wheel --no-isolation
}
	
check() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m pytest
}

package() {
	cd "${_name}-${pkgver}"
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm -R "${pkgdir}${site_packages}"/{tests,build}
}
