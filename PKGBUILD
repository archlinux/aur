pkgname=rime-japanese
pkgver=0.0.0.20230204
_commit=4c1e65135459175136f380e90ba52acb40fdfb2d
pkgrel=1
pkgdesc="Input method for typing Japanese with RIME"
arch=(i686 x86_64 arm aarch64)
url="https://github.com/gkovacs/rime-japanese"
license=('custom')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('git' 'librime' 'rime-prelude' 'rime-essay')
source=("git+$url#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd $pkgname
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
