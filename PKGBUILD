# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

# Note: this is copied from the SVN upstream gzip package
# with minimal modifications to be compatible with zutils.
# Please do not flag gzip-zutils out of date until gzip is
# up to date in the stable Arch Linux repository.

_pkgname=gzip
pkgname=gzip-zutils
pkgver=1.12
pkgrel=1
pkgdesc='GNU compression utility—zutils compat'
arch=('x86_64')
url='https://www.gnu.org/software/gzip/'
license=('GPL3')
groups=('base-devel')
depends=('glibc' 'bash' 'less')
provides=('gzip')
conflicts=('gzip')
validpgpkeys=('155D3FC500C834486D1EEA677FD9FCCB000BEEEE') # Jim Meyering
source=("https://ftpmirror.gnu.org/gzip/gzip-$pkgver.tar.xz"{,.sig})
sha256sums=('ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956'
            'SKIP')
prepare() {
  cd $_pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make prefix="$pkgdir/usr" install

  # zutils compatibility
  for file in usr/{bin/z{cat,cmp,diff,egrep,fgrep,grep},share/man/man1/z{cat,cmp,diff,grep}.1}; do
    rm $pkgdir/$file
  done
}
