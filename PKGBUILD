# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: Adam Rutkowski
# Contributor: Fabio Loli
# Contributor: Sergey Kasmy
pkgname=liquidctl-git
pkgver=1.6.0.r26.8f3e779
pkgrel=1
pkgdesc='Cross-platform tool and drivers for liquid coolers and other devices'
arch=('any')
url='https://github.com/liquidctl/liquidctl'
license=('GPL3')
depends=(
	'python' 'python-docopt' 'python-colorlog' 'python-hidapi'
	'python-pyusb' 'i2c-tools'
)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"$pkgname::git+https://github.com/liquidctl/liquidctl.git#branch=main"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
	export DIST_NAME="Arch User Repository"
	export DIST_PACKAGE="$pkgname $pkgver-$pkgrel"

	cd "$srcdir/$pkgname"
	python setup.py build
}

check() {
	cd "$srcdir/$pkgname"

	mkdir -p runtime
	XDG_RUNTIME_DIR=runtime python -m pytest

	python -m liquidctl.cli list --verbose
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	
	# documentation
	install -Dm644 -t "$pkgdir"/usr/share/man/man8 liquidctl.8
	install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
	cp -r -a --no-preserve=ownership docs/* "$pkgdir"/usr/share/doc/$pkgname

	# device access
	install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d/ extra/linux/71-liquidctl.rules

	# completions
	install -Dm644 extra/completions/liquidctl.bash "$pkgdir"/usr/share/bash-completion/completions/liquidctl

	# optional scripts, originally intended as examples, but that may be
	# useful in some scenarios (note: versioned separately from liquidctl):
	# install -D extra/yoda "$pkgdir"/usr/bin/liquidctl-yoda
	# install -D extra/liquiddump "$pkgdir"/usr/bin/liquidctl-dump
	# install -D extra/prometheus-liquidctl-exporter "$pkgdir"/usr/bin/prometheus-liquidctl-exporter
}
