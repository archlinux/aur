# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name=spicelib
pkgname="python-${_name}-git"
pkgver=1.4.0.r8.g4015a4a
pkgrel=1
pkgdesc="A toolchain of Python utilities designed to interact with Spice simulators"
arch=("any")
url="https://github.com/nunobrum/spicelib"
license=('GPL-3.0-or-later')
depends=(
	'python'
	'python-numpy'
	'python-scipy'
	'python-psutil'
	'python-matplotlib'
	# AUR
	'python-keyboard'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-poetry-core'
)
optdepends=(
	"ngspice: Next generation Spice-like analog simulator"
	"xyce: Analog Spice-like simulator"
	"python-clipboard: For clipboard support in 'histogram' and 'raw_convert'"
	"python-pandas: Used for exporting raw to other formats"
)
source=(
	${pkgname}::git+${url}#branch=main
)
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
	cd "${pkgname}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}"

	python -m unittest discover -vs unittests/
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	# Remove 'readme_update'
	rm "${pkgdir}/usr/bin/readme_update"
	# TODO: Prefix the binaries with 'spicelib'?
}
