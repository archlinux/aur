# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Billy Congo <billycongo@gmail.com>
# Contributor: froggie <sullivanva@gmail.com>
# Contributor: Lukas Martini <hello@lutoma.org>

set -u
_pkgnameu='MHonArc'
pkgname="${_pkgnameu,,}"
pkgver='2.6.24'
pkgrel='1'
pkgdesc='a Perl mail-to-HTML converter'
arch=('any')
url='https://www.mhonarc.org/'
_giturl='https://github.com/sympa-community/MHonArc'
license=('GPL-2.0-only')
depends=('perl>=5.6.1')
optdepends=(
  'perl-digest-perl-md5: creating IDs for messages without message-ids.'
  'perl-file-temp: more secure temp file management'
  'perl-mime-base64: efficient base64 decoding'
  'perl-posix-strftime-compiler: improved time string formatting'
)
#_verwatch=("${url}release/${_pkgnameu}/tar/" "${_pkgnameu}-\([^-]*\)\.tar\.bz2" 'l')
#_verwatch=("${url}" "${_pkgnameu}-\([0-9\.]\+\)\.tar\.bz2" 't')
_srcdir="${_pkgnameu}-${pkgver}"
source=(
  "${_srcdir}.tar.gz::${_giturl}/archive/refs/tags/${pkgver}.tar.gz"
)
# New upstream https://metacpan.org/release/MHonArc

md5sums=('ac9243a0d8b6430d92e79f048d635b8e')
sha256sums=('8d1645b79a5c3fef8d13f7a82b3b680166794aaab7b6822a2313d9fb34d97af1')

prepare() {
  set -u
  cd "${_srcdir}"
  #patch -f -p1 < "${srcdir}/Debian_816638.diff"
  PERL_MM_USE_DEFAULT=1 \
  perl 'Makefile.PL' INSTALLDIRS='site' PREFIX='/usr'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  nice make
  set +u
}

package() {
  set -u
  cd "MHonArc-${pkgver}"
  make install PREFIX="${pkgdir}/usr"

  mv "${pkgdir}/usr/bin/site_perl"/* "${pkgdir}/usr/bin"
  rmdir "${pkgdir}/usr/bin/site_perl"

  # move /usr/doc to /usr/share/doc for FHS-compliance.
  #mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  # remove perllocal.pod and .packlist (these don't seem to exist any more)
  find "${pkgdir}" -name 'perllocal.pod' -delete
  find "${pkgdir}" -name '.packlist' -delete
  set +u
}
set +u
