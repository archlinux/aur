# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient-git
pkgver=1.52.r201.ga92d6cd
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL')
depends=('libusb' 'python' 'python-pyusb' 'python-pyserial' 'python-pycryptodome' 'python-colorama' 'python-mock' 'shiboken6' 'pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mtkclient')
provides=('mtkclient')
install=mtkclient.install
source=("git+https://github.com/bkerler/mtkclient.git"
        "usb.patch")
sha256sums=('SKIP'
            '304b558e4d20e4a9b6df125b4eda55c010b1ec3be8dccc9de48c1aafeae60b52')

pkgver() {
	cd mtkclient
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd mtkclient
	# Remove problematic "usb" dependency (package already depends on pyusb)
	cat ../usb.patch | patch -p1
}

build() {
	cd mtkclient
	python -m build --wheel --no-isolation
}

package() {
	cd mtkclient
	python -m installer --destdir="$pkgdir" dist/*.whl
}
