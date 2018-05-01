# Maintainer: Soukyuu <chrno-spheredΘhotmail·com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv-lancer
_srcname=libvorbis-aotuv
pkgver=1.3.6
pkgrel=0
_aotuv_ver=b6.03
pkgdesc='A fork of libvorbis intended to provide better quality sound at low to medium bitrates, with lancer patches to improve performance'
arch=('i686' 'x86_64')
url='https://www.hydrogenaud.io/forums/index.php?showtopic=109766'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis' 'libvorbis-aotuv')
provides=('libvorbis=1.3.6' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz"
        "https://freac.org/patches/libvorbis-${pkgver}-aotuv-${_aotuv_ver}.patch"
        "https://freac.org/patches/libvorbis-${pkgver}-aotuv-${_aotuv_ver}-lancer.patch")
sha256sums=('6ed40e0241089a42c48604dc00e362beee00036af2d8b3f46338031c9e0351cb'
            '1efd443bb7a32562f30ae778983e4fd31f07c612e08e49d536429443107bb946'
            'cb510d6d7222599eed0df8ea8708eb4cb3371a617e1a07eac83d723185ae1ad9')
prepare() {
	cd "libvorbis-${pkgver}"
	chmod +x configure
	
	# apply aotuv patches
	patch -p1 -i "${srcdir}/libvorbis-${pkgver}-aotuv-${_aotuv_ver}.patch"
	
	# apply lancer patches
	patch -p1 -i "${srcdir}/libvorbis-${pkgver}-aotuv-${_aotuv_ver}-lancer.patch"
}

build() {
	cd "libvorbis-${pkgver}"
	./configure --prefix=/usr --enable-shared --disable-static
	make
}

check() {
	cd "libvorbis-${pkgver}"
	make -j1 check
}

package() {
	cd "libvorbis-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
