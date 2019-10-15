# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=python-liquidctl-git
pkgver=1.2.0.r39.0207b13
pkgrel=1
pkgdesc="Cross-platform CLI and Python drivers for AIO liquid coolers and other devices"
arch=('any')
url="https://github.com/jonasmalacofilho/liquidctl"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-docopt' 'python-pyusb' 'python-hidapi' 'python-appdirs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
}
