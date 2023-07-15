pkgname=pluto-find-orb-git
pkgver=20230712.3ccabe5
pkgrel=1
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/find_orb.htm"
license=(GPL2)
makedepends=('meson' 'git')
source=("git+https://github.com/Bill-Gray/find_orb.git"
  	"git+https://github.com/Bill-Gray/lunar.git"
  	"git+https://github.com/Bill-Gray/sat_code.git"
  	"git+https://github.com/Bill-Gray/jpl_eph.git"
  	"git+https://github.com/Bill-Gray/miscell.git")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/find_orb"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  printf "bulding lunar\n\n"
  cd "$srcdir/lunar"
  make
  make install

  printf "bulding jpl_eph\n\n"
  cd "$srcdir/jpl_eph"
  make libjpl.a
  make install

  printf "bulding sat_code\n\n"
  cd "$srcdir/sat_code"
  make sat_id
  make install

  printf "bulding find_orb\n\n"
  cd "$srcdir/find_orb"
  make
  make install
}

package() {
  meson install -C build --destdir="$pkgdir"
}
