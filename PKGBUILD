# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-ufo2ft-git
pkgver=3.4.2.r0.g16ed156
pkgrel=1
pkgdesc='A bridge from UFOs to FontTools objects'
arch=(any)
url="https://github.com/googlefonts/ufo2ft"
license=(MIT)
_pydeps=(booleanoperations
          cffsubr
          cu2qu
          lxml # for fonttools[lxml]
          defcon
          fonttools
          fs) # for fonttools[ufo]
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-compreffor
              python-fontmath
              python-pytest
              python-skia-pathops
              python-syrupy
              python-ufolib2)
optdepends=(python-compreffor
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
	python -m build -wn
}

check() {
	cd "$pkgname"
	export PYTHONPATH="$PWD/build/lib"
        pytest tests
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
