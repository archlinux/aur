# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-confuse
_name=${pkgbase#python-}
pkgname=($pkgbase ${pkgbase/python-/python2-})
pkgver=1.1.0
pkgrel=1
pkgdesc='Configuration library for Python that uses YAML'
url="https://github.com/beetbox/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
#checkdepends=('python-nose' 'python2-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('adc1979ea6f4c0dd3d6fe06020c189843a649082ab8f6fb54db16f4ac5e5e1da'
            '0b308ae66aaa1412ebbe645bec4002fd262d91e9cdf67b6f198026677ddfafcc')

prepare() {
  cp -a $_name-$pkgver python2
  mv $_name-$pkgver python3
}

build() {
  pushd python3
  python3 setup.py build
  popd

  pushd python2
  python2 setup.py build
}

# TODO: See https://github.com/beetbox/confuse/issues/54
#check() {
#  pushd python3
#  python3 -m nose
#  popd
#
#  pushd python2
#  python2 -m nose
#}

package_python-confuse() {
  depends=(python python-yaml)

  cd python3
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_python2-confuse() {
  depends=(python2 python2-yaml)

  cd python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgbase/python-/python2-}/LICENSE"
}
