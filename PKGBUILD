# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.8.0
pkgrel=2
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
  python-pytz
)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(
  'python-pillow-heif: HEIF support'
  'python-sentry_sdk: Sentry error handler'
  'python-statsd: statsd metrics'
)
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

# no check(): many tests fail or need whole new dependency chains

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
