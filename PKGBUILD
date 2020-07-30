# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Fabio Loli
# Contributor: Adam Rutkowski
pkgname=liquidctl-git
pkgver=1.3.3.r351.4993cd5
pkgrel=1
pkgdesc='Cross-platform tool and drivers for liquid coolers and other devices'
arch=('any')
url='https://github.com/jonasmalacofilho/liquidctl'
license=('GPL3')
depends=('python' 'python-setuptools' 'python-docopt' 'python-pyusb' 'python-hidapi')
makedepends=('git' 'python-pytest')
provides=("${pkgname%-git}" "python-${pkgname%-git}")
conflicts=("${pkgname%-git}" "python-${pkgname%-git}")
source=("$pkgname::git+https://github.com/jonasmalacofilho/liquidctl.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	# customize the output of liquidctl --version
	export DIST_NAME="$(source /etc/os-release && echo $PRETTY_NAME)"
	export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"

	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 liquidctl.8 "$pkgdir/usr/share/man/man8/liquidctl.8"
	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl" docs/*-guide.md
	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl/linux" docs/linux/*.md
	install -Dm644 extra/linux/71-liquidctl.rules "$pkgdir/usr/lib/udev/rules.d/71-liquidctl.rules"

	# optional (mostly example scripts, but may be useful in some cases):
	# install -D extra/yoda "$pkgdir/usr/bin/liquidctl-yoda"
	# install -D extra/liquiddump "$pkgdir/usr/bin/liquidctl-dump"
}

check() {
	cd "$srcdir/$pkgname"
	pytest
	python -m liquidctl.cli list --verbose
}
