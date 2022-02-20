# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex-git
pkgver=0.6.0.r0.g9df9691
pkgrel=1
pkgdesc="LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python-pylatexenc')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('git' 'python-flit-core' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-randomly')
provides=('blacktex')
conflicts=('blacktex')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'B0212779B9AE294D1EF7E676914F833437204C75' ## Niko Scholmer
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH=./src pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
