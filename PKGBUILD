# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=cmake-build-extension
pkgname="python-$_pkgname-git"
pkgver=0.5.1.r13.g856f0e0
pkgrel=1
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
        "0001-setup.cfg-remove-bogus-wheel-dependencies.patch")
sha256sums=('SKIP'
            '906689aacab006680d3046e290b32bfdaca687de66b9524bb44af4733728613e')

prepare() {
	cd "$_pkgname"

	patch -p1 < "$srcdir/0001-setup.cfg-remove-bogus-wheel-dependencies.patch"
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
