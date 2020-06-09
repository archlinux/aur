# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-cloverpinyin
pkgver=1.0.2
pkgrel=1
#pkgdesc="Clover Simplified pinyin input for rime."
pkgdesc="✤四叶草简体拼音输入方案 for rime"
arch=('x86_64')
url="https://www.fkxxyz.com/d/cloverpinyin/"
license=('LGPL')
depends=('rime-prelude' 'rime-emoji' 'rime-symbols')
makedepends=('librime')
#source=("https://github.com/fkxxyz/rime-cloverpinyin/archive/${pkgver}.tar.gz")
source=(git+https://gitee.com/fkxxyz/rime-cloverpinyin.git)
sha512sums=('SKIP')

prepare() {
  cd $pkgname/data
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname
  git checkout ${pkgver} 2>/dev/null
  cd data
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname/data
  find . -type l -delete
  rm build/*.txt
  rm -rf opencc
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
