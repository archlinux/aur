# Maintainer: ZjeuhPiung <sophgn@outlook.com>
pkgname=rime-middle-chinese
pkgver=0.0.0.20200628
_commit=8b1c4e42ec7e7c10d1b7b5d026c042acd42805b2
pkgrel=1
pkgdesc="中古漢語拼音輸入方案(廣韻音系)"
arch=('x86_64')
url='https://github.com/rime/rime-middle-chinese'
license=(LGPL)
conflicts=('rime-middle-chinese-git')
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/rime/rime-middle-chinese/archive/$_commit/rime-middle-chinese-$_commit.tar.gz")
sha512sums=('17c037fe515242d359bd7742ac903e62b343bf964f783b2b96709e523871e294794da73aa06481f5556dbe8a94ce9e705be14e416237f993c9e13567266e0db2')

prepare() {
  cd $pkgname-$_commit
  for _f in $(pacman -Qql rime-prelude rime-essay rime-luna-pinyin | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/luna*
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
