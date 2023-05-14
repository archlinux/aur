# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=cmake-build-extension
pkgname="python-$_pkgname-git"
pkgver=0.5.1.r3.gfea4503
pkgrel=5
pkgdesc="Setuptools extension to build and package CMake projects"
arch=(any)
url="https://github.com/diegoferigo/cmake-build-extension"
license=('MIT')
depends=('python' 'python-gitpython' 'python-setuptools-scm' 'ninja' 'cmake')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
provides=("python-$_pkgname=$pkgver")
conflicts=("python-$_pkgname")
source=("git+$url.git"
        "0001-setup.cfg-remove-bogus-wheel-dependencies.patch"
        "0002-Fix-generated-cmake-command-line-argument-for-genera.patch")
sha256sums=('SKIP'
            '906689aacab006680d3046e290b32bfdaca687de66b9524bb44af4733728613e'
            '4078ac0c70420880b4f2072ec7b5dd500915df6b3a8e68f6523f5fc16f0e1df5')

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-setup.cfg-remove-bogus-wheel-dependencies.patch"
	patch -p1 < "$srcdir/0002-Fix-generated-cmake-command-line-argument-for-genera.patch"
}

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	#pytest --ignore examples
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
