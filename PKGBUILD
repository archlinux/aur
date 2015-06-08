# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=media-build-dvbsky
pkgver=20150322
pkgrel=2
pkgdesc="Driver for DVBSky cards/boxes"
arch=('i686' 'x86_64')
url="http://www.dvbsky.net/Support_linux.html"
license=('GPL2')
depends=('dvbsky-firmware')
makedepends=('linux-headers' 'perl-proc-processtable')
conflicts=('dvbsky-dvb-drivers')
replaces=('dvbsky-dvb-drivers')
install="${pkgname}.install"
source=("http://dvbsky.net/download/linux/media_build-bst-150322.tar.gz"
        'add_c2800e.patch')
sha256sums=('fd4acd06d2a4a5d5987393d68979aaf8832f5b21ae828ea6a50baca998cd89c7'
            '4a8b9dfc3e3d1a915c9f381dd8fdfbf9975586547a0ab553d0152b8aad11ae9b')

#server doesn't like curl user agent
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

prepare() {
  cd "${srcdir}/media_build-bst"
  ln -sr v4l/sit2_op.o.x${CARCH: -2} v4l/sit2_op.o
  cp v4l/sit2_mod.dvb linux/drivers/media/dvb-frontends/sit2_mod.c
  sed -i -e "s|/sbin/lsmod|$(which lsmod)|" -e 's|/sbin/depmod|#/sbin/depmod|' v4l/Makefile
  sed -i 's|/sbin/depmod|#/sbin/depmod|' v4l/scripts/make_makefile.pl
  patch -p1 -i ../add_c2800e.patch
}

build() {
  cd "${srcdir}/media_build-bst"
  #media-build doesn't like parallel jobs
  make -j1
}

package() {
  cd "${srcdir}/media_build-bst"
  make DESTDIR="${pkgdir}" KDIR26="/usr/lib/modules/$(uname -r)/updates/kernel/drivers/media" media-install
  find "${pkgdir}" -type f -name '*.ko' -exec gzip -9 {} \;
}
