# Contributor: swiftgeek
# Contributor: Eric Anderson <ejona86@gmail.com>
# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r
pkgver=0.9.3
pkgrel=2
_tagcommit=6bb4c28
pkgdesc="An STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge"
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-boost-geometry-utils' 'perl-math-clipper'
         'perl-math-convexhull' 'perl-math-geometry-voronoi'
         'perl-math-planepath')
optdepends=('perl-wx: GUI support'
            'perl-growl-gntp: notifications support via growl'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/alexrj/Slic3r/tarball/$pkgver"
    'slic3r.desktop')
md5sums=('5dde23662b7716bb403509891ea0971f'
         '80b52d89fe5d15ebe0c6aa2fe40fe9b5')

build() {
  mv "$srcdir/alexrj-Slic3r-$_tagcommit" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  export PERL_MM_USE_DEFAULT=0 PERL_AUTOINSTALL="--skipdeps" \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null SLIC3R_NO_AUTO=1

  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1

  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 var/* $pkgdir/usr/bin/vendor_perl/var/

  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/
}
