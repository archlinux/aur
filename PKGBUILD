# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=liquidctl-git
pkgver=1.3.3.r68.89b9f00
pkgrel=1
pkgdesc="Cross-platform tool and drivers for liquid coolers and other devices"
arch=('any')
url="https://github.com/jonasmalacofilho/liquidctl"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-docopt' 'python-pyusb' 'python-hidapi')
makedepends=('git')
provides=("${pkgname%-git}" "python-${pkgname%-git}")
conflicts=("${pkgname%-git}" "python-${pkgname%-git}")
source=("$pkgname::git+https://github.com/jonasmalacofilho/liquidctl.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	cd "$srcdir/$pkgname"
	export DIST_NAME="$(source /etc/os-release && echo $PRETTY_NAME)"
	export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 liquidctl.8 "$pkgdir/usr/share/man/man8/liquidctl.8"
	install -Dm644 extra/71-liquidctl.rules "$pkgdir/usr/lib/udev/rules.d/71-liquidctl.rules"
}
