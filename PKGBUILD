# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=fasm
pkgname="python-$_pkgname-git"
pkgver=0.0.r86.gbae2e6d
pkgrel=1
pkgdesc="FPGA Assembly (FASM) Parser and Generation library"
arch=(x86_64)
url="https://github.com/SymbiFlow/fasm"
license=('ISC')
depends=('python' 'python-textx' 'antlr4-runtime')
makedepends=('git' 'python-setuptools' 'cython' 'cmake' 'antlr4')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}=$pkgver")
conflicts=(fasm "${pkgname%%-git}")
source=("git+$url.git"
        "git+https://github.com/antlr/antlr4"
        "git+https://github.com/google/googletest")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	git submodule init
	git config submodule.third_party/antlr4.url "$srcdir/antlr4"
	git config submodule.third_party/googletest.url "$srcdir/googletest"
	git submodule update
}

build() {
	cd "$_pkgname"

	python setup.py build --antlr-runtime=shared
}

check() {
	: broken
	#local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	#PYTHONPATH="$srcdir/$_pkgname/build/lib.linux-$CARCH-$python_version" pytest "$_pkgname/tests"
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
