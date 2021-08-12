# Maintainer: Dringsim <dringsim@qq.com>

pkgname=rime-dieghv
pkgver=0.0.0.20190211
_commit=1709bb786a144de7be2229755011fde9034457de
pkgrel=2
pkgdesc="Rime schema for Teochew dialect"
arch=('x86_64')
url="https://github.com/kahaani/dieghv"
license=('GPL3')
# dependency for reverse lookup
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("$url/archive/$_commit/dieghv-$_commit.tar.gz")
md5sums=('756386d338eb71b64a0691d0136ba9bb')

prepare() {
  cd dieghv-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
 cp ./60/*.schema.yaml .
 cp ./mtr/*.schema.yaml .
}

build(){
  cd dieghv-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd dieghv-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}