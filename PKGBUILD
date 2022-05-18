# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tupa
pkgver=0.0.0.20220518
_commit=c3bd6e5c261be8f9f5b219757046e8d5e95203f1
pkgrel=1
pkgdesc="TUPA input for rime"
arch=('x86_64')
url="https://github.com/ayaka14732/$pkgname"
license=('CC0')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('914c1b8e6d80063c7273c053d0ee80579e33f7bd87a3dfea7abf16bf6ecc7f3f')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
