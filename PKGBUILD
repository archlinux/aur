# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=0.12.7
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
  $pkgname-0.12.7-devendor.patch
)
sha512sums=('4b3e40084c3bb4e3206fc00a98e24e28d46ec5efd4b76efebd4d03c7864a3cdefcc7cd429c4d5688a84f298738b8268f79e2ce7082421f539aff03cbe7d0c393'
            '7605bb15e16bde3807d97b6c3ff6359a40a5fd84adecfc53303938245c5c9704329fe59b0d32dbecf328895c44f5a04340e25560c8ec8d7511125fbc32a2590c')
b2sums=('4e405e897a27eb83b837d0b4b7bc73ba5e79d9d2c66ceabd03cf712a4b5bfdb31be58c5a78aee64f32b819cb63908ac360b91758715f014c4a7d45954bdff96e'
        '7c7b462b325b080e3cd4141beff1870b310919b5f3d7e11878c2242f822ffca66e8b01007762afc158a6013a737798f4946646b44b36cdc7a236e8b2c10adbe7')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ../$pkgname-0.12.7-devendor.patch
  rm -frv pdm/pep517/_vendor
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
