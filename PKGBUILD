pkgname=slic3r-git
pkgver=20120623
pkgrel=1
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-wx')
makedepends=('git')
provides=('slic3r')
conflicts=('slic3r')

_gitroot="git://github.com/alexrj/Slic3r"
_gitname="Slic3r"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD stage
    export PERL_MM_USE_DEFAULT=0 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

 { /usr/bin/perl Build.PL &&
   ./Build &&
   ./Build test &&
   ./Build install; } || return 1

}

