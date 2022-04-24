# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
pkgname="python-$_pkgname-git"
pkgver=0.3.r19.g8b85afa
pkgrel=1
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen)"
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD')
depends=('python')
makedepends=('git' 'python-wheel' 'python-setuptools' 'python-setuptools-scm' 'python-pytest')
optdepends=('python-pyvcd: for amaranth.pysim'
            'python-jinja: for amaranth.build'
            'python-paramiko: for remote builds')
# FIXME: symbiyosys
checkdepends=('python-pytest' 'python-pyvcd' 'python-jinja' 'yosys>0.16' 'symbiyosys-git' 'yices')
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=('python-nmigen' "python-$_pkgname")
replaces=('python-nmigen-git')
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
