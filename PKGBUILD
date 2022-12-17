# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
_pkg="${pkgname#python-}"
pkgver=3.4.2
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=('python-dbus-next' 'python-packaging')
makedepends=(
	'python-build'
	'python-installer'
	'python-m2r2'
	'python-sphinx'
	'python-sphinx-autoapi'
	'python-sphinx_rtd_theme'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('952420e0280555b31775e8b7fa00ea97cb9fd065353dca6f672ea1c2fca97851')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i 's/dekstop/desktop/' docs/conf.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 docs/_build/man/desktop-notifier.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv \
		"$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
