# $Id: PKGBUILD 271839 2016-07-13 18:19:11Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-infinality-ultimate
pkgname=(freetype2-infinality-ultimate freetype2-demos-infinality)
pkgver=2.8
pkgrel=2
_patchrel=2017.05.24
pkgdesc="TrueType font rendering library with Infinality patches and custom settings by bohoomil"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
makedepends=('libx11')
install=freetype2.install
source=(https://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        https://download.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2
        https://download-mirror.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
        0002-infinality-${pkgver}-${_patchrel}.patch
        0004-Enable-long-PCF-family-names.patch
        0005-freetype-2.5.2-more-demos.patch
        freetype2.sh
        infinality-settings.sh
        xft-settings.sh)

sha256sums=('a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b'
            '427ba04d11f450df4bac4c95fec247be1b835ccdcf85d8b081f3f39d31811154'
            '2b6ce0d36bcb43fcc8aac07a0287982d855571ee271c3803c768e501f9c1a233'
            '515d52643fa47bb96c99792c81d4c05694b4e08494d36c5f81f6d05b61d4f287'
            'faac711ba50c7366399331d9a62a13becf125a99ab051b319e18fa0761311159'
            '7f5aa51a67a68002226f8e869eaa3f6b870c04d19135a14c64a6c355eb023a39'
            '36484db4b926ed026e7f32570573493b5a9793a129f08d54383a26d65a6af89b'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467'
            '2041947007b27d58101b5aebdf225d79d2c6d64cf8ac07a71c225d9e027578a0'
            'a4b3db6882de85304c5e4099fca5832a598607f90e582bcd030df0e9b526cd0b')

prepare() {
  mv freetype-${pkgver} freetype2
  mv ft2demos-${pkgver} freetype2-demos

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-infinality-${pkgver}-${_patchrel}.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  cd ../freetype2-demos
  # enable more demos
  patch -Np1 -i ../0005-freetype-2.5.2-more-demos.patch
	
  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static --with-harfbuzz --with-png
  make
  
  # Build demos
  cd ../freetype2-demos 
  make
}

check() {
  cd freetype2
  make -k check
}

package_freetype2-infinality-ultimate() {
  groups=('infinality-bundle')
  depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
  provides=("freetype2=$pkgver" 'freetype2-infinality' 'libfreetype.so')
  conflicts=('freetype2' 'freetype2-infinality')
  
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"
  install -Dm644 ../xft-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/xft-settings.sh"
  install -Dm644 ../infinality-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/infinality-settings.sh"
}

package_freetype2-demos-infinality() {
	pkgdesc="Freetype tools and demos"
	depends=('freetype2' 'libx11')
  conflicts=('freetyp2-demos' 'freetyp2-demos-kagayaki')

	cd freetype2-demos
	install -d "${pkgdir}/usr/bin"
	for _i in bin/{f,t}t*; do
		libtool --mode=install install $_i "${pkgdir}/usr/bin"
	done
}
