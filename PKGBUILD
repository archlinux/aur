# Maintainer: a821
# Contributor: sudokode <sudokode.gmail.com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Matt Parnell <parwok aatt gmail ddoott ccoomm>
# Contributor: Ronald van Haren <ronald.archlinux.org> 
# Contributor: judd <jvinet@zeroflux.org>

pkgname="e2fsprogs-git"
pkgver=1.47.0.r14.ge76886f7
pkgrel=1
pkgdesc="Ext2/3/4 filesystem utilities (git)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'MIT')
url="https://e2fsprogs.sourceforge.net"
depends=('sh' 'util-linux-libs' 'fuse2')
makedepends=('git' 'util-linux' 'systemd')
optdepends=('lvm2: for e2scrub'
            'util-linux: for e2scrub'
            'smtp-forwarder: for e2scrub_fail script')
conflicts=('e2fsprogs' 'fuse2fs')
provides=('e2fsprogs' 'fuse2fs'
          'libcom_err.so'
          'libe2p.so'
          'libext2fs.so'
          'libss.so')
backup=('etc/mke2fs.conf'
        'etc/e2scrub.conf')
source=("$pkgname::git+https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
        'MIT-LICENSE')
sha256sums=('SKIP'
            'cc45386c1d71f438ad648fd7971e49e3074ad9dbacf9dd3a5b4cb61fd294ecbb')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
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
              --enable-blkid-debug \
              --enable-verbose-makecmds \
              --enable-e2initrd-helper
              #--enable-jbd-debug  # this likes to break the build

  make

  # regenerate locale files
  find po/ -name '*.gmo' -delete
  make -C po update-gmo
}

package() {
  unset MAKEFLAGS
  cd $pkgname

  make DESTDIR="$pkgdir" install install-libs

  sed -i 's/^AWK=.*/AWK=awk/' "$pkgdir"/usr/bin/{compile_et,mk_cmds}

  # remove references to build directory
  sed -i 's#^SS_DIR=.*#SS_DIR="/usr/share/ss"#' "$pkgdir/usr/bin/mk_cmds"
  sed -i 's#^ET_DIR=.*#ET_DIR="/usr/share/et"#' "$pkgdir/usr/bin/compile_et"

  # remove static libraries with a shared counterpart
  rm "$pkgdir"/usr/lib/lib{com_err,e2p,ext2fs,ss}.a

  # install MIT license
  install -Dm644 "$srcdir"/MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"

}

# vim:set ts=2 sw=2 et:
