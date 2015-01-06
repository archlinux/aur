# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-wx-glcanvas
pkgver=0.09
pkgrel=1
pkgdesc="Wx::GLCanvas - interface to wxWidgets' OpenGL canvas"
arch=('any')
url="http://search.cpan.org/~mbarbon/Wx-GLCanvas/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-wx')
makedepends=('perl-alien-wxwidgets')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/M/MB/MBARBON/Wx-GLCanvas-${pkgver}.tar.gz")
md5sums=('4f6475010bd6e4231e2dbb3fb52bc642')

prepare() {
  export _src_dir="$srcdir/Wx-GLCanvas-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  #TODO: how to reload PATH?
  if [[ "$PATH" != *"vendor_perl"* ]]; then
    warning "Fresh installation of perl detected, please relogin/reboot"
    source /etc/profile.d/perlbin.sh
  fi
  cd "$_src_dir"
  /usr/bin/perl Makefile.PL || true
  make
}

check () {
  cd "$_src_dir"
  warning "If tests do fail - uninstall this package before compiling"
  prove -Iblib/arch -Iblib/lib/ t/
}

package () {
  cd "$_src_dir"
  echo "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
