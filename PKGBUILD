pkgname=sph-lib-git
pkgver=739.g4c68433
pkgrel=1
pkgdesc="more than 80 gpl3+ licensed guile scheme libraries"
arch=(x86_64)
url="https://sph.mn/computer/software/sph-lib.html"
license=(GPL3)
depends=(guile)
makedepends=(git gcc pkgconf)
provides=(sph-lib)
conflicts=(sph-lib)
source=("sph-lib::git+https://github.com/sph-mn/sph-lib.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/sph-lib"
  printf "%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sph-lib"
  inc="$(pkg-config --cflags-only-I guile-3.0 2>/dev/null | tr ' ' '\n' | sed 's/^-I//' | paste -sd: -)"
  test -n "$inc" || inc="$(pkg-config --cflags-only-I guile-2.2 2>/dev/null | tr ' ' '\n' | sed 's/^-I//' | paste -sd: -)"
  test -n "$inc" || inc="/usr/include/guile/3.0:/usr/include/guile/2.2"
  export C_INCLUDE_PATH="$inc"
  ./exe/compile-extension
}

package() {
  cd "$srcdir/sph-lib"
  ./exe/install "$pkgdir"
}
