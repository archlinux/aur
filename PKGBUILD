# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jerry Lin <jerry73204 at gmail dot com>

pkgname=python-av-git
_pkg="${pkgname%-git}"
_py="${_pkg#python-}"
pkgver=9.2.0.r10.g1d892a7
pkgrel=1
pkgdesc='Pythonic bindings for FFmpeg'
arch=('x86_64')
url="https://github.com/mikeboers/PyAV"
license=('BSD')
provides=("$_pkg")
conflicts=("$_pkg")
depends=('ffmpeg' 'python')
makedepends=('cython' 'git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_py-${pkgver%.r*}.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
