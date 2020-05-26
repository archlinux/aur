# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-aurora-pinyin
pkgver=0.0.0.20200526
_commit=0410b24b58a6cd5d8f629e1f28e2412b1e1ac2d8
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=('x86_64')
url="https://github.com/hosxy/rime-aurora-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke' 'rime-essay-simp')
makedepends=('librime' 'rime-prelude')
source=("https://github.com/hosxy/rime-aurora-pinyin/archive/$_commit/rime-aurora-pinyin-$_commit.tar.gz")
sha512sums=('8f575f102c03fe8c525763a0f6d6d32872c2ad593f49d27f0b8bfe9c5f2069ed3ed969b6166aaf0ca5d7ce1f1044579b4938c2e2f815822a25bc8f2a4a22f3d3')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay-simp | grep -v "/$"); do ln -sf $_f; done
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
}
