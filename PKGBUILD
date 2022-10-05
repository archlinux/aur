# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-x11-xlib'
pkgver='0.23'
pkgrel='2'
pkgdesc="Low-level access to the X11 library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-try-tiny' 'libx11' 'libxtst' 'libxcomposite')
makedepends=('perl-devel-checklib' 'perl-extutils-depends')
checkdepends=('xorg-server-xvfb' 'xorg-server-xephyr')
url='https://metacpan.org/dist/X11-Xlib'
source=(https://cpan.metacpan.org/authors/id/N/NE/NERDVANA/X11-Xlib-$pkgver.tar.gz)
md5sums=('6ec3c6f20926f6cc0cd7ada700925ea5')
_distdir="X11-Xlib-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
