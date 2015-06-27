# Maintainer: Carlo Teubner <carlo [dot] teubner [at] gmail [dot] com>

pkgname=yate-qt4
pkgver=5.5.0
pkgrel=1
pkgdesc="Telephony client"
arch=('x86_64')
url="http://yate.null.ro"
license=('GPL2')
depends=('qt4' 'speex' 'gsm' 'alsa-lib' 'pcre')
makedepends=('desktop-file-utils')
conflicts=('yate' 'yate-svn')
options=(!makeflags)
source=("http://voip.null.ro/tarballs/yate5/yate-${pkgver}-1.tar.gz")
sha256sums=('a9fc472df082e92d578efa3de54689e10ee1a24fdd67a9cc928db7c2e1568676')

build() {
  cd yate
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-libgsm \
              --with-libspeex \
              --with-libqt4 \
              --without-wphwec \
              --without-mysql \
              --without-libpq \
              --without-spandsp \
              --without-doxygen \
              --without-kdoc \
              --enable-sse2 \
              --disable-dahdi \
              --disable-zaptel \
              --disable-wpcard \
              --disable-tdmcard \
              --disable-wanpipe
  make
}

package() {
  cd yate
  make DESTDIR="${pkgdir}" install-noapi
  rm "${pkgdir}/usr/bin/yate"
  rm "${pkgdir}/usr/bin/yate-config"
  rm -rf "${pkgdir}/usr/lib/yate/server/"
  rm -rf "${pkgdir}/usr/include/"
  rm -rf "${pkgdir}/usr/lib/pkgconfig/"
  rm -rf "${pkgdir}/usr/share/man/"
  rmdir "${pkgdir}/usr/share/doc/yate-${pkgver}/api"
  desktop-file-edit --remove-key="Encoding" \
                    --set-icon="null_team-48" \
                    "${pkgdir}/usr/share/applications/yate-qt4.desktop"
}
