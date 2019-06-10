# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: veox <veox at wemakethings dot net>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Anatol Pomozov

pkgname=python2-autobahn
pkgver=19.6.2
pkgrel=2
pkgdesc='Real-time framework for Web, Mobile & Internet of Things'
arch=(any)
url='https://crossbar.io/autobahn/'
license=(MIT)
depends=(python2-twisted python2-six python2-txaio python2-trollius python2-wsaccel)
makedepends=(python2-setuptools python2-msgpack python2-pynacl python2-trollius)
checkdepends=(python2-mock python2-pytest)
optdepends=(
  'python2-msgpack: MsgPack serializer support'
  'python2-pynacl: WAMP-cryptosign support'
)
source=(https://pypi.io/packages/source/a/autobahn/autobahn-$pkgver.tar.gz
        skip-test-missing-serializers.patch)
sha256sums=('48c2d737d33cfe1d37124db984577c5d4f44e116d05a9f8b6505721413ff9b22'
            '2d4ec4300f98cddd13c3a4d70e6ae4934a98f17b04628cadfd18654172d04f92')

prepare() {
  cd "$srcdir/autobahn-$pkgver"
  patch -Np1 -i ../skip-test-missing-serializers.patch
}

build() {
  cd "$srcdir/autobahn-$pkgver"
  AUTOBAHN_USE_NVX=1 python2 setup.py build
}

check() {
  cd "$srcdir/autobahn-$pkgver"
  USE_TWISTED=1 PYTHONPATH=.:build/lib.linux-$CARCH-3.7 pytest2 -v autobahn
  USE_ASYNCIO=1 PYTHONPATH=.:build/lib.linux-$CARCH-3.7 pytest2 -v autobahn
}

package() {

  cd "$srcdir/autobahn-$pkgver"
  AUTOBAHN_USE_NVX=1 python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/bin/wamp" "$pkgdir/usr/bin/wamp2"
}
