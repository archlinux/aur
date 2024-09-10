# Maintainer: SyiMyuZya <syimyuzya@gmail.com>

pkgname=rime-tupa-sp
pkgver=0.1.1
pkgrel=1
_commit=032b7b6e8a5e3c60fc155362ac6ca413fb7dabc5
pkgdesc="TUPA-SP input for RIME"
arch=('x86_64')
url="https://github.com/syimyuzya/$pkgname"
license=('CC0')
depends=('rime-tupa' 'rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('9e011d67ce0ef1b03036954f085f9e6617cd951797599ae5676fcd9e52781e1a')

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
