# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=blacktex-git
pkgver=0.5.2.r2.gb37ba68
pkgrel=1
pkgdesc="A LaTex code prettifier and formatter"
arch=('any')
url="https://github.com/nschloe/blacktex"
license=('GPL3')
depends=('python>=3.6')
optdepends=('python-importlib-metadata: required for python<3.8')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-randomly')
provides=('blacktex')
conflicts=('blacktex')
source=("$pkgname::git+$url?signed"
        'setup.py')
sha256sums=('SKIP'
            '843ac26c38a41abae578250bc0f9419194b320a0f67327d941037a4268f6cfe7')
validpgpkeys=(
	'B0212779B9AE294D1EF7E676914F833437204C75' ## Niko Scholmer
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cp setup.py "$pkgname"
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python setup.py pytest
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
