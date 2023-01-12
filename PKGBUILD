# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgname=python-seqlearn-git
_pkg=seqlearn
pkgver=r89.32d4bfa
pkgrel=2
pkgdesc="Sequence classification toolkit for Python"
arch=('x86_64')
url='https://github.com/larsmans/seqlearn'
license=('MIT')
depends=('python-scikit-learn')
makedepends=(
	'cython'
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
source=("$_pkg::git+$url"
        'setup.py.patch')
sha256sums=('SKIP'
            'bf5d8bff54489ccd71a427a1a136527b7d913ca386c770bf2de7683d6bae9f16')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -p1 -d "$_pkg" < setup.py.patch
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-0.2.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
