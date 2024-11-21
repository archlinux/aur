# Maintainer: SyiMyuZya <syimyuzya@gmail.com>

pkgname=rime-tupa-sp
pkgver=0.1.2
pkgrel=2
_commit=64215f0303045ca1cf92981630f857e243b12825
pkgdesc="TUPA-SP input for RIME"
arch=('x86_64')
url="https://github.com/syimyuzya/$pkgname"
license=('CC0')
depends=('rime-tupa' 'rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('82a9a069593075f85e61333cd0e6876caa441f7133ce3a49018832e7b70a3d2b')

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
  install -Dm644 build/tupa_sp.* -t "$pkgdir"/usr/share/rime-data/build/
}
