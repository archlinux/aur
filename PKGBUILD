# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

pkgname=python-rapidfuzz-git
pkgver=0.9.2.r0.geae941a
pkgrel=1
pkgdesc="Rapid fuzzy string matching in Python using the Levenshtein Distance"

url="https://github.com/maxbachmann/rapidfuzz"
arch=("any")
license=("MIT")
provides=("python-rapidfuzz")

source=("$pkgname::git+https://github.com/maxbachmann/rapidfuzz"
	"$pkgname-cpp::git+https://github.com/maxbachmann/rapidfuzz-cpp"
)

depends=("python")
makedepends=("python-setuptools" "gcc" "python-pytest")

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule."src/rapidfuzz-cpp".url "$srcdir/"$pkgname-cpp
	git submodule update
}

check() {
	cd "$pkgname"
	env PYTHONPATH=$(sh -c "echo build/lib.linux*/") pytest
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/python-rapidfuzz/LICENSE
}


md5sums=("SKIP" "SKIP")

