# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient-git
pkgver=1.63.r6.g054dafa
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
            '953b4111910056208b032573b0c34d886490efda06ada46f9718a70d15f891d2')

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
