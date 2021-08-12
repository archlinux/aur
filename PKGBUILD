# Maintainer: Dringsim <dringsim@qq.com>

pkgname=rime-stenotype
pkgver=1.1
_commit=f3e9189d5ce33c55d3936cc58e39d0c88b3f0c88
pkgrel=2
pkgdesc="Rime schema for Chinese stenotype"
arch=('x86_64')
url="https://github.com/rime/rime-stenotype"
license=('GPL3')
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
md5sums=('0c72140b34c2e954bc6cad4682b4e021')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay rime-luna-pinyin | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  rime_deployer --compile stenotype.schema.yaml
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  rm build/luna_*
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}