# Maintainer: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>
# Contributor: Adam Rutkowski <hq@mtod.org>
# Contributor: FabioLolix <fabio.lolix@gmail.com>

pkgname=liquidctl
pkgver=1.4.1
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
url="https://github.com/jonasmalacofilho/liquidctl"
depends=('python' 'python-setuptools' 'python-pyusb' 'python-hidapi' 'python-docopt')
makedepends=('python-pytest')
license=('GPL3')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('59a3bc65b3f3e71a5714224401fe6e95dfdee591a1d6f4392bc4e6d6ad72ff8d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export DIST_NAME="Arch User Repository"
	export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 liquidctl.8 "${pkgdir}/usr/share/man/man8/liquidctl.8"
    	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl" docs/*.md
	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl/linux" docs/linux/*.md
	install -Dm644 extra/linux/71-liquidctl.rules "$pkgdir/usr/lib/udev/rules.d/71-liquidctl.rules"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	pytest
	python -m liquidctl.cli list --verbose
}
