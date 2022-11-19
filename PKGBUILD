# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

_pkgname=build
pkgname=python38-$_pkgname
pkgver=0.9.0
pkgrel=1
pkgdesc='A simple, correct PEP 517 build frontend'
arch=('any')
url='https://github.com/pypa/build'
license=('MIT')
depends=('python38-tomli' 'python38-pep517' 'python38-packaging')
optdepends=('python38-virtualenv: Use virtualenv for build isolation')
makedepends=('git' 'python38-installer' 'python38-setuptools' 'python38-wheel'
             'python38-sphinx' 'python38-sphinx-argparse-cli' 'python38-sphinx-autodoc-typehints' 'python38-sphinx-furo')
checkdepends=('python38-pytest' 'python38-pytest-mock' 'python38-pytest-rerunfailures' 'python38-filelock' 'python38-toml' 'python38-wheel')
source=("git+$url#tag=$pkgver?signed")
validpgpkeys=('3DCE51D60930EBA47858BA4146F633CBB0EB4BF2') # Filipe Laíns (FFY00) <lains@archlinux.org>
sha512sums=('SKIP')

build() {
  cd $_pkgname

  python3.8 -m build --wheel --skip-dependency-check --no-isolation

  PYTHONPATH=src sphinx-build -b dirhtml -v docs docs/build/html
}

check() {
  cd $_pkgname

  PYTHONPATH=src pytest
}

package() {
  cd $_pkgname

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/build/html "$pkgdir"/usr/share/doc/$pkgname
  rm -rf "$pkgdir"/usr/share/doc/$pkgname/html/.doctrees

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
