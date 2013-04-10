# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: kamu <mr.kamu@gmail.com>
pkgname=ruby-svn
pkgver=40220
pkgrel=1
pkgdesc="A dynamic, open source programming language with a focus on simplicity and productivity."
arch=('i686' 'x86_64')
url="http://www.ruby-lang.org/en/"
license=('BSD' 'custom')
depends=('openssl')
optdepends=('tk: for Ruby/TK')
makedepends=('subversion' 'autoconf' 'openssl')
# this installs with a suffix (no conflict)
#conflicts=('ruby')
#provides=('ruby=2.1.0dev')
source=('ruby::svn+http://svn.ruby-lang.org/repos/ruby/trunk')
md5sums=('SKIP')

_suffix="-svn"
_version="svn"

pkgver(){
  cd "$SRCDEST/ruby"
  svnversion
}

prepare(){
  # build wants to check for the revision of each file
  cp -a "$SRCDEST/ruby/.svn" "$srcdir/ruby/"
}

build() {
  cd "$srcdir/ruby"
  autoconf
  PKG_CONFIG=/usr/bin/pkg-config ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-pthread \
    --disable-rpath \
    --program-suffix=$_suffix \
    --with-ruby-version=$_version \
    --with-soname=ruby$_suffix
  make
}

check() {
  cd "$srcdir/ruby"
  #make check
}

package() {
  cd "$srcdir/ruby"
  make DESTDIR="$pkgdir" install-nodoc
  #make DESTDIR="$pkgdir" install-doc

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/ruby-svn/LICENSE"
  install -m644 BSDL "$pkgdir/usr/share/licenses/ruby-svn/"
}

# vim:set ts=2 sw=2 et:
