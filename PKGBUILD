# Maintainer: Oleg Plakhotniuk <olegus8 at gmail>
# Contributor: Jerome Rose <jrose.pub at gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=stackless-python2
pkgver=2.7.9
pkgrel=1
pkgdesc="Python is a high-level scripting language. Stackless is an experimental implementation that supports continuations, generators, microthreads, and coroutines."
arch=('i686' 'x86_64')
url="http://www.stackless.com"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'openssl' 'zlib')
makedepends=('python2')
optdepends=('tk: for tkinter')
conflicts=('python2')
provides=('python2=2.7.9')
license=('python')
source="http://www.stackless.com/binaries/stackless-${pkgver//./}-export.tar.xz"
md5sums=('35307558796389aa51d96b0bc83f6f6f')

build() {
  cd "$srcdir/stackless-${pkgver//./}-export"

  grep -rl "env python" . | xargs \
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|'

  ./configure \
    --prefix=/usr \
    --with-threads \
    --enable-shared \
    --enable-unicode=ucs4 \
    --enable-stacklessfewerregisters

  make
}

package() {
  cd "$srcdir/stackless-${pkgver//./}-export"
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir/usr/bin"
  
  # clean up link names to match the offical python2 package
  rm python
  rm python-config
  mv 2to3 2to3-2.7
  mv idle idle2
  mv pydoc pydoc2
  
  # remove conflicting link 
  rm "$pkgdir/usr/share/man/man1/python.1"
  
  # remove smtpd.py file from /usr/bin
  rm smtpd.py
  
}
