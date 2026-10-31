# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.8.0
pkgrel=1
pkgdesc='open-source photo thumbnail service'
arch=(x86_64)
url='https://github.com/thumbor/thumbor'
license=(MIT)
depends=(
  glibc
  python
  python-colorama
  python-pycurl
  python-opencv
  python-cairosvg
  python-tornado
  gifsicle
  python-libthumbor
  python-derpconf
  python-piexif
  python-jpegiptc
  python-pillow
  python-numpy
)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-preggy python-pyssim python-pytz python-sentry_sdk python-redis python-pytest-asyncio)
backup=('etc/thumbor.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'thumbor.service'
        'arch-config.patch')
b2sums=('49da4b480c634b60778723439d0cc15e1de59d7f28bce5f9e9ee1a557065f86e9358da00a37006c103c8ff5592f0aabc4f056265389421ab99303121baafc897'
        '9f5b837710e47654d522c5791cb5c6e01d6452093837a0c57b7158cbc8be6a7a3b5380efe2e975d6396bc1fd23a5f922f6ede9aa921142fd004ff48381f58db3'
        '7f84c5e210b21af45b1162fdc80e7016dca8b3c92a4d3ac303f3e35aa6405a476dab26af3840e6cd20e492e814c23380a9838035934adb352c91fcab2fb992ba')

prepare() {
  cd $pkgname-$pkgver

  # adjust storage/cache paths to match systemd service
  patch -p1 < ../arch-config.patch
}

# tests are disabled for now
# many of them are failing or require whole new dependency chains
#check(){
#  cd $pkgname-$pkgver
#  pytest -vvs \
#    --ignore=tests/detectors/test_queued_detector.py \
#    --ignore=tests/optimizers/test_gifv.py \
#    --ignore=tests/handlers/test_base_handler_with_gifv.py \
#    --ignore=tests/metrics/test_statsd_metrics.py \
#    --ignore=tests/handlers/test_base_handler_with_result_storage.py
#    --deselect integration_tests/pil_test.py::PILTest::test_single_params
#}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 thumbor.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 $pkgname-$pkgver/$pkgname/$pkgname.conf -t "$pkgdir"/etc/

  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
