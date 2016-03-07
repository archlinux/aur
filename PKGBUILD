# Maintainer: epitron <chris@ill-logic.com>

pkgname=camlistore
pkgver=0.9
pkgrel=2
pkgdesc='Camlistore (Content-Addressable Multi-Layer Indexed Storage) is your personal storage system for life.'
arch=('i686' 'x86_64')
url='https://camlistore.org/'
license=('Apache')
depends=('sqlite')
optdepends=('mongodb: as indexer database'
  'postgresql: as indexer database'
  'mariadb: as indexer database')
makedepends=('go')
install=camlistore.install
source=(
  https://github.com/camlistore/$pkgname/archive/$pkgver.tar.gz
  camlistore.service
)
sha256sums=(
  b889671dbdb497edc669c0ea2fbb2fa0f6bee8412dfb05e6e4d4bc10dae2a80b
  506eef3f0e95d42c521c9df58f2f9d497d1c2f85f5d6fc66458f25beca8be047
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  echo "$pkgver" > VERSION
  go run make.go
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" "${srcdir}"/$pkgname-$pkgver/bin/{camget,camlistored,cammount,camput,camtool,devcam,publisher}
  
  install -D -m644 "${srcdir}/camlistore.service" "${pkgdir}/usr/lib/systemd/system/camlistore.service"
}
