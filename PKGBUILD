# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

pkgname=freerdp-102
_pkgname=freerdp
pkgver=1.0.2
pkgrel=10
pkgdesc="Free RDP client"
arch=('i686' 'x86_64')
url="http://freerdp.sourceforge.net"
license=('GPL')
depends=('openssl' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
	 'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv' 'libpulse')
makedepends=('krb5' 'cmake' 'xorgproto' 'xmlto' 'docbook-xsl')
conflicts=('freerdp' 'freerdp-git')
provides=('freerdp')
changelog=${_pkgname}.changelog
source=($_pkgname-$pkgver.tar.gz::https://github.com/FreeRDP/FreeRDP/archive/$pkgver.tar.gz
	ffmpeg2.0.patch
	patch_numblock.patch
	CVE-2014-0791.patch
	stuck_winkey.patch)
md5sums=('c260051a94caff590def5caa4fcf59d6'
         '1260eecf01ea5212e2db8ac9c5e7fa6d'
         'ac581d445ded7cdbd59082a48d9c28ac'
         '62d0ab241c16ee5d85ff89183df9bbc0'
         '1c1a8f77ebcaa7256968a9506ed3e772')

prepare() {
  cd $srcdir/FreeRDP-$pkgver
  patch -Np1 -i ../ffmpeg2.0.patch
  patch -Np1 -i ../patch_numblock.patch
  patch -Np1 -i ../CVE-2014-0791.patch
  patch -Np1 -i ../stuck_winkey.patch
  sed -i "s,PIX_FMT_YUV420P,AV_PIX_FMT_YUV420P,
          s,CODEC_ID_,AV_CODEC_ID_,
	  s,CODEC_CAP_TRUNCATED,AV_CODEC_CAP_TRUNCATED,
	  s,CODEC_FLAG_TRUNCATED,AV_CODEC_FLAG_TRUNCATED," \
	channels/drdynvc/tsmf/ffmpeg/tsmf_ffmpeg.c
}

build() {
  cd $srcdir/FreeRDP-$pkgver
  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DWITH_PULSEAUDIO=ON \
	.
  make -j1
}

package() {
  cd $srcdir/FreeRDP-$pkgver
  make DESTDIR="${pkgdir}" install
}
