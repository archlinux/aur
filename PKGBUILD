# Maintainer: nomisge <nomisge @ live . de>

_name=pytest-archon
pkgname=python-${_name}
pkgver=0.0.4
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
)
checkdepends=(
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-$pkgver.patch")
sha256sums=('c809faa1695a708d4dc5faad0811d7b28e2fd9f668d93bdbe9f3eb0e13698a7d'
            '7296e5208ce64fa6d2b71e6f38de94336e9f426d401797cb6029c241fc49008a')

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
	patch --strip=1 --input="${srcdir}/${pkgname}-${pkgver}.patch"
}

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
	rm -R "${pkgdir}/${site_packages}"/{tests,build}
}
