# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgbase=python-mediafile
_name=${pkgbase#python-}
pkgname=($pkgbase ${pkgbase/python-/python2-})
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple interface to the metadata tags for many audio file formats'
url="https://github.com/beetbox/$_name"
arch=('any')
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE")
sha256sums=('a59ec09142fd352648596de18836af765c6e59b25e95fc2f5aa72b6f082b3ddf'
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

check() {
  pushd python3
  python3 -m nose
  popd

  pushd python2
  python2 -m nose
}

package_python-mediafile() {
  depends=(python python-six python-mutagen)

  cd python3
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgbase/LICENSE"
}

package_python2-mediafile() {
  depends=(python2 python2-six python2-mutagen python2-enum34)

  cd python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgbase/python-/python2-}/LICENSE"
}
