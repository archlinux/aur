# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient
pkgver=2.0.1.freeze
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL3')
depends=('libusb' 'fuse2' 'python' 'python-pyusb' 'python-pyserial' 'python-fusepy' 'python-pycryptodome' 'python-pycryptodomex' 'python-colorama' 'python-mock' 'shiboken6' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/bkerler/mtkclient/archive/refs/tags/$pkgver.tar.gz"
        "udev.patch")
sha256sums=('1c8f1670ff269588f1e96e1039b7c8791260209de9ff2c758db2fdd007a317be'
            '8776be623566f03707ae907123f9026485a05314720654b7fed0799cce37d6bb')

prepare() {
	cd mtkclient-$pkgver

	# Replace plugdev with uaccess and adbusers like upstream android-udev
	cat ../udev.patch | patch -p1
}

build() {
	cd mtkclient-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd mtkclient-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 mtkclient/Setup/Linux/51-edl.rules "$pkgdir/usr/lib/udev/rules.d/52-mtk-edl.rules"
}
