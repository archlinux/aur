# Maintainer: Swift Geek <swiftgeek «at» gmail.com>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: John D Jones III (jnbek) <jnbek1972 at gmail dot com>

pkgname=perl-alien-wxwidgets
_cpan_name=Alien-wxWidgets
pkgver=0.69
pkgrel=3
pkgdesc="building, finding and using wxWidgets binaries"
arch=('any')
url="https://metacpan.org/release/${_cpan_name}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'wxgtk3' 'perl-module-pluggable')
makedepends=('perl-module-build' 'perl-lwp-protocol-https')
options=(!emptydirs)
source=("http://www.cpan.org/modules/by-module/${_cpan_name%%-*}/${_cpan_name}-${pkgver}.tar.gz")
sha256sums=('53224e4bbbefff4cf7b63ed9a62963893b9ffd4965d70d96710348f8676de249')
_src_dir=${_cpan_name}-${pkgver}

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    WX_CONFIG=/usr/bin/wx-config \
    MODULEBUILDRC=/dev/null
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
