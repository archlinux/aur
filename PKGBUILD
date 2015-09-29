# Maintainer: Soukyuu <chrno-spheredΘhotmail·com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv-lancer
_srcname=libvorbis-aotuv
pkgver=b6.03
pkgrel=7
_releasedate=20110424-20150808
_srcrel=2015
pkgdesc='A fork of libvorbis intended to provide better quality sound at low to medium bitrates, with lancer patches to improve performance'
arch=('i686' 'x86_64')
url='https://www.hydrogenaud.io/forums/index.php?showtopic=109766'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis' 'libvorbis-aotuv')
provides=('libvorbis=1.3.5' 'libvorbisfile.so' 'libvorbis.so' 'libvorbisenc.so')
source=("http://www.geocities.jp/aoyoume/aotuv/source_code/${_srcname}_${pkgver}_${_srcrel}.tar.bz2"
        "http://freac.org/patches/arch/libvorbis-aotuv_b6.03_2015-lancer.patch"
        "http://freac.org/patches/arch/libvorbis-aotuv_b6.03_2015-lancer-x64.patch")
sha256sums=('fba6724d2bc2b6a911a25e60f21a45749d507f181a9e150415ce41e4d03bc08f'
            'd2296d4f06ef1bc4744425446a04b2403b47bc75c22d3328df820968e4128d58'
            'e54eb271f539ce7ae3bc90bc85643c79c22925fcd1963920b969d7035eeae653')

prepare() {
	cd "aotuv-${pkgver}_${_releasedate}"
	chmod +x configure
	
	# apply lancer patches
	patch -p1 -i "${srcdir}/libvorbis-aotuv_b6.03_2015-lancer.patch"
	
	# linux x64 uses 8 byte for long - src expects 4
	if [ "${CARCH}" = "x86_64" ]; then
        patch -p1 -i "${srcdir}/libvorbis-aotuv_b6.03_2015-lancer-x64.patch"
    fi

    # configure sets their own CFLAGS to increase performance, so we clear makepkg.conf ones
    #CFLAGS="march=native"
    #CXXFLAGS="march=native"
}

build() {
	cd "aotuv-${pkgver}_${_releasedate}"
	./configure --prefix=/usr --disable-static
	make
}

check() {
	cd "aotuv-${pkgver}_${_releasedate}"
	make -j1 check
}

package() {
	cd "aotuv-${pkgver}_${_releasedate}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
