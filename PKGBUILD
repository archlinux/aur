# Maintainer: Jeremy Gust	<jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
_pkg="${pkgname#python-}"
pkgver=3.5.3
pkgrel=3
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=(
	'python-dbus-next'
	'python-packaging'
	'python-certifi'
	'python-charset-normalizer'
	)
makedepends=(
	'python-build'
	'python-installer'
	'python-sphinx'
	'python-sphinx-autoapi'
	'python-sphinx_rtd_theme'
	'python-sphinx_mdinclude'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1aef415c4f01d859cb311f044b4489b860bfb2b2203aa9b1a2ecf797ad6f6c3c')

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
