# Maintainer: Edoardo Rosa <edoardo dot rosa90 at gmail dot com>

# RegRipper 
pkgname=regripper-git
pkgver=r93.b0e12c4
pkgrel=1
pkgdesc="RegRipper is an open source forensic software used as a Windows Registry data extraction command line or GUI tool."
arch=('any')
url="https://github.com/keydet89/RegRipper2.8"
depends=('perl' 'perl-parse-registry')
makedepends=('git')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/keydet89/RegRipper2.8.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (set -o pipefail
   git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
   echo $pkg
}

build() {
  cd "$pkgname"
  # Remove windows perl shebang
  tail -n +2 rip.pl > regripper
  # Clean windows ^M new lines
  sed -i $'s/\r$//' regripper
  # Add your Linux perl shebang
  sed -i "1i #!$(which perl)" regripper
  sed -i '2i use lib qw(/usr/local/lib/rip-lib/lib/perl5/);' regripper
}

package() {
  install -p -dm 755 "$pkgdir/usr/bin/"
  install -p -m 755 "$pkgname/regripper" "$pkgdir/usr/bin/"
}

#build() {
#  cd "$srcdir/$_dist-$pkgver"
#
#  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
#    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
#    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
#    MODULEBUILDRC=/dev/null
#
#  /usr/bin/perl Makefile.PL
#  make
#}
#
#check() {
#  cd "$srcdir/$_dist-$pkgver"
#
#  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#  export PERL_MM_USE_DEFAULT=1
#
#  make test
#}
#
#package() {
#  cd "$srcdir/$_dist-$pkgver"
#
#  unset INSTALLDIRS DESTDIR PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#  
#  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
#}
