# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>
pkgname=maestral
pkgver=1.9.5
pkgrel=1
pkgdesc='A light-weight and open-source Dropbox client'
arch=('any')
url="https://github.com/SamSchott/maestral"
license=('MIT')
depends=('hicolor-icon-theme'
         'python'
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
         'python-survey'
         'python-typing_extensions'
         'python-watchdog'
         'python-xattr')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-sphinx'
             'python-sphinx-autoapi'
             'python-sphinx_mdinclude'
             'python-sphinx_rtd_theme'
             'python-sphinxext-opengraph'
             'python-wheel')
checkdepends=('python-pytest')
optdepends=('maestral-qt: Qt interface for the maestral daemon'
            'python-systemd: Syslog support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d7fb6774097de9bb84f0111a02b951f390d8ae5604f5e42f687a704aed0c0933')

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
	python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dvm644 docs/_build/man/maestral.1 -t "${pkgdir}/usr/share/man/man1/"
	install -Dvm644 LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
