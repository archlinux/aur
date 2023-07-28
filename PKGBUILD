# Maintainer: nomisge <nomisge @ live . de>

_name=pytest-archon
pkgname=python-${_name}
pkgver=0.0.5
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
	'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04d45dc1d27c149da206f5957e0dac6b9e01c426334bcc28dcd50c944bf157a4')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
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
#	rm -R "${pkgdir}/${site_packages}"/{tests,build}
}
