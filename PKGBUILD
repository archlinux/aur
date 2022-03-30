# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
pkgver=3.4.0
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=('python-dbus-next' 'python-packaging')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-m2r2'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-autoapi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8534e7d0c6353fee487f8042e8a16e79223fa7676e91aa9b5f8aee876b1328da')

prepare() {
	cd "desktop-notifier-$pkgver"
	sed -i 's/dekstop/desktop/' docs/conf.py
}

build() {
	cd "desktop-notifier-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	export PYTHONHASHSEED=0
	cd "desktop-notifier-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/desktop-notifier.1 -t "$pkgdir/usr/share/man/man1/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/desktop_notifier-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
