# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-aurora-pinyin
pkgver=0.0.0.20200521
_commit=aad1a1eff80a65a64f3eb570b89a5cc46014d8c1
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=('x86_64')
url="https://github.com/hosxy/rime-aurora-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('librime' 'rime-prelude' 'rime-essay-simp')
source=("https://github.com/hosxy/rime-aurora-pinyin/archive/$_commit/rime-aurora-pinyin-$_commit.tar.gz")
sha512sums=('78db30cf9b26abe5fe422006cfdc09b906ff43a757d52ceb76099275f0c51663c04bca26764abf48d254ef50baa1c23fbb7ba62e6236687981162842318f3ed7')

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
