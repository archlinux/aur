# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Georg Pichler <georg.pichler@gmail.com>

pkgname=python-statsd-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=4.0.1.r12.g3fa4353
pkgrel=1
pkgdesc="Python client for statsd"
arch=('any')
url='https://github.com/jsocol/pystatsd'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose2')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('pystatsd-git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	nose2
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
