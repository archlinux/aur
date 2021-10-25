# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gen2ly <toddrpartridge@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=parted-git
pkgver=3.4.r50.gb20227a
pkgrel=1
pkgdesc="A program for creating, destroying, resizing, checking and copying partitions"
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('device-mapper' 'util-linux-libs')
makedepends=('pkg-config' 'git' 'gperf' 'rsync')
conflicts=('parted')
provides=('parted')
source=("$pkgname::git+https://git.savannah.gnu.org/git/parted.git"
        "gnulib-git::git+https://git.savannah.gnu.org/git/gnulib.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}
 prepare() {
  cd $pkgname

  git submodule init
  git config submodule.gnulib.url "${srcdir}/gnulib-git"
  git submodule update
 }

build() {
  cd $pkgname
  ./bootstrap  --no-git --gnulib-srcdir=gnulib
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-rpath
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}
