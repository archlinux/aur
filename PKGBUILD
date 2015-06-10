# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=perl-text-findindent
_realname=Text-FindIdent
pkgver=0.10
pkgrel=1
pkgdesc="'Heuristically determine the indent style'"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~smueller/Text-FindIndent"
options=(!emptydirs)

depends=('perl>=5.10.1')
makedepends=('perl')

#provides=('Text-FindIndent')
provides=('text-findindent=0.10' 'Text::FindIndent=0.10' 'perl-text-findindent=0.10')

source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Text-FindIndent-0.10.tar.gz')

md5sums=('765d619fc84e07b3c1e3ac6841e6a6b8')

package() {
  _expected_dir="${srcdir}/${_realname}-${pkgver}"
  if [ -d "$_expected_dir" ]; then
    cd "$_expected_dir"
  else
    _expected_dir="${srcdir}/$(bsdtar -t -f $(basename $source) | head -n1)"
    if [ -d "$_expected_dir" ]; then
      cd "$_expected_dir"
    else
      _makefile=$(find $srcdir -iname Makefile.PL)
      if [ ! -z "$_makefile" ]; then
        _expected_dir=$(dirname $_makefile)
        if [ -d "$_expected_dir" ]; then
          cd "$_expected_dir"
        else
          echo "[1;31mERROR[0m unable to detect source directory"
          echo "[1;34m-->[0m this is often due to CPAN's lack of standard naming conventions"
          echo "[1;34m-->[0m it may be possible to fix this by adjusting the build function in the PKGBUILD"
        fi
      fi
    fi
  fi
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


