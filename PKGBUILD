# Maintainer: Bastien Traverse <neitsab at esrevart dot net>
# Contributor: Soukyuu <chrno-spheredΘhotmail·com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Uli Armbruster <uli_armbrusterΘweb·de>
# Contributor: Robert Gregor <gimpΘpop·de>

pkgname=libvorbis-aotuv-lancer
_srcname="${pkgname%-aotuv-lancer}"
pkgver=1.3.7
pkgrel=1
_aotuv_ver=aotuv-b6.03
pkgdesc='The Vorbis library with aoTuV and Lancer patches'
arch=('i686' 'x86_64')
url='https://hydrogenaud.io/index.php?topic=115774.0'
license=('BSD')
depends=('libogg')
conflicts=('libvorbis' 'libvorbis-aotuv')
provides=(
  'libvorbis.so'
  'libvorbisenc.so'
  'libvorbisfile.so'
)
source=("https://downloads.xiph.org/releases/vorbis/${_srcname}-${pkgver}.tar.gz"{,.asc}
        "https://freac.org/patches/${_srcname}-${pkgver}-${_aotuv_ver}.patch"
        "https://freac.org/patches/${_srcname}-${pkgver}-${_aotuv_ver}-lancer.patch"
        "make-check-fix.patch::https://gitlab.xiph.org/xiph/vorbis/-/commit/4e1155cc77a2c672f3dd18f9a32dbf1404693289.patch")
validpgpkeys=(B7B00AEE1F960EEA0FED66FB9259A8F2D2D44C84) # Ralph Giles <giles@thaumas.net>
sha1sums=('2b415495f89b103138a23da5017a2a00837c6c94'
          'dc604e62a7e7ad60eb6fae0960cdf390a382258b'
          'ccb4725960467612c627961484065afd19c5f99e'
          'ce350ede3f6d11c09515d7e79fd8d1512d450e05'
          'ced440582403539d1b8904e003746ef75be36e1d')

prepare() {
	cd "${_srcname}-${pkgver}"

	# apply aotuv patch set
	patch -p1 -i "${srcdir}/${_srcname}-${pkgver}-${_aotuv_ver}.patch"
	
	# apply lancer patch set
	patch -p1 -i "${srcdir}/${_srcname}-${pkgver}-${_aotuv_ver}-lancer.patch"

	# apply upstreamed patch to fix make check failure with lancer mod
	patch -p1 -i "${srcdir}/make-check-fix.patch"
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
	# install original libvorbis specific files
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/${_srcname}"
	install -Dm644 AUTHORS CHANGES -t "${pkgdir}/usr/share/doc/${_srcname}-${pkgver}"
	# install libvorbis-aotuv-lancer specific files
	install -Dm644 aoTuV_README-1st.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 aoTuV_README-1st.txt aoTuV_technical.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
