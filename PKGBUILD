# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## GPG keys: gpg --keyserver keyserver.ubuntu.com --recv-keys ${GPG_KEY_HERE}

pkgname=('libvhdi' 'python-pyvhdi')
pkgver=20221124
pkgrel=1
pkgdesc='Library and tools for the Virtual Hard Disk (VHD) image format'
url='https://github.com/libyal/libvhdi'
arch=('x86_64')
license=('LGPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-alpha-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgname-alpha-$pkgver.tar.gz.asc")
sha256sums=('0d46cc2fa4f9385e58f891fc5a1c3eec92f69e30a5c5a550a3f560693ed34295'
            'SKIP')
validpgpkeys=('0ED9020DA90D3F6E70BD3945D9625E5D7AD0177E') ## Joachim Metz

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-python3
	make
	python -m build --wheel --no-isolation
}

package_libvhdi() {
	depends=('glibc')
	provides=("$pkgname.so")
	cd "$pkgname-$pkgver"
	## Calling the setup.py for any reason resets out config script
	./configure --prefix=/usr
	DESTDIR="$pkgdir" make install
}

package_python-pyvhdi() {
	pkgdesc='Python module for libvhdi'
	depends=('python')
	cd "$pkgbase-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
