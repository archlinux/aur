# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-aurora-pinyin
pkgver=0.0.0.20200726
_commit=fc05c246db4afccfe13170380489099abfa01cc8
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=('any')
url="https://github.com/hosxy/rime-aurora-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('librime' 'rime-prelude')
source=("https://github.com/hosxy/rime-aurora-pinyin/archive/$_commit/rime-aurora-pinyin-$_commit.tar.gz")
sha512sums=('92271153bdf47b4554d35a8cbd714e5b38089d939cbbba41a381ad347f28f7aef579016949dbe905073a1dafea85cc0bfd692398c41d7d0714bf9a02f5967655')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
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
