# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Adam Rutkowski
# Contributor: Fabio Loli
# Contributor: Sergey Kasmy
pkgname=liquidctl-git
pkgver=1.4.2.r67.43f3249
pkgrel=1
pkgdesc='Cross-platform tool and drivers for liquid coolers and other devices'
arch=('any')
url='https://github.com/jonasmalacofilho/liquidctl'
license=('GPL3')
depends=('python' 'python-setuptools' 'python-docopt' 'python-pyusb' 'python-hidapi')
optdepends=('i2c-tools: SMBus/I2C devices support')
makedepends=('git' 'python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/jonasmalacofilho/liquidctl.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	# customize the output of liquidctl --version; official distribution
	# packages should generally set DIST_NAME to os-release PRETTY_NAME)
	export DIST_NAME="Arch User Repository"
	export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"

	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	
	# documentation
	install -Dm644 -t "$pkgdir/usr/share/man/man8" liquidctl.8
	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl" docs/*.md
	install -Dm644 -t "$pkgdir/usr/share/doc/liquidctl/linux" docs/linux/*.md

	# device access
	install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" extra/linux/71-liquidctl.rules
	install -Dm644 extra/linux/modules-load.conf "$pkgdir/usr/lib/modules-load.d/liquidctl.conf"

	# completions
	install -Dm644 extra/completions/liquidctl.bash "$pkgdir/usr/share/bash-completion/completions/liquidctl"

	# optional scripts, originally intended as examples, but that may be
	# useful in some scenarios (note: versioned separately from liquidctl):
	# install -D extra/yoda "$pkgdir/usr/bin/liquidctl-yoda"
	# install -D extra/liquiddump "$pkgdir/usr/bin/liquidctl-dump"
}

check() {
	cd "$srcdir/$pkgname"
	pytest
	python -m liquidctl.cli list --verbose
}
