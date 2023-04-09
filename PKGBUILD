# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=21.8.0
pkgrel=5
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface)
makedepends=(python-setuptools)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz"
        "$pkgname-pr552-fix-tests.patch"::"https://github.com/twisted/klein/commit/bce8b85036a6d185b9e8aab037c805f81354544c.patch")
sha512sums=('f0e10e3b92f19dc6b42f071d836b4179af033955fb6a1feb05918c85901741577f8dddc335ead1a4c1181690709abd73bca755c6a7a402d79d7a4bfb196bca58'
            '34a9623119ca7e00df5fa01852281fec25eb26adc6c293da0d9f33ae2142697362b7dbdc50c3321e292c9c29e9c15abcf122410d24a43e06d8952579cf320198')

prepare() {
  cd klein-$pkgver
  # Part of https://github.com/twisted/klein/pull/552, for fixing tests
  patch -Np1 -i ../$pkgname-pr552-fix-tests.patch
}

build() {
  cd klein-$pkgver
  python setup.py build
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
