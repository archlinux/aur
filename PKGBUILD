# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

set -u
_perlmod='Data-Hexdumper'
_modnamespace='Data'
pkgname="perl-${_perlmod,,}"
pkgver='3.0001'
pkgrel='1'
pkgdesc="Perl CPAN ${_perlmod//-/::} - Make binary data human-readable"
arch=('any')
url="https://metacpan.org/release/${_perlmod}"
license=('PerlArtistic')
depends=('perl')
checkdepends=()
#checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
_verwatch=("http://www.cpan.org/modules/by-module/${_modnamespace}/" "${_perlmod}-\([0-9\.]*\)\.tar\.gz" 'l')
_srcdir="${_perlmod}-${pkgver}"
#source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/${_perlmod}-${pkgver}.tar.gz")
source=("${_verwatch[0]}${_perlmod}-${pkgver}.tar.gz")
md5sums=('5a340e5ef7a41387f00dbfabf6c366ba')
sha256sums=('f9243cbe8affed5045fe4df505726a7a7289471e30c51ac065b3ed6ce0d1a604')

build() {
  set -u
  cd "${_srcdir}"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor'
  make
  set +u
}

if [ "${#checkdepends[@]}" -ne 0 ]; then
check() {
  set -u
  cd "${_srcdir}"
  make test
  set +u
}
fi

package() {
  set -u
  cd "${_srcdir}"
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" '(' -name '.packlist' -o -name '*.pod' ')' -delete
  set +u
}
set +u
