# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: kamu <mr.kamu@gmail.com>
pkgname=ruby-svn
pkgver=39745
pkgrel=1
pkgdesc="A dynamic, open source programming language with a focus on simplicity and productivity."
arch=('i686' 'x86_64')
url="http://www.ruby-lang.org/en/"
license="Ruby"
depends=('glibc' 'gdbm' 'db' 'openssl' 'zlib' 'readline')
makedepends=('subversion' 'autoconf')
# this installs with a suffix (no conflict)
#conflicts=('ruby')
#provides=('ruby=2.1.0dev')
source=()
md5sums=()

_svntrunk="http://svn.ruby-lang.org/repos/ruby/trunk/"
_svnmod="ruby"
_suffix="-svn"
_version="svn"

build() {
  cd $startdir/src/
  if [ -d $_svnmod ]; then
    cd $_svnmod
    svn update --force -r $pkgver
  else
    svn co $_svntrunk $_svnmod
    cd $_svnmod
  fi
  autoconf

  ./configure --prefix=/usr --enable-shared --enable-pthread \
  --program-suffix=$_suffix --with-ruby-version=$_version \
  --with-soname=ruby$_suffix
  make || return 1
}

package() {
  cd $startdir/src/$_svnmod
  make DESTDIR=$pkgdir install || return 1
  make DESTDIR=$pkgdir install-doc || return 1
}

# vim:set ts=2 sw=2 et:
