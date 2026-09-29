# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_author=SYP
_dist=Net-Curl
pkgname=perl-${_dist@L}
pkgver=0.58
pkgrel=2
pkgdesc='Perl interface for libcurl'
arch=('x86_64')
url=https://metacpan.org/dist/$_dist
license=('MIT')
depends=(
    'curl>=7.15.5'
    'perl-carp'
    'perl-exporter'
    'perl>=5.8.1'
)
makedepends=('perl-extutils-makemaker')
optdepends=(
    'perl-extutils-pkgconfig'
    'perl-xsloader'
)
options=('!emptydirs')
source=(
    "https://cpan.metacpan.org/authors/id/${_author::1}/${_author::2}/$_author/$_dist-$pkgver.tar.gz"

    # https://github.com/sparky/perl-Net-Curl/issues/90
    # https://github.com/sparky/perl-Net-Curl/pull/87
    'https://patch-diff.githubusercontent.com/raw/sparky/perl-Net-Curl/pull/87.patch?full_index=1'
)
sha256sums=(
    '37c1585cc70e21579c7c733e306e97a46adc093a3777af6d8ba37d73986d7f5a'
    'e95318d2de7a7d4d5a911f464d95cfbc6b0a5115646375eb61794ca9c461a9d1'
)

prepare()
{
    cd "$_dist-$pkgver"
    patch -Np1 -i '../87.patch?full_index=1'
}

build()
{
    cd "$_dist-$pkgver"

    unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1

    /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
    make
}

check()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make test
}

package()
{
    cd "$_dist-$pkgver"

    unset PERL5LIB PERL_LOCAL_LIB_ROOT

    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
