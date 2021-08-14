# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-nushu
pkgver=0.0.0.20200722
_commit=a3337fc6a5cb8b7e6c62b2f318b69d52fe4ad383
pkgrel=2
pkgdesc="Nushu input for rime"
arch=('x86_64')
url="https://github.com/nushu-script/rime-nushu"
license=('Unlicense')
# dependency for reverse lookup
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude')
source=("https://github.com/nushu-script/rime-nushu/archive/$_commit/rime-nushu-$_commit.tar.gz")
md5sums=('da3b0921dcd5152c8052d1e6ef83c68e')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
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
