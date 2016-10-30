# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

_pkgname=slic3r
pkgname=${_pkgname}-prusa3d
pkgver=1.31.1
pkgrel=1
pkgdesc="Updated Slic3r by Prusa3D with many bugfixes and new features"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="http://www.prusa3d.com/"
license=('GPL')
depends=('perl'
         'perl-moo' 'perl-math-clipper' 'perl-math-convexhull' 'perl-math-geometry-voronoi' 'perl-math-planepath' 'perl-math-convexhull-monotonechain' 'perl-io-stringy' 'perl-encode-locale' 'perl-extutils-makemaker-aur>=6.82' 'perl-threads-aur>=1.96' 'perl-extutils-parsexs>=3.22' 'boost')
makedepends=('git' 'perl-module-build-withxspp' 'perl-module-build' 'perl-devel-checklib')
optdepends=('perl-wx: GUI support'
            'perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-wx-glcanvas: support for opengl preview'
            'perl-opengl: support for opengl preview'
            'perl-net-bonjour: support for autodiscovery of printers on network (octoprint)'
            'perl-class-xsaccessor: creating faster accessor methods')
provides=('slic3r')
conflicts=('slic3r' 'slic3r-git' 'slic3r-xs' 'slic3r-xs-git')
source=("https://github.com/prusa3d/Slic3r/archive/version_${pkgver}.tar.gz"
        'slic3r.desktop')
md5sums=('7a553d7563971197a0e4509f4374f12a'
         '1b561afff48c79f86889664375d179ed')

prepare() {
  cd "${srcdir}/Slic3r-version_${pkgver}/xs"
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    perl Build.PL
}

build() {
  cd "${srcdir}/Slic3r-version_${pkgver}/xs"
  CFLAGS+=' -std=c++11'
  perl Build
}

check () {
  cd "${srcdir}/Slic3r-version_${pkgver}"
  prove -Ixs/blib/arch -Ixs/blib/lib/ xs/t/
  prove -Ixs/blib/arch -Ixs/blib/lib/ t/
}

package () {
  cd "${srcdir}/Slic3r-version_${pkgver}"
  install -d $pkgdir/usr/share/perl5/vendor_perl/
  cp -R lib/* $pkgdir/usr/share/perl5/vendor_perl/

  install -d $pkgdir/usr/bin/vendor_perl/
  install -m 755 slic3r.pl $pkgdir/usr/bin/vendor_perl/

  # ZSH autocompletion
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_slic3r.zsh"

  # Icons " current Build.PL is not really geared for installation "
  install -d $pkgdir/usr/bin/vendor_perl/var
  install -m 644 var/*  $pkgdir/usr/bin/vendor_perl/var/

  # Desktop icon
  install -d $pkgdir/usr/share/applications
  install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/

  ### SLIC3R-XS MERGE
  cd xs
  ./Build install
}

