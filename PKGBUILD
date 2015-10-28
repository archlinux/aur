# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=media-build-dvbsky
pkgver=20151028
pkgrel=1
pkgdesc="Driver for DVBSky cards/boxes"
arch=('i686' 'x86_64')
url="http://www.dvbsky.net/Support_linux.html"
license=('GPL2')
depends=('dvbsky-firmware')
makedepends=('linux-headers' 'perl-proc-processtable')
conflicts=('dvbsky-dvb-drivers')
replaces=('dvbsky-dvb-drivers')
install="$pkgname.install"
source=("http://www.dvbsky.net/download/linux/media_build-bst-151028.tar.gz"
        'add_c2800e.patch')
sha256sums=('48a8726c6799025be06bc5b8bafa8449ca02abf8fe578e805f91707a5edf1e52'
            'bdb4cb06418cb2e36eb3219b4d4be329d5297db1704e6e3ef0c73dd6bb9721f1')

prepare() {
  cd "$srcdir/media_build-bst"
  ln -sr v4l/sit2_op.o.x${CARCH: -2} v4l/sit2_op.o
  cp v4l/sit2_mod.dvb linux/drivers/media/dvb-frontends/sit2_mod.c
  sed -i '/depmod/d' v4l/Makefile v4l/scripts/make_makefile.pl
  patch -p1 -i ../add_c2800e.patch

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
