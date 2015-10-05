# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=media-build-dvbsky
pkgver=20150322
pkgrel=5
pkgdesc="Driver for DVBSky cards/boxes"
arch=('i686' 'x86_64')
url="http://www.dvbsky.net/Support_linux.html"
license=('GPL2')
depends=('dvbsky-firmware')
makedepends=('linux-headers' 'perl-proc-processtable')
conflicts=('dvbsky-dvb-drivers')
replaces=('dvbsky-dvb-drivers')
install="$pkgname.install"
source=("http://dvbsky.net/download/linux/media_build-bst-150322.tar.gz"
        'add_c2800e.patch'
        'dma_buf_export.patch')
sha256sums=('fd4acd06d2a4a5d5987393d68979aaf8832f5b21ae828ea6a50baca998cd89c7'
            'bdb4cb06418cb2e36eb3219b4d4be329d5297db1704e6e3ef0c73dd6bb9721f1'
            'da27997a54a1dd805c7177ccc930a86ae7d3042a46926f89109d2c692995329a')

#server doesn't like curl user agent
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

prepare() {
  cd "$srcdir/media_build-bst"
  ln -sr v4l/sit2_op.o.x${CARCH: -2} v4l/sit2_op.o
  cp v4l/sit2_mod.dvb linux/drivers/media/dvb-frontends/sit2_mod.c
  sed -i '/eth_rebuild_header/d' linux/drivers/media/dvb-core/dvb_net.c
  sed -i '/depmod/d' v4l/Makefile v4l/scripts/make_makefile.pl
  patch -p1 -i ../add_c2800e.patch
  patch -p1 -i ../dma_buf_export.patch

  export _kernver=$(</usr/lib/modules/extramodules-[0-9]\.+([0-9])-ARCH/version)
  sed -i "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/" "$startdir/$install"
}

build() {
  cd "$srcdir/media_build-bst"
  #media-build doesn't like parallel jobs
  make VER=$_kernver -j1
}

package() {
  cd "$srcdir/media_build-bst"
  make DESTDIR="$pkgdir" KDIR26="/usr/lib/modules/$_kernver/updates/kernel/drivers/media" media-install
  find "$pkgdir" -type f -name '*.ko' -exec gzip -9 {} \;
}
