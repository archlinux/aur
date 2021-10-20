# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2021.4
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=('any')
url=https://github.com/python/tzdata
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-subtests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('351032b2bb205b23b56ef5ca7b2b4eec739a0d5c078f86278ffdda4863aee8ab')
b2sums=('27fe66e40014217f433f0a85e525d5b2d659aac730acacc49b5d7c007f820164ec4edc88e78f1da8acf65b55d314ff1068dda6f559783411fa91a981fa64abd9')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  mkdir -p temp
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m install --optimize=1 --destdir=temp dist/*.whl
  PYTHONPATH="$PWD/temp/$site_packages" pytest tests
}

package() {
  cd $_name-$pkgver
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
