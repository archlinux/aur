# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Michael Riegert <michael at eowyn net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-pychromecast-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=13.0.4.r1.g83659c6
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url="https://github.com/home-assistant-libs/pychromecast"
license=('MIT')
depends=('python-protobuf' 'python-zeroconf' 'python-casttube')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/PyChromecast-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
