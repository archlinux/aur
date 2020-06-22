# Maintainer: Max Harmathy <max.harmathy@web.de>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=pristine-tar
pkgver=1.48
pkgrel=1
pkgdesc="Tool to regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout."
arch=('i686' 'x86_64')
url="https://salsa.debian.org/debian/pristine-tar"
license=('GPL')
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
sha256sums=('90317abf294f83176d57076037355f20a81c8bf0aefd9dbf2e9d4206cddc27e8'
            '0c7a2f1c941c7f3b9acb7219822ffda62df8beea5059f8ccc403a43d6cb83b52')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < "$startdir/remove-sys-cpuaffinity-dep.patch"

  export PATH=/usr/bin/core_perl:$PATH

  perl Makefile.PL
  make
}


check() {
  cd "$srcdir/$pkgname-$pkgver"

  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR=$pkgdir PREFIX=/usr INSTALLSITESCRIPT=/usr/bin
  install -d $pkgdir/usr/share/doc/pristine-tar
  install -D GPL TODO delta-format.txt $pkgdir/usr/share/doc/pristine-tar
  install -D -t $pkgdir/usr/share/bash-completion/completions bash_completion/pristine-tar
}

# vim:set ts=2 sw=2 et:
