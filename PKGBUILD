# Maintainer: Jon Ribeiro <contact@jonathas.com>
pkgname=perl-class-adapter
_realname=Class-Adapter
pkgver=1.08
pkgrel=1
pkgdesc="Perl implementation of the \"Adapter\" Design Pattern"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~adamk/Class-Adapter"
options=(!emptydirs)

depends=('perl>=5.10.1')
makedepends=('perl')

#provides=('Class-Adapter')
provides=('class-adapter=1.08' 'Class::Adapter::Clear=1.08' 'perl-class-adapter-clear=1.08' 'Class::Adapter=1.08' 'perl-class-adapter=1.08' 'Class::Adapter::Builder=1.08' 'perl-class-adapter-builder=1.08')

source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Adapter-1.08.tar.gz')
md5sums=('4a1dbb281eac71f666d2eeccf4cc8b99')

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


