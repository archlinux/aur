# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-py-slvs-git
pkgver=r20.c94979b
pkgrel=1
pkgdesc="Python binding of SOLVESPACE geometry constraint solver"
arch=('x86_64')
url="https://github.com/realthunder/slvs_py"
license=('GPL3')
groups=()
depends=("python")
makedepends=("python-setuptools" "python-scikit-build" "cmake" "git")
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git" "git+https://github.com/realthunder/solvespace.git")
noextract=()
sha256sums=("SKIP" "SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/^v-\?//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.mysubmodule.url "$srcdir/solvespace"
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
