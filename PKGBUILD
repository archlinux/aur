# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tshet
pkgver=0.0.0.20220316
_commit=efcde3eb2023b1579db11fbc276f11143da9f497
pkgrel=1
pkgdesc="Tshet-uinh input for rime"
arch=('x86_64')
url="https://github.com/ayaka14732/$pkgname"
license=('CC0')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=('f594a662a2c8757a77300bcada506ba89af973979a5174ded534846c06845fd7')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
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
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
