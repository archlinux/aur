# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

pkgname=perl-wx
pkgver=0.9927
_author=M/MD/MDOOTSON
_perlmod=Wx
pkgrel=3
pkgdesc="Wx - interface to the wxWidgets GUI toolkit"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Wx"
license=('GPL' 'PerlArtistic')
depends=(
wxgtk
)
makedepends=(
perl-alien-wxwidgets
perl-extutils-xspp
#ExtUtils::MakeMaker    => perl
#ExtUtils::ParseXS      => perl
#File::Spec::Functions  => perl
#Test::More             => perl
#Test::Harness          => perl
)
[ -z "$DISPLAY" ] && makedepends+=(xorg-server-xvfb)
provides=(
perl-wx-aui
perl-wx-app
perl-wx-artprovider
perl-wx-calendar
perl-wx-dnd
perl-wx-dataview
perl-wx-datetime
perl-wx-docview
perl-wx-dropsource
perl-wx-event
perl-wx-fs
perl-wx-grid
perl-wx-help
perl-wx-html
perl-wx-ipc
perl-wx-locale
perl-wx-mdi
perl-wx-media
perl-wx-menu
perl-wx-mini
perl-wx-overload-driver
perl-wx-overload-handle
perl-wx-perl-carp
perl-wx-perl-splashfast
perl-wx-perl-textvalidator
perl-wx-perltest
perl-wx-print
perl-wx-propertygrid
perl-wx-radiobox
perl-wx-ribbon
perl-wx-richtext
perl-wx-stc
perl-wx-socket
perl-wx-timer
perl-wx-webview
perl-wx-xrc
perl-wx-build-makemaker
perl-wx-build-makemaker-any_os
perl-wx-build-makemaker-any_wx_config
perl-wx-build-makemaker-core
perl-wx-build-makemaker-hacks
perl-wx-build-makemaker-macosx_gcc
perl-wx-build-makemaker-win32
perl-wx-build-makemaker-win32_msvc
perl-wx-build-makemaker-win32_mingw
perl-wx-build-options
perl-wx-build-utils
perl-build-wx-xsp-enum
perl-build-wx-xsp-event
perl-build-wx-xsp-overload
perl-build-wx-xsp-virtual
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('a174bd1b6a5558174697775be0ede2fb8260258d60bb6e116dfe6f56ac1d22bb')

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  if [ -z "$DISPLAY" ]; then
    warning 'Empty $DISPLAY - falling back to xvfb-run (xorg-server-xvfb)'
    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
  else
    make test
  fi
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  make install
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
