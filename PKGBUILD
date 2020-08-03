# Maintainer: ZjeuhPiung <sophgn@outlook.com>
pkgname=rime-middle-chinese-git
pkgver=0.1
pkgrel=1
pkgdesc="中古漢語（切韻音系）全拼及三拼"
arch=('x86_64')
url='https://github.com/biopolyhedron/rime-middle-chinese'
source=("$pkgname::git+$url")
license=(custom)
depends=('rime-luna-pinyin')
makedepends=('librime' 'rime-prelude' 'rime-essay')
sha512sums=('SKIP')

prepare() {
    cd $pkgname
    for _f in $(pacman -Qql rime-prelude rime-essay rime-luna-pinyin | grep -v "/$"); do ln -sf $_f; done
}

build() {
    cd $pkgname
    for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname
  find . -type l -delete
  rm build/luna*
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
