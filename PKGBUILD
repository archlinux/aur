# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=maestral
pkgver=1.8.0
pkgrel=1
pkgdesc='A light-weight and open-source Dropbox client'
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
   'python-wheel'
   'python-sphinx'
   'python-sphinx-autoapi'
   'python-sphinx_rtd_theme'
   'python-sphinx_mdinclude'
   'python-sphinxext-opengraph'
   )
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86b7968f98bc8380525b464ebca40181df57be1e86ea103825e8b08085583fc2')

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
   install -dvm644 "$pkgdir/usr/share/licenses/$pkgname/"
   ln -sv "$_site/maestral-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
