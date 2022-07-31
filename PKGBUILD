# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=1.0.3
pkgrel=1
epoch=1
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python)
# NOTE devendored from sources
depends+=(
  python-cerberus
  python-license-expression
  python-packaging
  python-tomli
  python-tomli-w
)
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-1.0.3-devendor.patch
)
sha512sums=('104f6bff2c0c951c7959b98e8d37d58ead11d00e35bbeb804e23146dcd55afc1b11bc8017aaecf11e20a2f532b1fb8374ea744f83c7b50c380e1aee519855b06'
            '47afbb9611780e77000ea488f5ca061e4c41e8811490c32282fd19f9e792fa97e1395912cbd2afd92f56dbf34f31e3b31a6ae7ddf05399a141d03539ddd1b966')
b2sums=('f4a69ed2073e3003124aefe23065ba9551fe699b9c953a1e07f7c334c3ed82fe9422f8279d379c617de99295b26e78d901a01333b7b0a56736c487b44fff8f35'
        'ffb106b5ce6ab17952c34b6a2aeb57b699fcaef762fe46fe16e8474250282d931fb4a383ba963b20c0af1c34702a260dd522f98fcdb40dd6dc6dd5f7bc8b3f96')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.0.3-devendor.patch
  rm -frv $_name-$pkgver/pdm/pep517/_vendor
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
