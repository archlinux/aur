# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-scrython-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=1.11.1.r1.gef858db
pkgrel=1
pkgdesc='Python wrapper for the Scryfall API'
url='https://github.com/NandaScott/Scrython'
arch=('any')
license=('MIT')
depends=('python-aiohttp')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	local pkgver=1.11.0
	ln -sv "$_site/$_pkg-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
