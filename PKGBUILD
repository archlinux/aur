# Maintainer: Marc Cousin <cousinmarc at gmail dot com>
# Cotnributor : François Freitag <mail at franek dot fr>
# Contributor: Victor van den Elzen <victor.vde at gmail dot com>
pkgname=pgbadger
pkgver=13.1
pkgrel=1
pkgdesc="A fast PostgreSQL Log Analyzer"
arch=("any")
url="https://github.com/darold/pgbadger"
license=("custom:PostgreSQL")
depends=('perl>=5.10.0')
checkdepends=("perl-text-csv-xs" "perl-json-xs")
depends=(
  "perl-text-csv-xs" "perl-json-xs"
)
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" "6c388d02d2ac48fbcef742e417dd490308250595.patch")
sha256sums=('9658ff222ed7b387d3cb76c3e3d90d1862b885c13b26aa9ff652e133f5d018f1'
            '56ee42bfe11df54bc52a08b0e5dbfa5f56ed2db449dc22ac13b34fc3dff65418')

build() {
  # Override perl command line options we don't want. Source:
  # https://wiki.archlinux.org/index.php/Perl_Policy#Vendor
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/pgbadger-${pkgver}"
  # Temporary fix until 13.2
  patch -p1 < ../../6c388d02d2ac48fbcef742e417dd490308250595.patch

  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/pgbadger-${pkgver}"
  make test
}

package() {
  # Override perl command line options we don't want. Source:
  # https://wiki.archlinux.org/index.php/Perl_Policy#Vendor
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/pgbadger-${pkgver}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"

  # Remove perllocal.pod and .packlist
  find "${pkgdir}" \( -name .packlist -o -name perllocal.pod \) -delete
}
