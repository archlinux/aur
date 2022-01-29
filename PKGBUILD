# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-desktop-notifier
pkgver=3.3.2
pkgrel=1
pkgdesc='Python library for cross-platform desktop notifications'
arch=('any')
url="https://github.com/SamSchott/desktop-notifier"
license=('MIT')
depends=('python>=3.6' 'python-dbus-next' 'python-packaging')
makedepends=(
	'python-build'
	'python-install'
	'python-wheel'
	'python-m2r2'
	'python-sphinx'
	'python-sphinx_rtd_theme'
	'python-sphinx-autoapi')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('05831a7db64747f6e2e56d844f8086a1d5178049e64b89d0a9240adbe8a3ed59')

prepare() {
	cd "desktop-notifier-$pkgver"
	sed -i 's/dekstop/desktop/' docs/conf.py
}

build() {
	cd "desktop-notifier-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

package() {
	export PYTHONHASHSEED=0
	cd "desktop-notifier-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/_build/man/desktop-notifier.1 -t "$pkgdir/usr/share/man/man1/"
}
