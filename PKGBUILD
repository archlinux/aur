# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=thumbor
pkgver=7.0.0a5
pkgrel=2
pkgdesc="open-source photo thumbnail service"
arch=('x86_64')
url="https://github.com/thumbor/thumbor"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
backup=("etc/thumbor.conf")
source=("https://github.com/thumbor/thumbor/archive/$pkgver.tar.gz"
        "thumbor.service")
b2sums=('be18d4cda7cfb759a4a928bb6e63f2b8126a379a81c9902dd3e8e243e0418bb294a684664c636ffdc86a96366976ed5510a084e44e643581874da1f085a219cc'
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
