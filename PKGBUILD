# Maintainer: Howard Cheung <mail@h-cheung.cf>

pkgname=rime-easy-en-git
_reponame=rime-easy-en
pkgver=20200519.r21.5848ebd
pkgrel=1
pkgdesc="Easy en for rime"
arch=('x86_64')
url="https://github.com/rime/rime-luna-pinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-stroke')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("git+https://github.com/BlindingDark/rime-easy-en")
sha512sums=('SKIP')


pkgver() {
    cd $_reponame
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

prepare() {
  cd $_reponame
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $_reponame
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $_reponame
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
