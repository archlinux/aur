# Maintainer: Black_codec <orso.f.regna@gmail.com>
# Based on work of: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stijn Segers <francesco dot borromini at gmail dot com>

pkgname=freerdp-guacamole
_pkgname=freerdp
pkgver=1.0.2
pkgrel=8
pkgdesc="Free RDP client version to work with guacamole server"
arch=('i686' 'x86_64')
url="http://freerdp.sourceforge.net"
license=('GPL')
depends=('openssl' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
	 'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv' 'libpulse')
makedepends=('krb5' 'cmake' 'damageproto' 'xmlto' 'docbook-xsl')
conflicts=('freerdp-git' 'freerdp')
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
}

build() {
  cd $srcdir/FreeRDP-$pkgver
  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DWITH_PULSEAUDIO=ON \
	.
  make
}

package() {
  cd $srcdir/FreeRDP-$pkgver
  make DESTDIR="${pkgdir}" install
}
