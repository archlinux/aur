# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient-git
pkgver=1.63.r38.gb63c933
pkgrel=1
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL3')
depends=('libusb' 'python' 'python-pyusb' 'python-pyserial' 'python-pycryptodome' 'python-pycryptodomex' 'python-colorama' 'python-mock' 'shiboken6' 'pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mtkclient')
provides=('mtkclient')
source=("git+https://github.com/bkerler/mtkclient.git"
        "scripts-and-data-files.patch"
        "udev.patch")
sha256sums=('SKIP'
            'd156e692d36fb48f9d385598a2b888ddf3bf0fea182cf9757a71c971c144f710'
            'd4b6d7967324e585f69c51257e4293f390291a9534e697eefc94568d169220bc')

pkgver() {
	cd mtkclient
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd mtkclient

	# Prevent LICENSE and README.md from being installed directly into /usr.
	# Also add mtk_gui to list of scripts to be insalled into /usr/bin.
	cat ../scripts-and-data-files.patch | patch -p1

	# Replace plugdev with uaccess and adbusers like upstream android-udev
	cat ../udev.patch | patch -p1
}

build() {
	cd mtkclient
	python -m build --wheel --no-isolation
}

package() {
	cd mtkclient
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 Setup/Linux/51-edl.rules "$pkgdir/usr/lib/udev/rules.d/52-mtk-edl.rules"
}
