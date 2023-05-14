# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=rapidyaml
pkgbase=$_pkgname-git
pkgname=($pkgbase python-$pkgbase)
pkgver=0.5.0.r14.g6a5a07f
pkgrel=1
pkgdesc="A library to parse and emit YAML, and do it fast."
url="https://github.com/biojppm/rapidyaml"
arch=(x86_64)
license=('MIT')
makedepends=('git' 'cmake' 'ninja' 'swig' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools-git' 'python-setuptools-scm'
             # note: contains additional patches for broken upstream not present in community package
             'python-cmake-build-extension-git')
checkdepends=('python-pytest')
source=(
	"git+https://github.com/biojppm/rapidyaml.git"
	"git+https://github.com/biojppm/c4core.git"
	"git+https://github.com/biojppm/cmake.git"
	"git+https://github.com/biojppm/debugbreak"
	"git+https://github.com/fastfloat/fast_float"
	"0001-Remove-bogus-ninja-wheel-dependency.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c12e283c0c0e970f7150068cf44f5106b4459f745f0b57513acd7bbfcbec897f')

pkgver() {
	cd "$_pkgname"

	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-Remove-bogus-ninja-wheel-dependency.patch"

	sed -i -e 's/-git//' setup.py

	git submodule init
	git config submodule.extern/c4core.url "$srcdir/c4core"
	git -c protocol.allow=never -c protocol.file.allow=always submodule update

	cd ext/c4core

	git submodule init
	git config submodule.cmake.url "$srcdir/cmake"
	git config submodule.extern/debugbreak.url "$srcdir/debugbreak"
	git config submodule.src/c4/ext/fast_float.url "$srcdir/fast_float"
	git -c protocol.allow=never -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DRYML_BUILD_API=ON

	make -C build

	cd "$_pkgname"

	python -m build --wheel --no-isolation
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
	depends=('python' 'python-deprecation')
	provides=("${pkgname%%-git}=$pkgver")
	conflicts=("${pkgname%%-git}")

	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
