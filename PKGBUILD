# Maintainer: Akatsuki <akiirui@outlook.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>

pkgname=rime-data
pkgver=r109.60cddc8
pkgrel=1
pkgdesc="Rime schema repository from plum"
arch=('x86_64')
url="https://github.com/rime/plum/"
license=('GPL3')
makedepends=('cmake' 'git' 'librime')
provides=('librime-data' 'brise')
conflicts=('brise')
source=("$pkgname::git+https://github.com/rime/plum.git"
        "Makefile.patch")
sha512sums=('SKIP'
            '5da46a18f4391eb3d76c58929db77d8a05d385437d6a2b16ce8b6df6465b494056464fd9481b08fc2286ad0ed35c646add1ff0a7e810350063d0255b05910f3b')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  patch Makefile "$srcdir"/Makefile.patch
}

build() {
  cd "$pkgname"
  make all
  rime_deployer --build output
  rm output/user.yaml
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
