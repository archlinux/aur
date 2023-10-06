# Maintainer:

_gitname="nullfs"
_pkgname="fuse-$_gitname"
pkgname="$_pkgname-git"
pkgver=r15.0884f87
pkgrel=1
pkgdesc="FUSE nullfs drivers"
arch=(x86_64)
url="https://github.com/xrgtn/nullfs"

# source contains GPL notices, but repo lacks full license file
license=('GPL')

depends=(
  'fuse2'
  'gcc-libs'
)
makedepends=(
  'fuse2'
  'git'
)

provides=(
  'fuse-nullfs'
  'nul1fs'
  'nullfs'
  'nulnfs'
)
conflicts=(
  'fuse-nullfs'
  'nul1fs'
  'nullfs'
  'nulnfs'
)

_pkgsrc="$_gitname"
source=(
  "$_pkgsrc"::"git+$url.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgsrc"
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgsrc"

  make nul1fs
  make nulnfs
  g++ -lfuse -o nullfs nullfs.c++
}

package() {
  install -Dm755 "$srcdir/$_pkgsrc/nul1fs" \
    -t "$pkgdir/usr/bin/"

  install -Dm755 "$srcdir/$_pkgsrc/nulnfs" \
    -t "$pkgdir/usr/bin/"

  install -Dm755 "$srcdir/$_pkgsrc/nullfs" \
    -t "$pkgdir/usr/bin/"
}
