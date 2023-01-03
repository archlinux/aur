# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.0.0
pkgrel=3
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
sha512sums=('d1115095b34937419d0f08aadacc849768a97ba5d3866a46cb8d416a26ac7fbb754b383c99ea8cb70291bd08cec0343191e71cfdd19c046bbd1a43541fc0673a'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('1e7bd8921a472e4ff62b160d67fcb5a8d8c0e6614a28cce87db5078fae5401c69610bd44801344da55fc4df3c8f973263b75a8567d4372fc350f76dbeec428a1'
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
