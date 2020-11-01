# Maintainer: Sergey Kasmy <SleeplessSloth79 [at] gmail [dot] com>
# Contributor: Adam Rutkowski <hq@mtod.org>
# Contributor: FabioLolix <fabio.lolix@gmail.com>

pkgname=liquidctl
pkgver=1.4.2
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
url="https://github.com/jonasmalacofilho/liquidctl"
depends=('python' 'python-setuptools' 'python-pyusb' 'python-hidapi' 'python-docopt')
makedepends=('python-pytest')
license=('GPL3')
arch=('any')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('39da5f5bcae1cbd91e42e78fdb19f4f03b6c1a585addc0b268e0c468e76f1a3c')

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
