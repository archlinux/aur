# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=0.12.4
pkgrel=1
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python-boolean.py python-cerberus python-license-expression python-packaging python-pyparsing python-tomli python-tomli-w)
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-0.12.4-devendor.patch
)
sha512sums=('16feb14c9b344357e1853a45e100724a4a3b426867488d9e37493dc9e9c884de51d6b617d2c82daab56f9e2050a0cfea830e84443e9c837854908417de26ad2b'
            '40ce9ff4490d7bec7b29c9be35e53730a069cfea83d6b2eb9f8a4652a1587cef26fc46fd20e75684cbfc0128e6b975154bdb2bdca0e121b689721e81766e06b3')
b2sums=('c3c02bac0269b7ef992567c99a4978632b4fc1fb9d07b1000357df39018c69e6d2f081d9b46d861e90eecf8925f14853a530fc4ccd850b48ceebd674a06f2df8'
        'e87d1a79fc162c34169826367382194ea3fa6066bbea54be9c28a76e4ba8ed8b9035adf7050d03e8477e6376a5a831e311d3a5d877281ac5a9886347fd3405b2')

prepare() {
  cd $_name-$pkgver
  # remove vendoring of python-boolean.py, python-cerberus,
  # python-license-expression, python-packaging, python-pyparsing,
  # python-tomli, python-tomli-w
  patch -Np1 -i ../$pkgname-0.12.4-devendor.patch
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
