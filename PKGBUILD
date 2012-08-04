pkgname=slic3r-git
pkgver=20120626
pkgrel=2
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-moo' 'perl-boost-geometry-utils' 'perl-math-clipper' 'perl-math-convexhull' 'perl-math-geometry-voronoi' 'perl-math-planepath')
makedepends=('git')
optdepends=('perl-wx: gui support'
            'perl-growl-gntp: notifcations support'
            'perl-net-dbus: ???')
provides=('slic3r')
conflicts=('slic3r')
source=('slic3r.desktop')
md5sums=('c997a07f658061d29b221cf7fd07ff97')

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

  # ENV for perl
  export PERL_MM_USE_DEFAULT=0 PERL_AUTOINSTALL="--skipdeps" \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
  MODULEBUILDRC=/dev/null SLIC3R_NO_AUTO=1

  # Nasty fix for useless Growl dependency ... please post in comment real fix, if u know one ;)
  # sed -i "s/        'Growl/\#&/" Build.PL

  msg "⚠  DO NOT respond to any question with 'yes'. Report a bug in comment instead."
  # Cuz cpan will install fixes to $HOME ... which is not the point of this package

  # Build stage
  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1

  # Icons " current Build.PL is not really geared for installation "
  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 $srcdir/$_gitname-build/var/*  $pkgdir/usr/bin/vendor_perl/var/

  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/

}

