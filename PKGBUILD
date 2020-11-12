# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=20.6.0
pkgrel=3
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental python-six
         python-tubes python-twisted python-werkzeug python-zope-interface)
makedepends=(python-setuptools)
checkdepends=(python-hypothesis python-mock python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('1cba04a365fd9c7185e2f2472f617f875ee9cec41ac97940dda4a145811cefcbbe34f11e1f306656dc43d88b49e66bfcb5efb72d25283bbc8a0729b2fc5e2fca')

build() {
  cd klein-$pkgver
  python setup.py build
}

check() {
  cd klein-$pkgver
  # klein tests are broken with treq 20.4.1
  # https://github.com/twisted/klein/issues/339
  pytest -v src/klein/test -k 'not test_customParameterValidation and not test_handlingGET'
}

package() {
  cd klein-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
