# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-amqp-rabbitmq
pkgver="2.40012"
pkgrel='1'
pkgdesc="interact with RabbitMQ over AMQP using librabbitmq"
arch=("any")
license=('MPL')
url="https://metacpan.org/pod/Net::AMQP::RabbitMQ"
options=(!emptydirs)
depends=('perl-math-int64>=0.34' 'perl-scalar-list-utils')
makedepends=('perl-devel-checklib')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSTEMLE/Net-AMQP-RabbitMQ-${pkgver}.tar.gz"
       'gcc14.patch')
sha512sums=('3e29beff8fbcc69276a23aa78c53c5474d44bb62bb26df555a5ff3ef5afa94c4d08b83a4b27d26d79c462b0f9ca60027c2c5448e8d450c31560e3e058234111e'
            '95de603f5a5a5532b11a5aff4b98c22e8bc25281e5b9eb74c8f2100513551bf641245998b3e51699b989a9a54bb0f957bbb4dc02bef48796f4ff870cc9133d7b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Net-AMQP-RabbitMQ-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  patch -p1 < "$srcdir/gcc14.patch"
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
