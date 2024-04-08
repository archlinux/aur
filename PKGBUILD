# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.50
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
  http://ftp.debian.org/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver}.tar.xz
  remove-sys-cpuaffinity-dep.patch
)
sha256sums=('9a9790edddd2d5588da87cbc2dfd223dcd0967974c5b0bddf734d49ba85d7f6a'
            '0c7a2f1c941c7f3b9acb7219822ffda62df8beea5059f8ccc403a43d6cb83b52')
b2sums=('a10c16c6ee7e2473ae3f440746b1f6f6bcd8917cd4d6d2a7bae7e688f8af99cd371ec80d211e5103779dc6fd9b844a4945c3aef4cf3e9e9995bdf1c9fedef097'
        'f35e1f85124571eb32228be0ae0eca818b34d7b65f8b4fe0fdb8977558af60b36e9c9024db0c8113a244a0fa6c0630d52eadca001237e7a3263b949473278959')

build() {
  cd "$srcdir/work"

  patch -p1 < "$startdir/remove-sys-cpuaffinity-dep.patch"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}


check() {
  cd "$srcdir/work"

  make test
}

package() {
  cd "$srcdir/work"

  make install DESTDIR=$pkgdir PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d $pkgdir/usr/share/doc/pristine-tar
  install -D GPL TODO delta-format.txt $pkgdir/usr/share/doc/pristine-tar
  install -D -t $pkgdir/usr/share/bash-completion/completions bash_completion/pristine-tar
}

# vim:set ts=2 sw=2 et:
