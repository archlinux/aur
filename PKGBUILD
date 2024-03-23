# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.7.3
pkgrel=4
pkgdesc='open-source photo thumbnail service'
arch=(x86_64)
url='https://github.com/thumbor/thumbor'
license=(MIT)
depends=(
  python
  python-colorama
  python-pycurl
  python-opencv
  python-cairosvg
  python-tornado
  gifsicle
  python-libthumbor
  python-derpconf
  python-socketfromfd
  python-piexif
  python-jpegiptc
)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-preggy python-pyssim)
backup=('etc/thumbor.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'thumbor.service')
b2sums=('4fcc9f9f3eb74021616c544bf6a8a35935284272d7ab0cfe69e4d98f26dd22159e39dc6e4c9910d4c43789211f50c944bdf89a54e6fabcec166d1c5e8b53dfa8'
        '9f5b837710e47654d522c5791cb5c6e01d6452093837a0c57b7158cbc8be6a7a3b5380efe2e975d6396bc1fd23a5f922f6ede9aa921142fd004ff48381f58db3')

prepare() {
  cd $pkgname-$pkgver

  # adjust storage/cache paths to match systemd service
  sed -e "s|FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'storage' )|FILE_STORAGE_ROOT_PATH = '/var/lib/thumbor'|" \
      -e "s|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'result_storage')|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = '/var/cache/thumbor'|" \
      -i $pkgname/$pkgname.conf
}

# skip tests for now, they are utterly broken and require sentry.io sdk
#check(){
#  cd "$pkgname-$pkgver"
#  pytest
#}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 thumbor.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 644 $pkgname-$pkgver/$pkgname/$pkgname.conf -t "$pkgdir"/etc/

  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
