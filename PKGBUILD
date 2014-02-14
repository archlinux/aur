# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=fabother-world
pkgname=$_pkgbase-git
pkgver=r62.0b0f404
pkgrel=1
pkgdesc='An interpreter for Another World (Out of this world)'
arch=('i686' 'x86_64')
url="http://fabiensanglard.net/anotherWorld_code_review/"
license=('GPL2')
depends=('sh' 'sdl' 'zlib')
makedepends=('git')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/fabiensanglard/Another-World-Bytecode-Interpreter.git"
        "$_pkgbase.sh" "$_pkgbase.png" "$_pkgbase.desktop")
sha256sums=('SKIP'
            'edc27018901b0d72fdeae797643070dbfa53dc2220d9f96af059b1aff4430aa9'
            'b57c493f1ae135ebc2b809211db091957fa0a7b755856ef1637e58cdd7dd216e'
            '897a8ae9f3bf64e44dea5981b0d1189ea80e4aedf0b4ab039b7e969c7eb7593f')

pkgver() {
  cd $_pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # add our cxxflags
  sed "s|CXXFLAGS.*DEFINES)$|& ${CXXFLAGS}|" -i $_pkgbase/Makefile
}

build() {
  make -C $_pkgbase
}

package() {
  cd $_pkgbase

  # launcher + binary
  install -Dm755 ../$_pkgbase.sh "$pkgdir"/usr/bin/$_pkgbase
  install -Dm755 game "$pkgdir"/usr/share/$_pkgbase/$_pkgbase
  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$_pkgbase/README
  install -m644 README.newraw "$pkgdir"/usr/share/doc/$_pkgbase
  tail -n 210 main.cpp > "$pkgdir"/usr/share/doc/$_pkgbase/implementation.txt
  # desktop entry
  install -Dm644 ../$_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 ../$_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
