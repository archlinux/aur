# Maintainer: Jeremy Gust	<jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral
pkgver=1.7.2
pkgrel=1
pkgdesc='Open-source Dropbox client'
arch=('any')
url="https://github.com/SamSchott/maestral"
license=('MIT')
depends=(
	'python-click'
	'python-desktop-notifier'
	'python-dropbox'
	'python-fasteners'
	'python-importlib-metadata'
	'python-keyring'
	'python-keyrings-alt'
	'python-packaging'
	'python-pathspec'
	'python-pyro5'
	'python-requests'
	'python-rich'
	'python-setuptools'
	'python-survey'
	'python-typing_extensions'
	'python-watchdog')
optdepends=(
	'maestral-qt: Qt interface for the maestral daemon'
	'python-systemd: Syslog support')
makedepends=(
	'python-build'
	'python-installer'
	'python-m2r2'
	'python-wheel'
	'python-sphinx'
	'python-sphinx-autoapi'
	'python-sphinx_rtd_theme'
	'python-sphinxext-opengraph'
	)
checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'maestral@.service')
sha256sums=('2b9c5bfc08b34c0f835855972dc2983a5fdf1dbcae9035cc5a92c036546ebff5'
            'f20ab8c6e59271d76d9298bab604eaa139ec1993a49e6a571846b55482461fa3')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	cd docs
	sphinx-build -b man ./ ./_build/man/
}

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=src/ pytest -k 'not test_autostart and not benchmark' -x --disable-warnings
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 "$srcdir/maestral@.service" -t "$pkgdir/usr/lib/systemd/user/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 docs/_build/man/maestral.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/maestral-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
