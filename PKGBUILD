# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
pkgname=perl-wx
pkgver=0.9932
pkgrel=4
pkgdesc="Interface to the wxWidgets cross-platform GUI toolkit"
arch=('x86_64')
url="https://metacpan.org/dist/Wx"
license=('GPL' 'PerlArtistic')
depends=('perl-alien-wxwidgets' 'perl-extutils-xspp' 'wxgtk3')
makedepends=('perl-module-build')
checkdepends=('xorg-server-xvfb')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MD/MDOOTSON/Wx-$pkgver.tar.gz")
sha256sums=('1cfdb6535a0f4676e6f1aab2c9d8e16d577be3eb3b7cc04c8074d685e6651b70')

build(){
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    WX_CONFIG=/usr/bin/wx-config-gtk3 \
    MODULEBUILDRC=/dev/null

  cd "Wx-$pkgver"
  perl Makefile.PL
  make
}
check(){
  cd "Wx-$pkgver"
  if [[ -z "$DISPLAY" || -x /usr/bin/xvfb-run ]]; then
#     warning 'Empty $DISPLAY - falling back to xvfb-run (xorg-server-xvfb)'
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
  else
    make test
  fi
}
package(){
  cd "Wx-$pkgver"
  make DESTDIR="$pkgdir" install
}
