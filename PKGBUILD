# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=3.1.1
pkgrel=1
pkgdesc="An award-winning free and open-source video editor"
arch=(any)
url="https://www.openshot.org/"
license=(GPL3)
depends=(
  ffmpeg
  hicolor-icon-theme
  libopenshot
  libopenshot-audio
  python
  python-pyqt5
  python-pyqt5-webengine
  python-pyzmq
  python-requests
  qt5-base
  qt5-svg
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  xorg-server-xvfb
)
optdepends=('faac: for exporting audio using AAC')
source=(
  https://github.com/OpenShot/openshot-qt/archive/v$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-2.6.1-no_metric_default.patch
)
sha512sums=('4e5a42825abf8e3862957039169905a6f03872d81de454f52a57ace2e636e91b2f4e87ae603bf9669baa7d1bbbd6c0213efd0c72e23f2b209ba266af2fbe380f'
            'd52441559897ce0de476a6120b7e36b082bbcb0722436a77c1a60456a86d02f370df6bc58384c838a3ad2df47c1603a6fabd5044c303284bac2ea75a99a76a8a')
b2sums=('4059fe12b064692070278366f787789866dcbe39414d10217fb62b671dda98ebb6d2f76b8e1cfe2284a647e3d7ebc460b620ba0756a4542f5b26e7ef669e9b3e'
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
  xvfb-run python src/tests/query_tests.py
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-qt-$pkgver/dist/*.whl
  cd $pkgname-qt-$pkgver
  install -vDm 644 {AUTHORS,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
