# Contributor: Swift Geek <swiftgeek «at» gmail.com>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: John D Jones III (jnbek) <jnbek1972 at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

pkgname=perl-alien-wxwidgets
_cpan_name=Alien-wxWidgets
pkgver=0.69
pkgrel=4
pkgdesc="building, finding and using wxWidgets binaries"
arch=('any')
url="https://metacpan.org/dist/${_cpan_name}"
license=("Artistic-1.0-Perl OR GPL-1.0-or-later")
depends=('perl>=5.10.0' 'wxwidgets-gtk3' 'perl-module-pluggable')
makedepends=('perl-module-build' 'perl-lwp-protocol-https')
options=(!emptydirs)
source=("https://cpan.org/modules/by-module/${_cpan_name%%-*}/${_cpan_name}-${pkgver}.tar.gz")
b2sums=('304dd5664fd9e628eb45c5c67cd9ca8250129c8c0eaba1a0d5e1d2ad6afe6cb7acf0eccfe954d2f35714942970613fd1cdcc466104d776119dcaea3a8b1ddff1')
_src_dir=${_cpan_name}-${pkgver}

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    WX_CONFIG=/usr/bin/wx-config \
    MODULEBUILDRC=/dev/null
  cd "$_src_dir"
  /bin/perl Makefile.PL
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
