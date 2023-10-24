# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=mtkclient
pkgver=1.63
pkgrel=2
pkgdesc="Unofficial MTK reverse engineering and flash tool"
arch=('any')
url="https://github.com/bkerler/mtkclient"
license=('GPL3')
depends=('libusb' 'python' 'python-pyusb' 'python-pyserial' 'python-pycryptodome' 'python-pycryptodomex' 'python-colorama' 'python-mock' 'shiboken6' 'pyside6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/bkerler/mtkclient/archive/refs/tags/$pkgver.tar.gz"
        "scripts-and-data-files.patch"
        "udev.patch"
        "usb.patch")
sha256sums=('ae9332e69ffee4331f11bc8a99f0f8d14073be6fbfad13b38f89fc71c0bae1ee'
            '923c6c8173ab26b77e4fe25ec8128ffbe68d50451873d86e6b7c66bcb8d8513f'
            'd4b6d7967324e585f69c51257e4293f390291a9534e697eefc94568d169220bc'
            '953b4111910056208b032573b0c34d886490efda06ada46f9718a70d15f891d2')

prepare() {
	cd mtkclient-$pkgver

	# Remove problematic "usb" dependency (package already depends on pyusb)
	cat ../usb.patch | patch -p1

	# Prevent LICENSE and README.md from being installed directly into /usr.
	# Also add mtk_gui to list of scripts to be insalled into /usr/bin.
	cat ../scripts-and-data-files.patch | patch -p1

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
	install -Dm644 Setup/Linux/51-edl.rules "$pkgdir/usr/lib/udev/rules.d/52-mtk-edl.rules"
}
