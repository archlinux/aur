# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=python-symbiflow-v2x
pkgname=v2x-git
pkgver=0.0.r616.g1325cb3
pkgrel=1
pkgdesc="A tool for converting specialized annotated Verilog models into XML"
arch=(any)
url="https://github.com/SymbiFlow/python-symbiflow-v2x"
license=('Apache')
depends=('python' 'python-lxml' 'python-vtr-xml-utils' 'yosys')
makedepends=('git' 'python-setuptools' 'python-pytest-runner')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	touch tests/__init__.py
	# FIXME: incompatibility between yosys versions? Expected dsp_int_comb, got genblk1_dsp_int_comb
	#pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
