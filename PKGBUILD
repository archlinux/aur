# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tupa
pkgver=0.0.0.20220521
_commit=a8568446d9dde284dfc3f45badb1909b12519184
pkgrel=1
pkgdesc="TUPA input for rime"
arch=('x86_64')
url="https://github.com/ayaka14732/$pkgname"
license=('CC0')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('cacef8273b5a06d04d0cbcc2d2adb6f362bb3a8301e7c245d3fdbf8b2fa04900')

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
