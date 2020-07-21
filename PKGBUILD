# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-nushu
pkgver=0.0.0.20200721
_commit=84063b2738058eaee59701c8e4deb2e1f0dc538c
pkgrel=1
pkgdesc="Nushu input for rime"
arch=('x86_64')
url="https://github.com/nushu-script/rime-nushu"
license=('Unlicense')
# dependency for reverse lookup
depends=('rime-luna-pinyin')
makedepends=('librime')
source=("https://github.com/nushu-script/rime-nushu/archive/$_commit/rime-nushu-$_commit.tar.gz")
md5sums=('0d5e6c4edf4fdbeb7f808691fbf5a90a')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  # Do not need to compile luna_pinyin_nushu here,
  # because it directly uses luna_pinyin_simp
  rime_deployer --compile nushu.schema.yaml
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
