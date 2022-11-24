# Maintainer: David Runge <dvzrv@archlinux.org>

# set to 0 to use vendored sources
_devendored=1
_name=pdm-pep517
pkgname=python-pdm-pep517
# WARNING: python-pdm may not be compatible with whatever pdm-pep517 can be upgraded to:
# https://github.com/pdm-project/pdm/issues/1165
pkgver=1.0.6
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
  $pkgname-1.0.5-devendor.patch
)
sha512sums=('b09a33a2e3470266d00a0e3fae2fdb59e5404ef891c50efe87805a0b7df85ca75d29a37c747510d5481dcebd5f99abceb49f09155e54218072bc54457fc4a333'
            '0158c486ebb668b7e48b450d50a8223d45776517e868dd85c322d29cd925acd3e2e28782796a16e137dcc38312bce753535ba7c71ced58f8d5dd74ddb41701c0')
b2sums=('b38c770b9bada5747017e173e7f6e277b736b6b03204b17ab34184e5bfa2acdcb6b03d2001944c37d35638c3446f4262b1c823e93d3a36d35b2446c8a01f5377'
        '4b20b48d9eeac1bb397eec1c98400a9f70aa576689c1cefb33e31dd86f128f30c51be759bb8ede3a2c26ec65055020e3decee7d1b42d67720902db9e6b13cd42')

prepare() {
  if (( $_devendored == 1 )); then
    patch -Np1 -d $_name-$pkgver -i ../$pkgname-1.0.5-devendor.patch
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
