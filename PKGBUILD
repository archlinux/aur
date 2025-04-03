# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-opengl'
pkgver='0.7004'
pkgrel='2'
pkgdesc="Interface to OpenGL drawing/imaging library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'freeglut>=2.8.1' 'glu>=9.0.0')
[ -z "$DISPLAY" ] && makedepends+=('xorg-server-xvfb')
url='https://metacpan.org/release/OpenGL/'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/OpenGL-${pkgver}.tar.gz")
sha256sums=('38fc206b436f12ec53f6c468512fd19a2f232dbd089a215cc66c55a70bb38e2a')
_distdir="OpenGL-$pkgver"

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "$srcdir/$_distdir"
  if [ -z "$DISPLAY" ]; then
    warning "Empty \$DISPLAY - falling back to xvfb-run (xorg-server-xvfb)"
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" /usr/bin/perl Makefile.PL
  else
    /usr/bin/perl Makefile.PL
  fi
  make

}

check() {
  cd "$srcdir/$_distdir"
  echo "" > test.pl # Disable random X11 windows
  if [ -z "$DISPLAY" ]; then
    warning "Empty \$DISPLAY - falling back to xvfb-run (xorg-server-xvfb)"
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
  else
    make test
  fi
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

