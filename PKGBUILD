# Contributor: Carlos Aznarán <caznaranl@uni.pe>
_base=find_orb
pkgname=${_base/_/-}-git
pkgver=r2361.5f90971
pkgrel=1
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/${_base}.htm"
license=(GPL2)
makedepends=(meson git)
source=(git+https://github.com/Bill-Gray/${_base}.git
  git+https://github.com/Bill-Gray/lunar.git
  git+https://github.com/Bill-Gray/sat_code.git
  git+https://github.com/Bill-Gray/jpl_eph.git
  git+https://github.com/Bill-Gray/miscell.git)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${_base}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/lunar"
  make
  #make integrat
  make install

  cd "$srcdir/jpl_eph"
  make libjpl.a
  make install

  cd "$srcdir/sat_code"
  make sat_id
  make install

  cd "$srcdir/${_base}"
  make
  make install
}

package() {
  meson install -C build --destdir="$pkgdir"
}
