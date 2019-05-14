# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mbdata
_name=${pkgbase#python-}
pkgname=($pkgbase ${pkgbase/python-/python2-})
pkgver=25.0.0
pkgrel=1
pkgdesc='MusicBrainz database tools for Python'
url="https://pypi.python.org/pypi/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-v$pkgver.tar.gz::https://github.com/lalinsky/$_name/archive/v$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::https://github.com/lalinsky/mbdata/raw/v$pkgver/LICENSE")
sha256sums=('dfef117e5adaf614f34823a58adc0ba315b78edca06c8e023a315b961cf04939'
            'ecae6699839c9b7845aa36aba997c2ec5f09c5eb237f8910b972269de4bfc5f9')

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

package_python-mbdata() {
  depends=(python python-psycopg2 python-six)

  cd python3
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../"$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_python2-mbdata() {
  depends=(python2 python2-psycopg2 python2-six)

  cd python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../"$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgbase/python-/python2-}/LICENSE"
  # `mbslave` is provided by python-mbdata (for Python 3); no sense in duplicating
  rm -rf "$pkgdir/usr/bin"
}
