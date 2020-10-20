# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=nmigen
pkgname="python-$_pkgname-git"
pkgver=0.2.r191.g2c505de
pkgrel=1
pkgdesc="A refreshed Python toolbox for building complex digital hardware"
arch=(any)
url="https://github.com/nmigen/nmigen"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-pytest')
optdepends=('python-pyvcd: for nmigen.pysim'
            'python-jinja: for nmigen.build'
            'paramiko: for remote builds')
# FIXME: yosys>=0.9+3468, symbiyosys
checkdepends=('python-pytest' 'python-pyvcd' 'python-jinja' 'yosys-git' 'symbiyosys-git' 'yices')
provides=("python-nmigen=$pkgver")
conflicts=('python-nmigen')
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

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
