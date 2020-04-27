# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=cmake-language-server-git
pkgver=v0.1.1.r3.g40d9352
pkgrel=2
pkgdesc="Python based cmake language server"
arch=('any')
url="https://github.com/regen100/cmake-language-server"
license=('MIT')
groups=()
depends=("python-pygls" "python-pyparsing" "cmake")
makedepends=("python-setuptools" "python-poetry" "git")
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git} "cmake-format")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname"
	poetry build --format=sdist

	# Quick hack to use the tarball from poetry
	mkdir -p untar
	tar -xvf dist/*.tar.gz -C untar
	mv untar/* $pkgname

	cd $pkgname

	sed -i "s/from distutils.core import setup/from setuptools import setup/" setup.py
	sed -i "s/pygls>=0.8.1,<0.9.0/pygls>=0.8.1/" setup.py
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	cd "$srcdir/$pkgname/$pkgname"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname/$pkgname"

	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
