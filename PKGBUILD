# Maintainer: Musikolo <musikoloAThotmailDOTcom>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

# This package is based on the Arch Linux official faad2 package built by Sarah Hay. 
# Thanks Sarah! It just builds the whole faad2 package in the same way, but it 
# includes the --with-xmms switch and put the libmp4.so file in a package.

_srcname=faad2
pkgname=xmms-mp4-plugin
pkgver=2.7
pkgrel=4
pkgdesc="ISO AAC audio decoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL')
depends=('glibc')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/faac/${_srcname}-${pkgver}.tar.bz2
        faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch
	faad2-2.7-libmp4ff-shared-lib.patch
	faad2-2.7-man1_MANS.patch
	faad2-2.7-xmms-shared-lib.patch)
sha256sums=('14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5'
            'c554313121f935aaabbe5b05addfc065bdf782bc0634ee9a91ceabde001ea823'
            'e0aaefeb20ebfec2f09e88a190f78e5744d9f1c71fe41977db8e4f29b5b88022'
            'e3e745cca309443d0149a09cc9988fec09c51e242b0e564afcb0af787dbb9031'
            '1bc896c2454dafa954b5e658ead0604b12460441bc3f71d1b01a1c124650400a')

prepare() {
   cd ${_srcname}-${pkgver}
   patch -p1 -i "${srcdir}/faad2-2.7-libmp4ff-shared-lib.patch"
   patch -p0 -i "${srcdir}/faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch"
   patch -p1 -i "${srcdir}/faad2-2.7-man1_MANS.patch"
   patch -p1 -i "${srcdir}/faad2-2.7-xmms-shared-lib.patch"
   autoreconf --force --install
}

build() {
   cd ${_srcname}-${pkgver}
   ./configure --prefix=/usr --with-xmms
   make CFLAGS="${CFLAGS} -fPIC"
}

package(){
  cd ${srcdir}/${_srcname}-${pkgver}
  install -D -m644  ${srcdir}/${_srcname}-${pkgver}/plugins/xmms/src/.libs/libmp4.so ${pkgdir}`xmms-config --input-plugin-dir`/libmp4.so
}
