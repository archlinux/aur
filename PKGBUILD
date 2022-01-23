# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.0.2
pkgrel=1
pkgdesc="open-source photo thumbnail service"
arch=('x86_64')
url="https://github.com/thumbor/thumbor"
license=('MIT')
depends=(python python-colorful python-pycurl python-opencv python-exiv2 python-cairosvg python-tornado gifsicle python-libthumbor python-derpconf)
makedepends=(python-setuptools)
backup=("etc/thumbor.conf")
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz"
        "thumbor.service")
b2sums=('89777b9d1adb1f03589dca7147ff3e0aad3a6e4341bca1d531f18b97880021722d792c2121be0e815bdc0cdf05d7b5056e1818c0347ad2b2e63babae599f7563'
        'c0fe21516f245132ac9bb1a833601eabc8348f8c420c76d49ffe7cb25e00712fcbc0fe7c579604616f5008507ec9f7582936596e54e8a311acf949fb031cd5ca')

prepare() {
 cd "$pkgname-$pkgver"

 # Adjust storage/cache paths to match systemd service
 sed -e "s|FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'storage' )|FILE_STORAGE_ROOT_PATH = '/var/lib/thumbor'|" \
     -e "s|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = join(home, 'thumbor', 'result_storage')|RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = '/var/cache/thumbor'|" \
     -i $pkgname/$pkgname.conf
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 $srcdir/thumbor.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 $pkgname/$pkgname.conf -t "${pkgdir}"/etc/
}
