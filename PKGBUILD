# Maintainer: Max Harmathy <harmathy@secure.mailbox.org>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.50.nmu2
_pkgver=1.50+nmu2
pkgrel=2
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
sha256sums=('4b6c801bd6bd72a93b37e040ecef9113728016ba3baa35be2f8736c3d725c06c'
            '561230b404e8b43c48c67f9eb271b44afb71f748911101a0d2ef745a7d8f2640')
b2sums=('4439219b3f402681e693e20d7ae4efd6a3e390332203286c0b0b6878daba13d71f4e86e0e0002eff4272c577a7dbcfc7740ac8a47b62ea4fce4117efa7faa57c'
        '19f2afeb860c432f459c579b5eb56d3a8c64ea51c1d2e00913e989282d273bdd4938edb7963e0d8b44d73a75f9912d6ce44f953dd12a678ffe5d6d396ec9b34d')


prepare() {
  cd "$srcdir/$pkgname-$_pkgver"

  patch -p1 < "$startdir/remove-sys-cpuaffinity-dep.patch"
}

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}


check() {
  cd "$srcdir/$pkgname-$_pkgver"

  make test
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"

  make install "DESTDIR=$pkgdir" PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d "$pkgdir/usr/share/doc/pristine-tar"
  install -D GPL TODO delta-format.txt "$pkgdir/usr/share/doc/pristine-tar"
  install -D -t "$pkgdir/usr/share/bash-completion/completions" bash_completion/pristine-tar
}

# vim:set ts=2 sw=2 et:
