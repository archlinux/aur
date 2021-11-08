# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
pkgname=perl-wx
pkgver=0.9932
pkgrel=3
pkgdesc="Interface to the wxWidgets cross-platform GUI toolkit"
arch=('x86_64')
url="https://metacpan.org/dist/Wx"
license=('GPL' 'PerlArtistic')
depends=('perl-alien-wxwidgets' 'perl-extutils-xspp' 'wxgtk2')
checkdepends=('xorg-server-xvfb')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MD/MDOOTSON/Wx-$pkgver.tar.gz")
sha256sums=('1cfdb6535a0f4676e6f1aab2c9d8e16d577be3eb3b7cc04c8074d685e6651b70')

build(){
  cd "Wx-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL \
    --wx-unicode \
    --wx-version=$(wx-config --version | cut -d . -f 1-2) \
    --wx-toolkit=gtk2 \
    INSTALLDIRS=vendor
  make
}
check(){
  cd "Wx-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  if [[ -z "$DISPLAY" || -x /usr/bin/xvfb-run ]]; then
#     warning 'Empty $DISPLAY - falling back to xvfb-run (xorg-server-xvfb)'
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
  else
    make test
  fi
}
package(){
  cd "Wx-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make DESTDIR="$pkgdir" install
}
