# Maintainer: ZjeuhPiung <sophgn@outlook.com>
pkgname=rime-middle-chinese
pkgver=0.0.0.20210927
_commit=582e144e525525ac2b6c2498097d7c7919e84174
pkgrel=1
pkgdesc="中古漢語拼音輸入方案(廣韻音系)"
arch=('x86_64')
url='https://github.com/rime/rime-middle-chinese'
license=(LGPL)
conflicts=('rime-middle-chinese-git')
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/rime/rime-middle-chinese/archive/$_commit/rime-middle-chinese-$_commit.tar.gz")
sha512sums=('dabcf2683e54dcf44e6ce7a89da6b1d808a210ca20fbe131f793bb0c9d51213c3514f231b944adf4495aa8fe2a43d7ae984d83dc90fa49a0e4bd6279df9cd009')

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
