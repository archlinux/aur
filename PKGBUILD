#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Gen2ly <toddrpartridge@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname="parted-git"
pkgver=3.2.r9.gf98f791
pkgrel=1
pkgdesc="A program for creating, destroying, resizing, checking, and copying partitions"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/parted/parted.html"
makedepends=('git' 'rsync' 'gperf' 'bc')
checkdepends=('valgrind' 'perl-digest-crc' 'python2')
depends=('device-mapper' 'util-linux' 'gettext' 'e2fsprogs' 'ncurses' 'readline')
optdepends=('reiserfsprogs: for reiserfs partitions')
conflicts=('parted')
provides=('parted')
options=(!libtool)
source=("$pkgname::git://git.savannah.gnu.org/parted.git"
        "gnulib-git::git://git.savannah.gnu.org/gnulib.git")
sha256sums=('SKIP' 'SKIP')
install="parted-git.install"

pkgver() {
  cd $pkgname

  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd $pkgname

  # Fix attempts to use python3 in make check
  sed -i 's/python/python2/' tests/t0282-gpt-move-backup.sh
  sed -i 's/python/python2/' tests/t0283-overlap-partitions.sh
}

build() {
  cd $pkgname

  # install -d "${srcdir}/${_gitname}_build/build-aux/" || true
  # install -D -m0755 "/usr/share/libtool/config/ltmain.sh" "${srcdir}/${_gitname}_build/build-aux/ltmain.sh"

  ./bootstrap --no-git --gnulib-srcdir="$srcdir"/gnulib-git

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/sbin \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --with-readline \
    --disable-silent-rules \
    --enable-mtrace \
    --enable-device-mapper \
    --enable-dynamic-loading \
    --enable-nls \
    --enable-debug \
    --enable-pc98

  make
}

check() {
  cd $pkgname

  ## Normal test-suite for 512 byte sectors
  make check

  ## Check whether test-suite works for 4K byte sectors - seems like already done by the top "make check" command
  #PARTED_SECTOR_SIZE="4096" CK_FORK="no" make check
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
