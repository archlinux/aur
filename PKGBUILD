# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Parker Reed <parker.l.reed@gmail.com>

pkgname=sc-controller-git
pkgver=1.0.0.r3.25c8209d
pkgrel=1
pkgdesc='User-mode driver, mapper and GTK3 based GUI for Steam Controller, DS4 and similar controllers'
arch=('x86_64' 'aarch64')
url='https://github.com/C0rn3j/sc-controller'
license=('GPL-2.0-only')
depends=(
	'gtk4'
	'gtk4-layer-shell'
	'python-cairo'
	'python-evdev'
	'python-gobject'
	'python-ioctl-opt'
	'python-libusb1'
	'python-pylibacl'
	'python-setuptools'
	'python-vdf'
	'xorg-xinput'
)
optdepends=(
	'python-hidraw-pure: Use system library instead of vendored one'
)
makedepends=(
	'git'
	'python-poetry'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'scc')
source=('sc-controller'::'git+https://github.com/C0rn3j/sc-controller.git')
sha256sums=('SKIP')

# This ends up not matching the verison as intended by https://github.com/C0rn3j/sc-controller/pull/30
# so About mismatches pkgver, but it's good enough
pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//')"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
