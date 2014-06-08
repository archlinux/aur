# Contributor: Swift Geek <swifgeek at google>
# Contributor: olasd
# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=slic3r
pkgver=1.1.3
pkgrel=1
pkgdesc="Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge."
arch=('any')
url="http://slic3r.org/"
license=('GPL')
depends=('perl' 'perl-moo' 'perl-boost-geometry-utils'
				 'perl-math-clipper' 'perl-math-convexhull'
				 'perl-math-geometry-voronoi' 'perl-math-planepath'
				 'perl-math-convexhull-monotonechain' 'perl-io-stringy'
				 'perl-encode-locale' 'perl-extutils-makemaker-aur>=6.82'
				 'perl-extutils-parsexs-aur' 'perl-extutils-typemap')
optdepends=('perl-wx: GUI support'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-wx-glcanvas: support for opengl preview' 
            'perl-opengl: support for opengl preview'
            'perl-class-xsaccessor: creating faster accessor methods')
#             'perl-growl-gntp: notifications support via growl'
provides=('slic3r')
conflicts=('slic3r-git')
#Consider uncommenting line below in case of false negative test results ;)
#BUILDENV+=('!check')
source=("https://github.com/alexrj/Slic3r/archive/$pkgver.tar.gz"
				'slic3r.desktop'
				'slic3r')
md5sums=('c88fde7213e4727353ec65afa4a712b4'
         'cf0130330574a13b4372beb8f241d71e'
         'a30a96504f11c95956dd8ce645b77504')

prepare() {
  export _src_dir="$srcdir/Slic3r-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  export SLIC3R_NO_AUTO="true"

	cd "$_src_dir"
  # Nasty fix for useless Growl dependency ... please post in comment real fix, if u know one ;)
#  sed -i "s/        'Growl/\#&/" Build.PL
  sed -i '/Growl/d' Build.PL

  # Nasty fix for useless warning
  sed -i '/^warn \"Running Slic3r under Perl/,+1 s/^/\#/' ./lib/Slic3r.pm
}

build() {
  cd "$_src_dir/xs"
  warning " ⚠  DO NOT respond to any question with 'yes'. Report a bug in comment instead.\n"
  warning "Running Slic3r under Perl >= 5.16 is not supported nor recommended\nIn case of related to this issues please use ARM repository to get older perl package\n"
  # Cuz cpan will install fixes to $HOME ... which is not the point of this package

  # slic3r-xs Build stage
  msg2 "Building Slic3r::XS (1/3)"
  /usr/bin/perl Build.PL
  ./Build

}

check () {
  cd "$_src_dir"

  msg2 "Testing Slic3r::XS - (2/3)"
  prove -Ixs/blib/arch -Ixs/blib/lib/ xs/t/

  msg2 "Testing Slic3r (3/3)"
  prove -Ixs/blib/arch -Ixs/blib/lib/ t/
}

package () {
  cd "$_src_dir"
  install -d $pkgdir/usr/share/perl5/vendor_perl/
  cp -R $srcdir/Slic3r-$pkgver/lib/* $pkgdir/usr/share/perl5/vendor_perl/

  install -d $pkgdir/usr/bin/vendor_perl/
  install -m 755 $srcdir/Slic3r-$pkgver/slic3r.pl $pkgdir/usr/bin/vendor_perl/

  #TODO : Do something about utils ! (we let swiftgeek fix this)
  #install -m 755 $srcdir/Slic3r-$pkgver/utils/*.pl $pkgdir/usr/bin/
  #install -m 755 $srcdir/Slic3r-$pkgver/utils/post-processing/*.pl $pkgdir/usr/bin/

  # ZSH autocompletion
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "$srcdir/Slic3r-$pkgver/utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_slic3r.zsh"

  # Icons " current Build.PL is not really geared for installation "
  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 $srcdir/Slic3r-$pkgver/var/*  $pkgdir/usr/bin/vendor_perl/var/

  # Desktop icon
  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/

  ### SLIC3R-XS MERGE
  cd "$_src_dir/xs"
  ./Build install

  # Just to have a more sane bin name also, and automagically fix perl LANG
  # problems. Might be fixed now https://github.com/alexrj/Slic3r/pull/1510
  install -m 755 $srcdir/slic3r $pkgdir/usr/bin/
}

