# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-js2py
pkgver=0.72
_commit=70fe4f557e957db082ee49f8e9b4cf4ac80071ef
pkgrel=1
pkgdesc="JavaScript to Python Translator & JavaScript interpreter written in 100% pure Python"
url="https://github.com/PiotrDabkowski/Js2Py"
license=('MIT')
arch=('any')
depends=('python38-six' 'python38-pyjsparser')
makedepends=('python38-setuptools' 'python38-tzlocal')
checkdepends=('npm' 'python38-numpy')
optdepends=('python38-tzlocal: for local timezone support')
source=("$pkgname-$_commit.tar.gz::https://github.com/PiotrDabkowski/Js2Py/archive/$_commit.tar.gz"
        "js2py-opt-tzlocal.patch::https://github.com/PiotrDabkowski/Js2Py/pull/293.patch")
sha512sums=('55ae8ff0d9875ce7588bbd5541077015070b95c382e2ce35a40b44939e5194cd3f29b08d544ad38d37d5cd38e6fc01884fabb35bbb2449566051095d224c4592'
            'db4fce5b0b26cc89346347719f7feb8da65119ef54504f6475d7a52f0dbb6483c26ff259a1b5c54c98422057e64debad5d2d92585e1acfd1a1c67f301d6a328c')

prepare() {
  mv Js2Py-{$_commit,$pkgver}
  cd Js2Py-$pkgver
  # https://github.com/PiotrDabkowski/Js2Py/pull/293
  patch --forward --strip=1 --input=../js2py-opt-tzlocal.patch
}

build() {
  cd Js2Py-$pkgver
  python3.8 setup.py build
}

check() {
  cd Js2Py-$pkgver
  python3.8 simple_test.py
}

package() {
  cd Js2Py-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
