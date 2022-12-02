# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.0.0
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(ffmpeg libopenshot libopenshot-audio python-pyqt5 python-pyzmq
python-requests qt5-base qt5-svg python-pyqt5-webengine)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('faac: for exporting audio using AAC')
source=(
  https://github.com/OpenShot/openshot-qt/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-2.6.1-no_metric_default.patch
)
sha512sums=('c44c4ad25d321ea26e6fbafd8df0fca7dd2d7fc0827de208f60ebe98b0615e0f3d594660e6b482ebab25216cc26c9ece5b92bb6f26ab60d2e731d2194cc3e774'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('777f3e12932e08b2b2811ae10ba3c86ef8b64e821b1742d54e8b0c1cb3de544bcbd9b2a1544bc5b48c38066c9d106ac224888b4f3064b15963c69b36dcfabc51'
        '6f75f37be8d3e03090a8ca53e645b3269f92c7f44aa39cfbe1a03266a36d508d5c18eebbb5792ed9d6d031b3694902bc3fa3a2dac745aad60b2bc331657a364a')

prepare() {
  cd $pkgname-qt-$pkgver
  # disable default metric collection with google analytics
  patch -Np1 -i ../$pkgname-2.6.1-no_metric_default.patch
}

build() {
  cd $pkgname-qt-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-qt-$pkgver
  python -m unittest discover -vs src/tests
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-qt-$pkgver/dist/*.whl
  cd $pkgname-qt-$pkgver
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
