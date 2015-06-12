# $Id: PKGBUILD 142375 2011-11-08 22:04:23Z ronald $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=grub-legacy
_srcname=grub
pkgver=0.97
pkgrel=25
pkgdesc="A GNU multiboot boot loader"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grub/"
depends=('ncurses' 'diffutils' 'sed')
conflicts=('grub')
[ "$CARCH" = 'x86_64' ] && makedepends=('gcc-multilib')
optdepends=('xfsprogs: freezing of xfs /boot in install-grub script')
source=(ftp://alpha.gnu.org/gnu/grub/${_srcname}-${pkgver}.tar.gz
        menu.lst
        install-grub
        040_all_grub-0.96-nxstack.patch
        05-grub-0.97-initrdaddr.diff
        i2o.patch
        special-devices.patch
        more-raid.patch
        intelmac.patch
        grub-inode-size.patch
        ext4.patch
        grub-0.97-ldflags-objcopy-remove-build-id.patch
        automake-pkglib.patch)
backup=('boot/grub/menu.lst')
install=grub.install
sha1sums=('2580626c4579bd99336d3af4482c346c95dac4fb'
          '33d43d48000b2027f9baec8fc99d33e0c4500c96'
          '60e8f7e4c113b85165fd5d9cd724e8413a337a12'
          '157b81dbad3576536b08642242accfa1aeb093a9'
          'adbb4685c98797ffb4dc83561ec75698991dddbd'
          'f2e0dff29a7c8a45e90aa07298a1b2a9a9d29afc'
          'c5e2c94ed0e759590b9eb38c9d979f075d19d7c0'
          '45fe668a3779664fb292591f426976b6c784d6c8'
          '066d7ab1ae442f88e94c9e4f1867ac6682965d06'
          '0436aa6fa0b6f768289172f983a3f4b69384629e'
          'a36f34e51efed540f1ddafd78e9c9f6d83e4c8d4'
          '61c4b58d2eaa3c1561d8e9d8fc41341ce8882869'
          '776ed278eb8ff80e949834f763fad68b8741e7cd')

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # optimizations break the build -- disable them
  # adding special devices to grub, patches are from fedora
  patch -Np1 -i ../special-devices.patch
  patch -Np1 -i ../i2o.patch
  patch -Np1 -i ../more-raid.patch
  patch -Np1 -i ../intelmac.patch
  # Add support for bigger inode size to e2fs_stage1_5
  patch -Np1 -i ../grub-inode-size.patch
  # Add ext4 support
  # http://www.mail-archive.com/bug-grub@gnu.org/msg11458.html
  patch -Np1 -i ../ext4.patch
  # binutils fix
  patch -Np1 -i ../grub-0.97-ldflags-objcopy-remove-build-id.patch
  # "pkglib" is a reserved keyword in automake fix
  patch -Np1 -i ../automake-pkglib.patch

  sed -e'/^AC_PROG_CC/ a\AM_PROG_CC_C_O\ ' -i "${srcdir}/${_srcname}-${pkgver}/configure.ac"
  sed -e'/^AC_PROG_CC/ a\AM_PROG_AS\ ' -i "${srcdir}/${_srcname}-${pkgver}/configure.ac"

  ## recreate ./configure script with the required changes in LDFLAGS and objcopy
  aclocal
  autoconf
  autoreconf -i
  automake

  if [ "$CARCH" = "x86_64" ]; then
    # patch from gentoo for fixing a segfault
    patch -Np1 -i ../040_all_grub-0.96-nxstack.patch
    # patch from frugalware to make it boot when more than 2GB ram installed
    patch -Np1 -i ../05-grub-0.97-initrdaddr.diff
    CFLAGS="-static -fno-strict-aliasing" ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin \
                         --mandir=/usr/share/man --infodir=/usr/share/info
  else
    CFLAGS="-fno-strict-aliasing" ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin \
                --mandir=/usr/share/man --infodir=/usr/share/info
  fi
}

package() {
  cd ${srcdir}/${_srcname}-${pkgver}

  CFLAGS= make
  make DESTDIR=${pkgdir} install
  install -D -m644 ../menu.lst ${pkgdir}/boot/grub/menu.lst
  install -D -m755 ../install-grub ${pkgdir}/usr/bin/install-grub

}
