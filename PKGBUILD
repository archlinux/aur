# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
# https://github.com/twisted/klein/blob/trunk/NEWS.rst
pkgver=23.5.0
pkgrel=1
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface
         # Detected by namcap and not declared in setup.py
         python-constantly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz"
        "$pkgname-pr586.patch"::"https://github.com/twisted/klein/commit/6d8f1dbacedf0aee85be307ac0e04537f2084f38.patch")
sha512sums=('ebfd50989bec653cb0997d5d58cd9071e1bd1690566f1892ca3a04511dfe1a64dc790859d955d69aa1757f77f049278bd628025fc2b596d153b7208d3007f0bc'
            '1eef3b5f973592f504cf2c6ca81448d61d3eda13df85bf2fef939ad3410bc25824a48c35493c7a6ee7a09c6ced17a12eb628b7f9b18666033c6672d6153d1940')

prepare() {
  cd klein-$pkgver
  patch -Np1 -i ../$pkgname-pr586.patch
}

build() {
  cd klein-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
