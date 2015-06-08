# Maintainer: Moritz Kiefer <moritz.kiefer at gmail dot com>
# Contributor: SpotlightKid
pkgname=libgig-svn
_pkgname="${pkgname%-svn}"
pkgver=r2658    
pkgrel=1
pkgdesc="Gigasampler file access library"
arch=("i686" "x86_64")
url="http://www.linuxsampler.org/"
license=("GPL")
depends=("libsndfile"
         "util-linux")
makedepends=("subversion")
optdepends=()
provides=("libgig")
conflicts=("libgig")
source=("$pkgname"::"svn+https://svn.linuxsampler.org/svn/$_pkgname/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.cvs
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install

  # add libgig library path to ld.so.conf.d
  install -m0755 -d "$pkgdir/etc/ld.so.conf.d"
  echo "/usr/lib/$_pkgname" > "$pkgdir/etc/ld.so.conf.d/$_pkgname.conf"
}
