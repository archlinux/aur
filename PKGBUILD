# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname="perl-audio-scan"
pkgver="1.01"
pkgrel='7'
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=("i686" "x86_64" "arm")
license=("GPL-2.0-or-later")
options=("!emptydirs")
depends=("zlib")
makedepends=("perl-test-warn")
url="https://metacpan.org/dist/Audio-Scan"
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz"
        'fix-type-of-self-parameter.diff')
sha512sums=('07e97bd1bb2c469d07c27e20bf2f3067967e21658493de012fcc4c083a0a0c42e36d6d8d5ae8d6f80d8b447d11fdea1c024ee7f4c3f857e565335328238e2853'
            '25a3b230dd52e2804d216be3e075b1a3d567d19ab311a8b48403717e05306fd548f65ff78d8ce3c5e15d1d6458c35ea2f08d900d36e35b46db8f4901ee2a8fb4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Audio-Scan-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  patch -p1 < "${srcdir}/fix-type-of-self-parameter.diff"
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
  find "$pkgdir" -type f -name '*.so' -exec strip {} \+ # 'strip' option doesn't work because files are read-only
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
