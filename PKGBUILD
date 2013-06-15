# Maintainer: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r-git
pkgver=0
pkgrel=7
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-boost-geometry-utils' 'perl-math-clipper' 'perl-math-convexhull' 'perl-math-geometry-voronoi' 'perl-math-planepath' 'perl-math-convexhull-monotonechain' 'perl-io-stringy' 'perl-encode-locale')
makedepends=('git')
optdepends=('perl-wx: GUI support'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-class-xsaccessor: creating faster accessor methods')
#             'perl-growl-gntp: notifications support via growl'
provides=('slic3r')
conflicts=('slic3r')
#Consider uncommenting line below in case of false negative test results ;)
#BUILDENV+=('!check')
source=('slic3r.desktop')
md5sums=('1b561afff48c79f86889664375d179ed')

_gitroot="git://github.com/alexrj/Slic3r"
_gitname="Slic3r"

prepare() {
  export _src_dir="$srcdir/$_gitname-build"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  export SLIC3R_NO_AUTO="true"

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
    #TODO: check if it's the same origin
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Nasty fix for useless Growl dependency ... please post in comment real fix, if u know one ;)
  sed -i "s/        'Growl/\#&/" Build.PL

  # Nasty fix for useless warning
  sed -i '/^warn \"Running Slic3r under Perl/,+1 s/^/\#/' ./lib/Slic3r.pm

  # Workaround shitload of issue via setting LC_ALL=C ... workaround that doesn't work :<
  #sed -i '1s"^#!.\+$"#!/usr/bin/env LC_ALL=C /usr/bin/perl"' ./slic3r.pl

  # Why true? cuz pacman is crazy... and it still doesn't work as intended
  true && pkgver="$(awk 'BEGIN{FS="\""}/VERSION/{gsub(/-dev/,"",$2); print $2 }' ./lib/Slic3r.pm).$(git rev-parse --short HEAD)"
  export _pkgver="$pkgver"
  msg2 "Fetched $_pkgver"
}

build() {
  cd "$_src_dir"
  warning " ⚠  DO NOT respond to any question with 'yes'. Report a bug in comment instead.\n"
  warning "Running Slic3r under Perl >= 5.16 is not supported nor recommended\nIn case of related to this issues please use ARM repository to get older perl package\n"
  # Cuz cpan will install fixes to $HOME ... which is not the point of this package

  # Build stage
  /usr/bin/perl Build.PL
  ./Build

}

check () {
  cd "$_src_dir"
  ./Build test
}

package () {
  cd "$srcdir/$_gitname-build"
  ./Build install

  # Icons " current Build.PL is not really geared for installation "
  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 $srcdir/$_gitname-build/var/*  $pkgdir/usr/bin/vendor_perl/var/

  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/

  # Why double? 1st one was just for messages, this one is for real
  true && pkgver=$_pkgver
}

