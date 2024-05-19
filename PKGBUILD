# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=zarn
pkgver='0.0.9'
pkgrel='2'
pkgdesc="A lightweight static code security analysis for Modern Perl Applications"
arch=('any')
license=('MIT')
options=()
depends=('perl' 'perl-json' 'perl-file-find-rule' 'perl-yaml-tiny' 'perl-ppi')
makedepends=()
url='https://github.com/htrgouvea/zarn'
source=("https://github.com/htrgouvea/zarn/archive/refs/tags/$pkgver.tar.gz"
       'Makefile.PL' 'zarn.pl.patch')
sha512sums=('f9901eb94e8435b1688349eef1b1d06342090ad4eeeeb4a07faac20571761566a64343fa5829245f2e7b62d171d5c4fa20fdfe61439bba1eaf9a9c172cdfa76b'
	    '3630a13898eaebdf64858882819a74b9e98772898b48b0139775a3a28cd8b8b280aa84b1727518144558c148759029db4385d7d034a90311f3e4dbc09bc5ee53' '3454c0516e54c25a0c0ef8ae75c654eab0eb0d26b97a05f19668cda42bad31fd9f92711283736da44081b5e7f78036e993f9e17cc6ab46227a777d8baf2b66a6')
_distdir="$pkgname-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cp "$srcdir/Makefile.PL" "$srcdir/$_distdir/"
    cd "$srcdir/$_distdir"
    cp -r "rules" "lib/"
    patch -Np1 -i ../../zarn.pl.patch
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/perl5/vendor_perl/zarn.pl "$pkgdir/usr/bin/zarn"
}
