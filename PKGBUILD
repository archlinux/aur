#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Matt Parnell <parwok aatt gmail ddoott ccoomm>
# Contributor: Ronald van Haren <ronald.archlinux.org> 
# Contributor: judd <jvinet@zeroflux.org>

pkgname="e2fsprogs-git"
pkgver=1.42.12.r488.gad5d05d
pkgrel=1
pkgdesc="Ext2/3/4 filesystem utilities (git)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'MIT')
url="http://e2fsprogs.sourceforge.net"
groups=('base')
depends=('sh' 'util-linux')
makedepends=('git' 'bc')
conflicts=('e2fsprogs')
provides=('e2fsprogs')
backup=('etc/mke2fs.conf')
install=e2fsprogs.install
options=('staticlibs')
source=("$pkgname::git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
        'MIT-LICENSE')
sha256sums=('SKIP'
            'cc45386c1d71f438ad648fd7971e49e3074ad9dbacf9dd3a5b4cb61fd294ecbb')

pkgver() {
  cd $pkgname

  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd $pkgname

  # Remove unnecessary init.d directory
  sed -i '/init\.d/s|^|#|' misc/Makefile.in
}

build() {
  cd $pkgname

  ./configure --prefix=/usr \
              --with-root-prefix="" \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --enable-elf-shlibs \
              --disable-fsck \
              --disable-uuidd \
              --disable-libuuid \
              --disable-libblkid \
              --enable-compression \
              --enable-htree \
              --enable-blkid-debug \
              --enable-verbose-makecmds \
              --enable-e2initrd-helper \
              --enable-quota \
              --enable-libquota
              #--enable-jbd-debug  # this likes to break the build

  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install install-libs

  sed -i 's/^AWK=.*/AWK=awk/' "$pkgdir/usr/bin/compile_et"

  # remove references to build directory
  sed -i 's#^SS_DIR=.*#SS_DIR="/usr/share/ss"#' "$pkgdir/usr/bin/mk_cmds"
  sed -i 's#^ET_DIR=.*#ET_DIR="/usr/share/et"#' "$pkgdir/usr/bin/compile_et"

  # remove static libraries with a shared counterpart
  rm "$pkgdir"/usr/lib/lib{com_err,e2p,ext2fs,ss}.a

  # install MIT license
  install -Dm644 "$srcdir"/MIT-LICENSE "$pkgdir/usr/share/licenses/e2fsprogs/MIT-LICENSE"

  find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
