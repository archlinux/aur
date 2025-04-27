# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=python-py-slvs-git
pkgver=1.0.6.r31.ab95814
pkgrel=1
pkgdesc="Python binding of SOLVESPACE geometry constraint solver"
arch=('x86_64')
url="https://github.com/realthunder/slvs_py"
license=('GPL3')
groups=()
depends=("python" "swig")
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
	printf "%s.r%s.%s" "$(git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.mysubmodule.url "$srcdir/solvespace"
	git submodule update

	sed -i "s|'-DENABLE_GUI:BOOL=OFF','-DBUILD_PYTHON:BOOL=ON'|&,'-DCMAKE_POLICY_VERSION_MINIMUM=3.5'|g" "$srcdir/$pkgname/setup.py"
}

build() {
	cd "$srcdir/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
