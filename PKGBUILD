# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=1.2.10
pkgrel=1
pkgdesc="Cross Platform Search Tool for Finding Pythons"
arch=(any)
url="https://github.com/sarugaku/pythonfinder"
license=(MIT)
depends=(python-attrs python-cached-property python-click python-packaging python-six)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
# no tests in sdist tarballs on pypi.org
# https://github.com/sarugaku/pythonfinder/issues/115
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("$_name-$pkgver.tar.gz::https://github.com/sarugaku/$_name/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ee01528cc70e2625868825bb25c6f8517d611c4c89da3357e48fd002faa5a9181f73774f2ed8e07be62ff08648bf0d16675ff06bab33f31993ac19ea0b5daf3f')
b2sums=('c0cba99f9ff199f666ead89c367d141472479c459fd8c4b8c6f69182489c94bac4fa1c472052fecdb854b95483187412310ce03879c3ac99143e39a2224e930d')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$(pwd)/build/lib:$PYTHONPATH"
  # disable tests that rely on git cloning: https://github.com/sarugaku/pythonfinder/issues/116
  pytest -v -c /dev/null -k "not test_shims_are_kept and not test_shims_are_removed"
}

package() {
  cd $_name-$pkgver
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
