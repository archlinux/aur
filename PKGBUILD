# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-pynng
pkgver=0.7.1
pkgrel=1
pkgdesc='Python bindings for Nanomsg Next Generation'
arch=('x86_64')
url='https://github.com/codypiersall/pynng'
license=('MIT')
depends=('python-sniffio' 'python-cffi')
makedepends=(
	'cmake'
	'git'
	'python-setuptools'
	'python-pytest-runner')
checkdepends=(
	'python-pytest-asyncio'
	'python-pytest-curio'
	'python-pytest-trio'
	'python-curio'
	'python-trio'
	'python-mbed-host-tests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('752bb38a0d00d9dc52f361479c44018d2ed508dd9841a595314a45d660b95570')

build() {
	cd "pynng-$pkgver"
	python setup.py build
}

check() {
	cd "pynng-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python setup.py pytest
}

package() {
	cd "pynng-$pkgver"
	PYTHONHASHSEED=0 python setup.py install -O1 --root="$pkgdir" --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
