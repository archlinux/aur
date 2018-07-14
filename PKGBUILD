# $Id$
# Maintainer: psdp <psdp.dev@gmail.com>

pkgname=shadowsocksr
pkgver=3.2.2
pkgrel=2
pkgdesc="Python port of ShadowsocksR"
license=('Apache')
url="https://github.com/shadowsocksrr/shadowsocksr"
arch=('any')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('libsodium: For salsa20 and chacha20 support')
checkdepends=('python-coverage' 'python-pyflakes' 'libsodium' 'python-nose' 'dante' 'procps-ng' 'util-linux')
install=${pkgname}.install
conflicts=('shadowsocks')
source=("git+https://github.com/shadowsocksrr/shadowsocksr.git#tag=$pkgver"
        "shadowsocksr@.service"
        "shadowsocksr-server@.service")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

check() {
  cd shadowsocksr
  tests/jenkins.sh || warning "Tests failed"
}

package() {
  cd shadowsocksr

  python setup.py install -O1 --root="$pkgdir"

  install -dm755 "$pkgdir/usr/share/man/man1"
  install -m644 debian/{ssserver.1,sslocal.1} "$pkgdir/usr/share/man/man1"
  install -Dm644 debian/config.json "$pkgdir/etc/shadowsocksr/config.json"

  install -Dm644 "$srcdir/shadowsocksr@.service" "$pkgdir/usr/lib/systemd/system/shadowsocksr@.service"
  install -Dm644 "$srcdir/shadowsocksr-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocksr-server@.service"
}
