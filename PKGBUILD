# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=perl-radiator
_dist="Radiator"
_distver="4.30-1"
pkgver="$(echo "$_distver" | sed -e 's/-/./g')"
pkgrel=1
pkgdesc='Radiator RADIUS server, providing the Perl Radius module.'
arch=('any')
url="https://radiatorsoftware.com/products/radiator/"
license=('LicenseRef-Radiator')
depends=('perl')
optdepends=('perl-digest-md4: NTLM hash support'
            'perl-net-ssleay: EAP-TLS and other SSL/TLS-based functionality'
            'perl-dbi: SQL database support'
            'perl-dbd-mariadb: MariaDB SQL database support'
            'perl-dbd-pg: Postgres SQL database support'
            'perl-dbd-sqlite: SQLite SQL database support')
options=('!emptydirs' 'purge')
DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED}==\> ERROR:${ALL_OFF}${BOLD} You must download %u from Radiator Software to install this package${ALL_OFF}" $DLAGENTS[@])
source=("file://$_dist-$_distver.tgz")
b2sums=('60bae5454c085927945da0a9a336ef4d87bca55aee01330603a8ea09739e73ca4975ed1154b90de1a7a676663be9d43d15e7027f0904d19dadda591351bd1379')

build() {
  cd $_dist-$_distver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$_distver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$_distver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  install -dm755 "${pkgdir}/usr/share/${pkgname}/"
  cp -R -p dictionary* doc goodies "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
