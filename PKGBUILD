# Maintainer: Nicholas Hubbard <nicholashubbard@posteo.net>
pkgname=yabsm
pkgver=3.15.3
pkgrel=1
pkgdesc='A btrfs snapshot manager and backup system'
arch=('any')
url='https://metacpan.org/dist/App-Yabsm'
license=('GPL3')
depends=('perl' 'openssh' 'btrfs-progs' 'sudo' 'which')
source=("https://cpan.metacpan.org/authors/id/N/NH/NHUBBARD/App-Yabsm-$pkgver.tar.gz")
sha256sums=('2b62f26fe1097ca3a17e3d460ebe0b21dd0de1c878807a68090990e7fda88bed')
_distdir="App-Yabsm-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
      PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=perl INSTALLSCRIPT=/usr/bin DESTDIR='$pkgdir'" \
      MODULEBUILDRC=/dev/null
    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  rm -r "${pkgdir}/usr/lib/perl5"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm644 examples/yabsm.conf.example "${pkgdir}/etc/yabsm.conf.example"
  install -Dm644 ../../yabsmd.service "${pkgdir}/usr/lib/systemd/system/yabsmd.service"
}
