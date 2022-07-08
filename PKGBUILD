# Maintainer: SyiMyuZya <syimyuzya@gmail.com>

pkgname=rime-tupa-sp
pkgver=0.1.0
pkgrel=1
_commit=fb946f7ebdf00b9a3a2b51fb6c60927d999e09b0
pkgdesc="TUPA-SP input for RIME"
arch=('x86_64')
url="https://github.com/syimyuzya/$pkgname"
license=('CC0')
depends=('rime-tupa' 'rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('56a63c34f1248bd1d6b27667d1837a324bd73867fc107474a1b096dfb34726c3')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
  mkdir build
  cd build
  for _f in $(pacman -Qql rime-tupa | grep "/build/tupa\.\(table\|reverse\)\.bin$"); do ln -sf $_f; done
}

build() {
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/tupa_sp.*.yaml -t "$pkgdir"/usr/share/rime-data/build/
}
