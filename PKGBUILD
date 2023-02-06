# Maintainer: David Runge <dvzrv@archlinux.org>

# set to 0 to use vendored sources
_devendored=1
_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=1.1.1
pkgrel=1
epoch=1
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python)
if (( $_devendored == 1 )); then
  # NOTE devendored from sources
  depends+=(
    python-cerberus
    python-license-expression
    python-packaging
    python-tomli
    python-tomli-w
  )
fi
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-1.1.1-devendor.patch
)
sha512sums=('f374ad13f1f06228956b5cfa8a8da455e80b31c68d33ceddbeb3e90925ff3bb4dd8d20dc037a99768490c4d44f38ebe119709ec261ec55c3f38c720747079ba3'
            'ab03d3dc4beb3a3530a1f14fb2f1eeef6c34f7a768b02312ccdc50e50c58f68a04b30a38af7bdbba2a8242131e5ef7451be54c6c3ab2146912eb3ae15fca4369')
b2sums=('4e6557278275c73bd0c26b20a793e57894481d6bba23b57ca350cee064adfbb82bd303fa6e69de86ee35deab55ed56d7c9c70c6d7ce66b8f29dbe2f1ff867a01'
        '0c286fd2b69c6d499b54779d964d3267ca8f9392cdbbfcdb3a079f9ea26496fe58e4a8f97e4032941d545297fe02192ec49b8a6c39ed2eaec0bc9001a35285da')

prepare() {
  if (( $_devendored == 1 )); then
    patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.1.1-devendor.patch
    rm -frv $_name-$pkgver/pdm/pep517/_vendor
  fi
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver

  # set default git config for test
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
