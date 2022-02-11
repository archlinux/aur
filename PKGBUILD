# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=gitakc
pkgver=0.2
_scalaversion=2.13.8
pkgrel=1
pkgdesc="A small program to use user's GitHub keys for ssh authorization."
arch=('x86_64')
url="https://github.com/sequencer/gitakc"
depends=('libidn' 'curl')
makedepends=('mill' 'clang' 'lld')
source=("https://github.com/sequencer/gitakc/archive/refs/tags/$pkgver.tar.gz")
b2sums=('2f4e52cb6da7bf559376068031fcad1e601d5648d9b796d34a07c3bac1052ce52d31035151e759b785375a16549176271bc106a1999adb14a7c8c85a3fe723cb')
install="gitakc.install"

prepare() {
  cd gitakc-$pkgver
  sed -i 's|\"sequencer\"|// &|' gitakc/resources/test.json
}

build() {
  cd gitakc-$pkgver
  mill -i gitakc.native[$_scalaversion].nativeLink
}

package() {
  cd gitakc-$pkgver
  install -Dm755 out/gitakc/native/$_scalaversion/nativeLink.dest/out "$pkgdir"/usr/bin/gitakc
  install -Dm644 gitakc/resources/test.json "$pkgdir"/etc/gitakc.json
}
