# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tupa
pkgver=0.0.0.20220422
_commit=3ce2e93ba501fdd766c8a7532566c126dfc810a3
pkgrel=1
pkgdesc="TUPA input for rime"
arch=('x86_64')
url="https://github.com/ayaka14732/$pkgname"
license=('CC0')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('163acd4d56d9034ab2e612bed4458b2b3087b5cc8526e2543041c2e61c8cd97f')

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
