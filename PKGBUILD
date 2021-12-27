# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=rapidyaml
pkgbase=$_pkgname-git
pkgname=($pkgbase python-$pkgbase)
pkgver=0.2.3.r21.gefc8b0e
pkgrel=1
pkgdesc="A library to parse and emit YAML, and do it fast."
url="https://github.com/biojppm/rapidyaml"
arch=(x86_64)
license=('MIT')
makedepends=('git' 'cmake' 'swig' 'python-setuptools' 'python-setuptools-scm' 'python-cmake-build-extension')
checkdepends=('python-pytest')
source=(
	"git+https://github.com/biojppm/rapidyaml.git"
	"git+https://github.com/biojppm/c4core.git"
	"git+https://github.com/biojppm/cmake.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	sed -i -e 's/-git//' setup.py

	git submodule init
	git config submodule.extern/c4core.url "$srcdir/c4core"
	git submodule update

	cd ext/c4core

	git submodule init
	git config submodule.cmake.url "$srcdir/cmake"
	git submodule update
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRYML_BUILD_API=ON

	make -C build

	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	#pytest
}

package_rapidyaml-git() {
	provides=("${pkgname%%-git}=$pkgver" 'c4core')
	conflicts=("${pkgname%%-git}" 'c4core')

	make -C build DESTDIR="$pkgdir" install

	rm "$pkgdir/usr/ryml.py" "$pkgdir/usr/_ryml.so"

	install -Dm 644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-rapidyaml-git() {
	depends=('python')
	provides=("${pkgname%%-git}=$pkgver")
	conflicts=("${pkgname%%-git}")

	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
