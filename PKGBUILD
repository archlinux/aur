# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-crc32c
pkgver=1.5.0
pkgrel=1
pkgdesc="Wraps Google's crc32c library into a Python wrapper"
arch=('x86_64')
url="https://github.com/googleapis/python-crc32c"
license=('APACHE')
depends=('python-setuptools' 'google-crc32c')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('029111b916bf130d9bcb13ad81d592e66623713f7791dd6d2bf366afd15dacf6')

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
	local _ver="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_ver" pytest -x tests
}

package() {
	cd "python-crc32c-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
