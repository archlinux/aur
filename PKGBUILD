# Maintainer: James An <james@jamesan.ca>

_pkgbase=zinnia
pkgbase=$_pkgbase-git
pkgname=("$pkgbase" "$_pkgbase-perl-git" "$_pkgbase-python-git" "$_pkgbase-ruby-git")
pkgver=0.07
pkgrel=1
pkgdescs='Simple, customizable and portable online hand recognition system based on Support Vector Machines'
arch=('i686' 'x86_64')
url='http://taku910.github.io/$_pkgbase'
license=('BSD')
options=('!makeflags')
source=("https://github.com/taku910/$_pkgbase/archive/master.tar.gz")
sha256sums=('0a3df9d3fd339445a8c9a172de6ead950c36276929f53f8eec1f9b846494dfef')

prepare() {
  cd "$_pkgbase-master/$_pkgbase"

  # Clear generated files as they're outdated (made with a libtool version, Debian-2.2.6b-2ubuntu1).
  make maintainer-clean
  rm -rf aclocal.m4 m4 autom4te.cache configure Makefile.in config.h config.h.in config.status libtool ltmain.sh

  # Re-create generated files for zinnia-git.
  aclocal
  libtoolize --force
  autoheader
  automake --add-missing
  autoreconf

  pushd ruby
  [ -f Makefile ] && make distclean
  ruby extconf.rb
  popd
}

build() {
  cd "$_pkgbase-master/$_pkgbase"

  ./configure --prefix=/usr
  make

  # Refresh language binding generated files
  ( cd swig && make )

  # Build zinnia-perl-git
  pushd perl
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
  popd

  # Build zinnia-python-git
  pushd python
  python2 setup.py build
  popd

  # Build zinnia-ruby-git
  pushd ruby
  make
  popd
}

#~ check() (
  #~ cd "$_pkgbase-master/$_pkgbase/perl"
  #~ unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  #~ export PERL_MM_USE_DEFAULT=1
  #~ make test
#~ )

package_zinnia-perl-git() {
  _pkgname="$_pkgbase-perl"
  pkgdesc="$pkgdescs, Perl bindings"
  depends=('perl' "$_pkgbase>=0.07")
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")
  options=('!emptydirs' 'purge')

  cd "$_pkgbase-master/$_pkgbase/perl"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

package_zinnia-python-git() {
  _pkgname="$_pkgbase-python"
  pkgdesc="$pkgdescs, Python bindings"
  depends=('python2' "$_pkgbase>=0.07")
  makedepends=('python2-setuptools')
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")
  options=(!emptydirs)

  cd "$_pkgbase-master/$_pkgbase/python"
  python2 setup.py install --prefix=$pkgdir/usr --optimize=1
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_zinnia-ruby-git() {
  _pkgname="$_pkgbase-ruby"
  pkgdesc="$pkgdescs, Ruby bindings"
  depends=('ruby' "$_pkgbase>=0.07")
  provides=("$_pkgname=$pkgver")
  conflicts=("$_pkgname")
  options=('!emptydirs' 'purge')

  cd "$_pkgbase-master/$_pkgbase/ruby"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_zinnia-git() {
  makedepends=('doxygen')
  provides=("$_pkgbase=$pkgver")
  conflicts=("$_pkgbase")

  cd "$_pkgbase-master/$_pkgbase"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Installing documentation
  for file in AUTHORS COPYING ChangeLog; do
    install -Dm644 $file "$pkgdir/usr/share/doc/$pkgname/$file"
  done
  cp --archive doc/doxygen "$pkgdir/usr/share/doc/$pkgname/html"
}
