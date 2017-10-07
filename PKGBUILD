# Maintainer: Yiyao Yu <yuydevel@protonmail.com>

_pkgname=shadowsocks
pkgname="${_pkgname}-git"
pkgver=2.9.1.r21.g2ab8c6b
pkgrel=2
pkgdesc="A lightweight tunnel proxy"
license=('Apache')
_url="https://github.com/shadowsocks/shadowsocks"
url="https://github.com/shadowsocks/shadowsocks/tree/master"
arch=('any')
provides=('shadowsocks')
conflicts=('shadowsocks')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('libsodium: For salsa20 and chacha20 support')
checkdepends=('python-coverage' 'python-pyflakes' 'libsodium' 'python-nose' 'dante' 'procps-ng' 'util-linux')
install=${_pkgname}.install
source=("${_pkgname}::git+${_url}.git"
        "shadowsocks@.service"
        "shadowsocks-server@.service")
sha512sums=('SKIP'
            '96ecb174a476f64dec3ec086732d93a76d27e9a1cc56b1dc3fa87bf8e00d4b3c44076a01a0d525e42174cacc58fd5c16d5c8af5d4636dae13df549dec8204f7d'
            'f2f8240c18a4483bf3e03b3a5ac8822c3deae713224f732bf28f7fddfcc5d0b02aa91652665ff93f05731e162a9407109c18f43d732a3a9b19d9eacfc806a4df')

pkgver(){
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

prepare(){
  git -C "${_pkgname}" checkout master
}

check() {
  cd shadowsocks
  tests/jenkins.sh || warning "Tests failed"
}

package() {
  cd shadowsocks
  python setup.py install -O1 --root="$pkgdir"

  install -dm755 "$pkgdir/usr/share/man/man1"
  install -m644 debian/{ssserver.1,sslocal.1} "$pkgdir/usr/share/man/man1"
  install -Dm644 debian/config.json "$pkgdir/etc/shadowsocks/example.json"

  install -Dm644 "$srcdir/shadowsocks@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks@.service"
  install -Dm644 "$srcdir/shadowsocks-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-server@.service"
}
