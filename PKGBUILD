# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-aurora-pinyin
pkgver=0.0.0.20200720
_commit=894e691250b8ca1cbe9378e10989a6e3f1629cd2
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=('any')
url="https://github.com/hosxy/rime-aurora-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('librime' 'rime-prelude')
source=("https://github.com/hosxy/rime-aurora-pinyin/archive/$_commit/rime-aurora-pinyin-$_commit.tar.gz")
sha512sums=('ed742df86877ba55d23337861cd174c0c7a3f348f4d9284a8fca8a9ae5d1b45de5ba11faa7b0ed489cf00b1911f968e3a458474233e0867f65b99267c5170bd5')

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
