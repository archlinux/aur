pkgname=nsdiff
pkgver=1.85
pkgrel=2
pkgdesc="Create an 'nsupdate' script from DNS zone file differences. Includes nsvi, nspatch."
url="https://dotat.at/prog/nsdiff/"
license=("0BSD OR MIT-0")
arch=(any)
depends=(
  bind          # named-compilezone
  bind-tools    # dig, nsupdate
  perl
)
provides=(
  nspatch=$pkgver
  nsvi=$pkgver
  perl-dns-nsdiff=$pkgver
)
options=(!emptydirs)
source=("https://dotat.at/prog/nsdiff/DNS-nsdiff-$pkgver.tar.gz")
sha256sums=('ca8e160daff164bfb99be8b7467a83059906725fada91d75f256917b3d313400')
#_commit=f2979fd03bbede624709700dfb65b26d94a0f2f2 # 1.81
#source=("git+https://github.com/fanf2/nsdiff.git#commit=$_commit")
#sha256sums=('SKIP')

build() {
  cd DNS-nsdiff-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd DNS-nsdiff-$pkgver
  make DESTDIR="$pkgdir" install

  for x in nsdiff nspatch nsvi; do
    ln -s "vendor_perl/$x" "$pkgdir/usr/bin/$x"
  done
}

# vim: ts=2:sw=2:et
