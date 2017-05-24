# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: Andre Fettouhi <A.Fettouhi@gmail.com>
# Maintainer: bohoomil <@zoho.com>

_pkgbasename=freetype2
pkgname=lib32-$_pkgbasename-infinality-ultimate
pkgver=2.8
pkgrel=1
_patchrel=2017.05.22
pkgdesc="TrueType font rendering library with Infinality patches and custom settings by bohoomil (32-bit, infinality-bundle)."
arch=(x86_64)
license=('GPL' 'MIT')
url="http://freetype.sourceforge.net"
groups=('infinality-bundle-multilib')
depends=('lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' $_pkgbasename-infinality-ultimate)
makedepends=('gcc-multilib')
conflicts=('lib32-freetype2' 'lib32-freetype2-infinality' 'lib32-freetype2-git-infinality'
           'lib32-freetype2-ubuntu')
provides=('lib32-freetype2' 'lib32-freetype2-infinality')
options=('!libtool')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2	
	      0001-Enable-table-validation-modules.patch
        0002-infinality-${pkgver}-${_patchrel}.patch
        0003-inf.patch
        0004-Enable-long-PCF-family-names.patch
        )

sha256sums=('a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b'
            '515d52643fa47bb96c99792c81d4c05694b4e08494d36c5f81f6d05b61d4f287'
            '72329f1efbc0a8a06c072d81f7c75464a2874a3d95e9319d0ab42bf5786fe4de'
            '9d65d9c6eee7ecf993bfada7aa5530f09a44dec6796a23f2f186d29c2acf775a'
            '7f5aa51a67a68002226f8e869eaa3f6b870c04d19135a14c64a6c355eb023a39')

prepare() {
  cd "freetype-${pkgver}"
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-infinality-${pkgver}-${_patchrel}.patch
  patch -Np1 -i ../0003-inf.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "freetype-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --with-harfbuzz \
    --libdir=/usr/lib32
  make
}

#check() {
  #cd "freetype-${pkgver}"
  #make -k check
#}

package() {
  cd "freetype-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
