# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

_distname='Parallel-Scoreboard'
pkgname='perl-parallel-scoreboard'
pkgver='0.08'
pkgrel='2'
pkgdesc="a scoreboard for monitoring status of many workers"
arch=('any')
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl-class-accessor-lite' 'perl-html-parser' 'perl-json')
makedepends=('perl-module-install')
checkdepends=('perl-test-simple' 'perl-test-warn')
url="https://search.cpan.org/dist/${_distname}"
_licensefilename_SPDX_GPL1='GPL-1.0-or-later.txt'
_licensefilename_SPDX_PerlArtistic='Artistic-1.0-Perl.txt'
source=("https://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/${_distname}-${pkgver}.tar.gz"
        "${_distname}-LICENSE-${_licensefilename_SPDX_GPL1}::https://raw.githubusercontent.com/Perl/perl5/perl-5.10.0/Copying")
b2sums=('c923e6d56f09a689540c9884d256f3ca054aeb1ed50fd7490ea636859fec31aefeaf4f8e565970594901c2c29ad4a238fba6ee221a72d738ab33502c85ea313e'
        '6381e7c09a2ddc4dcf237096fea3b0072fdd7b8c506270041a231af9d8d72d30d57e804e5d6c66d5b915023e185ee537edef8ca346dce4a88bce78d42fe4dce3')

prepare() {
  cd "${srcdir}/${_distname}-${pkgver}"

  echo "Removing source-vendored, outdated Test::More and Test::Warn pods..."
  rm --verbose --force --recursive ./inc/Test/
  sed -e '/^inc\/Test\//d' -i MANIFEST

  echo "Preparing license resources..."
  sed -n '/^LICENSE$/,$p' README > LICENSE.txt
  cp --verbose "../${_distname}-LICENSE-${_licensefilename_SPDX_GPL1}" "LICENSE-${_licensefilename_SPDX_GPL1}"
  ln --verbose --symbolic --no-target-directory "/usr/share/licenses/spdx/${_licensefilename_SPDX_PerlArtistic}" "LICENSE-${_licensefilename_SPDX_PerlArtistic}"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_distname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  make install

  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete

  install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
