# Maintainer: Daniel Lublin <daniel@lublin.se>
# Contributor: Daniel Lublin <daniel@lublin.se>

_pkgname=sigtop
pkgname=$_pkgname-git
pkgver=r214.b0813cc
pkgrel=1
pkgdesc='Export messages from Signal Desktop'
arch=('i686' 'x86_64')
url="https://github.com/tbvdm/$_pkgname"
license=('ISC')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url#branch=portable")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  make
  head -n 15 sigtop.c | cut -b 4- >LICENSE
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 $_pkgname.1 "$pkgdir"/usr/share/man/man1/$_pkgname.1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
