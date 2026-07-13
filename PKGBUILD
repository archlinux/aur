# Maintainer: a821 at mail de
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=minisign-git
pkgver=0.12.r55.g41006b4
pkgrel=1
epoch=1
pkgdesc='A dead simple tool to sign files and verify signatures.'
arch=('x86_64')
url='https://jedisct1.github.io/minisign/'
license=('ISC')
depends=('glibc')
makedepends=('git' 'zig')
provides=('minisign')
conflicts=('minisign')
source=('git+https://github.com/jedisct1/minisign')
sha256sums=('SKIP')

pkgver() {
  cd minisign
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd minisign
  zig build --verbose -Dcpu=baseline -Doptimize=ReleaseSmall -Dwithout-libsodium
}

check() {
  cd minisign
  zig-out/bin/minisign -GW -p test.pub -s test.sec
  echo 'ohai!' > msg.txt
  zig-out/bin/minisign -S -s test.sec -m msg.txt
  zig-out/bin/minisign -V -p test.pub -m msg.txt -x msg.txt.minisig
}

package() {
  cd minisign
  install -Dm755 -t "$pkgdir/usr/bin" zig-out/bin/minisign
  install -Dm644 -t "$pkgdir/usr/share/man/man1" share/man/man1/*
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
