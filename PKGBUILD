# Contributor: Swift Geek <swiftgeek «at» gmail.com>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=perl-alien-wxwidgets
pkgver=0.64
pkgrel=1
pkgdesc="building, finding and using wxWidgets binaries"
arch=('any')
url="http://search.cpan.org/dist/Alien-wxWidgets"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'wxgtk2.8' 'perl-module-pluggable') # Install perl-module-pluggable from AUR
makedepends=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MD/MDOOTSON/Alien-wxWidgets-${pkgver}.tar.gz")
md5sums=('12b6492a87cf165a4f0cd7254ccfab11')

prepare() {
  export _src_dir="$srcdir/Alien-wxWidgets-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  warning "If build stage tries to pull and compile WX - interrupt as resulting package wont work"
  warning "If package contains gtk2_3_0_0_uni_gcc_3_4.pm it is an improper package - do not attempt to install it - report in comments instead"

  # HAX HAX HAX - hax first in PATH to replace /usr/bin
  mkdir ${srcdir}/hax
  ln -s /usr/bin/wx-config-2.8 ${srcdir}/hax/wx-config
  export PATH="${srcdir}/hax:${PATH}"
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  cd "$_src_dir"
  make test
}

package () {
  cd "$_src_dir"
  echo "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
