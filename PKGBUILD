# Maintainer: a821
# Contributor Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-crc32c
pkgver=1.6.0
pkgrel=1
pkgdesc="Wraps Google's crc32c library into a Python wrapper"
arch=('x86_64')
url="https://github.com/googleapis/python-crc32c"
license=('Apache-2.0')
depends=('python-setuptools' 'google-crc32c')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('487897d69003543acc7771c73586a2868e8fb1e3dae87d38396d087cf62aa1ac')

prepare() {
	## remove lib64 from runpath
	cd "python-crc32c-$pkgver"
	sed -i '73,74d' setup.py
}

build() {
	cd "python-crc32c-$pkgver"
	CRC32C_INSTALL_PREFIX=/usr python -m build --wheel --no-isolation
}

check() {
	cd "python-crc32c-$pkgver"
	local _ver="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_ver" pytest -x tests
}

package() {
	cd "python-crc32c-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
