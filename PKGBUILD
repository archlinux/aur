# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-crc32c
pkgver=1.3.0
pkgrel=4
pkgdesc="Wraps Google's crc32c library into a Python wrapper"
arch=('x86_64')
url="https://github.com/googleapis/python-crc32c"
license=('APACHE')
depends=('python-setuptools' 'google-crc32c')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('573d5f16a2c8e7cb8eab5e962f2aca6dd4a684178f9803e1c5ca2914bf023afa')

prepare() {
	## remove lib64 from runpath
	cd "python-crc32c-$pkgver"
	sed -i '74,75d' setup.py
}

build() {
	cd "python-crc32c-$pkgver"
	CRC32C_INSTALL_PREFIX=/usr python -m build --wheel --no-isolation
}

check() {
	cd "python-crc32c-$pkgver"
	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" pytest -x tests
}

package() {
	cd "python-crc32c-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
