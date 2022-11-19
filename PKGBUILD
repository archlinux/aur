# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_pkgname=furo
pkgname=python38-sphinx-$_pkgname
pkgver=2022.09.29
pkgrel=1
pkgdesc='A clean customizable documentation theme for Sphinx'
arch=('any')
url='https://github.com/pradyunsg/furo'
license=('MIT')
depends=('python38-sphinx-basic-ng' 'python38-pygments' 'python38-beautifulsoup4')
makedepends=('python38-build' 'python38-installer' 'python38-sphinx-theme-builder' 'python38-flit-core'
             'nodejs-lts-gallium' 'npm' 'expac')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('62967c7449428ad02b8d38fe21afb1fa200febb1d8cb7c3999320988ddeac85ecd70eef5ede9bbc9d5b2fe586afeff11f53150d2e864941b177ba0680ef5a296')

prepare() {
  cd $_pkgname-$pkgver
  # force use of system nodejs
  local node_ver=$(expac %v nodejs-lts-gallium | cut -d - -f 1)
  sed -i "s/16.13.1/$node_ver/" pyproject.toml
}

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -nw

  # docs disabled for now to unblock Python 3.10 update

  # sphinx needs this theme installed because it is uses it.
  # simply injecting the package to sys.path (via PYTHONPATH or similar)
  # is not enough because sphinx looks for themes in the registered
  # entrypoints, this means we actually have to install the package.
  # for this we will create a venv with access to system packages and
  # install the theme there, then we will build the documentation.

  #python -m venv --system-site-packages doc-env
  #doc-env/bin/python setup.py install --skip-build

  #doc-env/bin/python /usr/bin/sphinx-build -b dirhtml -v docs build/docs/html
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  #install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  #cp -r -a --no-preserve=ownership build/docs/html "$pkgdir"/usr/share/doc/$pkgname
  #rm -rf "$pkgdir"/usr/share/doc/$pkgname/html/.doctrees

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
