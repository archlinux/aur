# Maintainer: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>
# Contributor: Adam Rutkowski <hq@mtod.org>
# Contributor: FabioLolix <fabio.lolix@gmail.com>

pkgname=liquidctl
pkgver=1.4.0
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
url="https://github.com/jonasmalacofilho/liquidctl"
depends=('python' 'python-setuptools' 'python-pyusb' 'python-hidapi' 'python-docopt')
makedepends=('python-pytest')
license=('GPL3')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b35e6f297e67f9e145794bb57b88c626ef2bfd97e7fbb5b098f3dbf9ae11213e')

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
	pytest -k "not test_backwards_compatibility_11"
	python -m liquidctl.cli list --verbose
}
