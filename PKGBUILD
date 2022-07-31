# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>

_pkgname=rime-aurora-pinyin
pkgname=rime-aurora-pinyin-git
pkgver=r46.709398a
pkgrel=1
pkgdesc="【极光拼音】输入方案"
arch=("any")
url="https://github.com/hosxy/rime-aurora-pinyin"
license=("LGPL")
# Dependency for reverse lookup.
depends=("rime-stroke")
makedepends=("librime" "rime-prelude")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # Link essentials.
  for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd "${_pkgname}"
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd "${_pkgname}"
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "${pkgdir}/usr/share/rime-data/"
  install -Dm644 build/* -t "${pkgdir}/usr/share/rime-data/build/"
}
