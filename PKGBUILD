# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.7.3
pkgrel=2
pkgdesc="open-source photo thumbnail service"
arch=(x86_64)
url="https://github.com/thumbor/thumbor"
license=(MIT)
depends=(python python-colorama python-pycurl python-opencv python-cairosvg python-tornado gifsicle python-libthumbor python-derpconf python-socketfromfd python-piexif)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-preggy python-pyssim)
backup=("etc/thumbor.conf")
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz"
        "thumbor.service")
b2sums=('4fcc9f9f3eb74021616c544bf6a8a35935284272d7ab0cfe69e4d98f26dd22159e39dc6e4c9910d4c43789211f50c944bdf89a54e6fabcec166d1c5e8b53dfa8'
        'c0fe21516f245132ac9bb1a833601eabc8348f8c420c76d49ffe7cb25e00712fcbc0fe7c579604616f5008507ec9f7582936596e54e8a311acf949fb031cd5ca')

prepare() {
  cd "$pkgname-$pkgver"

  # Adjust storage/cache paths to match systemd service
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
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 $srcdir/thumbor.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 $pkgname/$pkgname.conf -t "${pkgdir}"/etc/
}

# vim:set ts=2 sw=2 et:
