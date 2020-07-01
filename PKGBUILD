# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-aurora-pinyin
pkgver=0.0.0.20200701
_commit=c177745d61b0d9d4b5ca479b3965e42f0771869e
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=('x86_64')
url="https://github.com/hosxy/rime-aurora-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('librime' 'rime-prelude')
source=("https://github.com/hosxy/rime-aurora-pinyin/archive/$_commit/rime-aurora-pinyin-$_commit.tar.gz")
sha512sums=('d8b85e103cbca3ea57641a4587f331914540fff453377263f0fa477c1d98659dbd782892197f32c8b5df9869ecea8c9d4a2a664aa3fe8128a9daf468f9f6087e')

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
