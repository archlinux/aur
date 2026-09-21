# Maintainer: Max Harmathy <harmathy@secure.mailbox.org>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.50.nmu3
_pkgver=1.50+nmu3
pkgrel=1
pkgdesc="Tool to regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout."
arch=('i686' 'x86_64')
url="https://salsa.debian.org/debian/pristine-tar"
license=('GPL-2.0-or-later AND BSD-3-Clause')
depends=(
  pbzip2
  perl
  pixz
  xdelta
  xdelta3
  xz
)
conflicts=('pristine-tar-git')
checkdepends=('shunit2' 'diffoscope')
source=(
  "http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${_pkgver}.tar.xz"
  remove-sys-cpuaffinity-dep.patch
)
sha256sums=('bdd25f594ee551e8a860a5c5bfe974d5fc5636b0a2de565c392cfa84e7cd4bdb'
            '561230b404e8b43c48c67f9eb271b44afb71f748911101a0d2ef745a7d8f2640')
b2sums=('12723dae0ee260fab8205dca9f003b24aef437d6aeea106fe5615ae1cd825f2c75cbfd60a5c86d593116001955a906105f013f639e69ed01fd84d4a71af7d412'
        '19f2afeb860c432f459c579b5eb56d3a8c64ea51c1d2e00913e989282d273bdd4938edb7963e0d8b44d73a75f9912d6ce44f953dd12a678ffe5d6d396ec9b34d')


prepare() {
  cd "$srcdir/source"

  patch -p1 < "$startdir/remove-sys-cpuaffinity-dep.patch"
}

build() {
  cd "$srcdir/source"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}


check() {
  cd "$srcdir/source"

  make test
}

package() {
  cd "$srcdir/source"

  make install "DESTDIR=$pkgdir" PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d "$pkgdir/usr/share/doc/pristine-tar"
  install -D GPL TODO delta-format.txt "$pkgdir/usr/share/doc/pristine-tar"
  install -D -t "$pkgdir/usr/share/bash-completion/completions" bash_completion/pristine-tar
}

# vim:set ts=2 sw=2 et:
