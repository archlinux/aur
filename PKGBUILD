# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_pkgname=faad2
pkgname=lib32-${_pkgname}
pkgver=2.7
pkgrel=5
pkgdesc="ISO AAC audio decoder (32 bit)"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom:FAAD2')
depends=('lib32-glibc' ${_pkgname})
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/faac/${_pkgname}-${pkgver}.tar.bz2
	faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch
	faad2-2.7-libmp4ff-shared-lib.patch
	faad2-2.7-man1_MANS.patch)
md5sums=('4c332fa23febc0e4648064685a3d4332'
         'b33354022bc1696a89b3ccc1ab94c54f'
         'b23d2853fec6f07ae7769fd4eabd8f42'
         'a8cee29241a696ab24d010af35b951b8')

prepare() {
cd ${_pkgname}-${pkgver}
patch -p1 -i "${srcdir}/faad2-2.7-libmp4ff-shared-lib.patch"
patch -p0 -i "${srcdir}/faad2-2.7-libmp4ff-install-mp4ff_int_types_h.patch"
patch -p1 -i "${srcdir}/faad2-2.7-man1_MANS.patch"
autoreconf --force --install
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make CFLAGS="${CFLAGS} -fPIC"
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
cd ..
}
