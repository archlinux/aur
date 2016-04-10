# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Billy Congo <billycongo@gmail.com>
# Contributor: froggie <sullivanva@gmail.com>
# Contributor: Lukas Martini <hello@lutoma.org>

set -u
_pkgnameu='MHonArc'
pkgname="${_pkgnameu,,}"
pkgver='2.6.19'
pkgrel='2'
pkgdesc="a Perl mail-to-HTML converter"
arch=('any')
url='http://www.mhonarc.org/'
license=('GPL')
depends=('perl>=5.6.1')
optdepends=(
  'perl-digest-perl-md5: creating IDs for messages without message-ids.'
  'perl-file-temp: more secure temp file management'
  'perl-mime-base64: efficient base64 decoding'
  'perl-posix-strftime-compiler: improved time string formatting'
)
_verwatch=("${url}release/${_pkgnameu}/tar/" "${_pkgnameu}-\([^-]*\)\.tar\.bz2" 'l')
source=("${_verwatch[0]}${_pkgnameu}-${pkgver}.tar.bz2"
  'Debian_816638.diff::https://bugs.debian.org/cgi-bin/bugreport.cgi?filename=816638.diff;att=1;msg=17;bug=816638') # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=816638#17

sha256sums=('08912eae8323997b940b94817c83149d2ee3ed11d44f29b3ef4ed2a39de7f480'
            '76b1c608a971bd090a3a0eb60ff98f40a141fb7535763dde55c714b92f183eb6')

prepare() {
  set -u
  cd "MHonArc-${pkgver}"
  patch -f -p1 < "${srcdir}/Debian_816638.diff" || :
  PERL_MM_USE_DEFAULT=1 perl 'Makefile.PL' INSTALLDIRS='vendor' PREFIX="${pkgdir}/usr/"
  set +u
}

build() {
  set -u
  cd "MHonArc-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd "MHonArc-${pkgver}"
  make install

  # move /usr/doc to /usr/share/doc for FHS-compliance. 
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  # remove perllocal.pod and .packlist (these don't seem to exist any more)
  find "${pkgdir}" -name 'perllocal.pod' -delete
  find "${pkgdir}" -name '.packlist' -delete
  set +u
}
set +u
