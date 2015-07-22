# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-opengl'
pkgver='0.6704'
pkgrel='2'
pkgdesc="Interface to OpenGL drawing/imaging library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'freeglut>=2.8.1' 'glu>=9.0.0')
[ -z "$DISPLAY" ] && makedepends+=('xorg-server-xvfb')
url='https://metacpan.org/release/OpenGL/'
source=("https://cpan.metacpan.org/authors/id/C/CH/CHM/OpenGL-${pkgver}.tar.gz" \
        'OpenGL-0.6704-Delete-functions-removed-from-Mesa.patch::http://pkgs.fedoraproject.org/cgit/perl-OpenGL.git/plain/OpenGL-0.6704-Delete-functions-removed-from-Mesa.patch?id=7498635332872268a0d4519723b44725e9a496dc')
md5sums=('433e4f197d7200c219494a8604f3e06b'
         '75ecc0b0751503fdc2fbad1301e9a1f4')
_distdir="OpenGL-$pkgver"

prepare() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  # Patch for newer mesa
  cd "$srcdir/$_distdir"
  patch -p1 < "$srcdir"'/OpenGL-0.6704-Delete-functions-removed-from-Mesa.patch'
}

build() {
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

