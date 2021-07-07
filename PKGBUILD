# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo2ft-git
pkgver=2.22.0.r0.g86c3357
pkgrel=1
pkgdesc='A bridge from UFOs to FontTools objects'
url="https://github.com/googlefonts/ufo2ft"
license=(MIT)
arch=(x86_64)
_py_deps=(booleanoperations
          cffsubr
          compreffor
          cu2qu
          defcon
          'fonttools>=4.24.4')
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(git
             python-setuptools-scm)
checkdepends=(python-pytest
              python-pytest-runner
              python-skia-pathops)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
		python setup.py test
}

package() {
	cd "$pkgname"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -D -m755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

