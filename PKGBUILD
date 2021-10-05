# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-crc32c
_name="${pkgname/-google/}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Wraps Google's crc32c library into a Python wrapper"
arch=('x86_64')
url="https://github.com/googleapis/python-crc32c"
license=('APACHE')
depends=('python>=3.6' 'google-crc32c')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('573d5f16a2c8e7cb8eab5e962f2aca6dd4a684178f9803e1c5ca2914bf023afa')

build() {
	export CRC32C_INSTALL_PREFIX=/usr
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" pytest tests
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
