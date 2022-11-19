# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=poetry-core
pkgname=python38-poetry-core
pkgver=1.3.2
pkgrel=1
pkgdesc="Poetry PEP 517 Build Backend & Core Utilities"
arch=('any')
url="https://github.com/python-poetry/${_pkgname}"
license=('MIT')
_deps=('jsonschema' 'lark-parser' 'packaging' 'tomlkit')
depends=("${_deps[@]/#/python-}")
makedepends=(python-{build,installer})
checkdepends=(git python38-pytest python38-pytest-mock python38-setuptools python38-virtualenv)
conflicts=('python38-poetry<1.1.0')
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('731c2e35874ee97f73ed42d8a332cd21cf2ab1f156db6a5adb00e6119bc51226')
b2sums=('43845f344f8b492aa5dae5608b8d67b41efab33c60999cc61d8476e08a9ec9870328174b371d0735624c5f11dd2ce15e19e2c984653c7349dd0c3a687dec0123')

build() {
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	# only works inside git repositories
	pytest \
		-k 'not test_default_with_excluded_data and not test_default_src_with_excluded_data'
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
