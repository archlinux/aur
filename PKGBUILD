# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-ipa
pkgver=0.0.0.20200413
_commit=22b71710e029bcb412e9197192a638ab11bc2abf
pkgrel=1
pkgdesc="IPA input for rime"
arch=('x86_64')
url="https://github.com/rime/rime-ipa"
license=('LGPL')
# dependency for reverse lookup
#depends=()
makedepends=('librime')
source=("$url/archive/$_commit/rime-ipa-$_commit.tar.gz")
md5sums=('3389e3f58b140b24080b8d848012b202')

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
