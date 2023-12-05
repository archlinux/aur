# Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: Kobokai <martinsteer AT maxi DOT net DOT au>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>

pkgname=hearse
pkgver=1.5
pkgrel=6
pkgdesc="Nethack online bones file exchanger"
arch=('i686' 'x86_64')
url="http://hearse.krollmark.com/"
license=('GPL')
depends=('perl-libwww')
source=("https://web.archive.org/web/20220524055801/http://www.argon.org/~roderick/hearse/dist/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
options=(!emptydirs)
install=hearse.install
md5sums=('4c022342d3f75af3b70a3e07e8e82ee0'
         '7227c09106d43ff2c29f538b93ca2fde')

build() {
  cd $srcdir/$pkgname-$pkgver

  # 64-bit patch
  patch -p3 -i "$srcdir/hearse.patch"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir/"

  sed -e '/my $Run_as_user/ s/games/root/' \
      -e '/my $Run_as_group/ s/games/root/' \
      -i $pkgdir/usr/bin/vendor_perl/hearse

  install -m644 -D $srcdir/$pkgname-$pkgver/hearse.conf \
                   $pkgdir/etc/nethack/hearse.conf
  
  sed -e 's|# bones-dir.*|bones-dir /var/games/nethack|' \
      -i $pkgdir/etc/nethack/hearse.conf
}

# vim:set ts=2 sw=2 et:
