# Maintainer: Bastien Traverse <neitsab at esrevart dot net>
# Contributor: Soukyuu <chrno-spheredΘhotmail·com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv-lancer
_srcname="${pkgname%-aotuv-lancer}"
pkgver=1.3.7
pkgrel=3
_aotuv_ver=aotuv-b6.03
_patch_ver=2021-05-10
pkgdesc='The Vorbis library with aoTuV and Lancer patches'
arch=('i686' 'x86_64')
url='https://hydrogenaud.io/index.php?topic=115774.0'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis' 'libvorbis-aotuv')
provides=(
  'libvorbis'
  'libvorbis.so'
  'libvorbisenc.so'
  'libvorbisfile.so'
)
source=("https://downloads.xiph.org/releases/vorbis/${_srcname}-${pkgver}.tar.gz"{,.asc}
        "${_srcname}-${pkgver}-${_aotuv_ver}-${_patch_ver}.patch::https://freac.org/patches/${_srcname}-${pkgver}-${_aotuv_ver}.patch"
        "${_srcname}-${pkgver}-${_aotuv_ver}-lancer-${_patch_ver}.patch::https://freac.org/patches/${_srcname}-${pkgver}-${_aotuv_ver}-lancer.patch")
validpgpkeys=(B7B00AEE1F960EEA0FED66FB9259A8F2D2D44C84) # Ralph Giles <giles@thaumas.net>
sha1sums=('2b415495f89b103138a23da5017a2a00837c6c94'
          'dc604e62a7e7ad60eb6fae0960cdf390a382258b'
          '98ab0c044b8e6aaf79d31861c6351b1f611f9fda'
          '0051b8c61bf74e68d4193cf9e2afbf02a01362e8')

prepare() {
	cd "${_srcname}-${pkgver}"

	# apply aotuv patch set
	patch -p1 -i "${srcdir}/${_srcname}-${pkgver}-${_aotuv_ver}-${_patch_ver}.patch"
	
	# apply lancer patch set
	patch -p1 -i "${srcdir}/${_srcname}-${pkgver}-${_aotuv_ver}-lancer-${_patch_ver}.patch"
}

build() {
	cd "${_srcname}-${pkgver}"
	./configure \
      --prefix=/usr \
      --disable-static \
      --enable-shared
	make
}

check() {
	cd "${_srcname}-${pkgver}"
	make -k check
}

package() {
	cd "${_srcname}-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm644 AUTHORS CHANGES aoTuV_technical.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
