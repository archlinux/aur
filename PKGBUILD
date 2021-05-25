# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=apng-utils
pkgver=3.1.6
_apngdis_pkgver=2.9
_apngasm_pkgver=3.1.6
_gif2apng_pkgver=1.9
_apng2gif_pkgver=1.8
pkgrel=5
pkgdesc="apngasm for assembling apng files, apngdis for disassembling apng files, and gif2apng/apng2gif for converting."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/apngdis/"
# apngasm: http://sourceforge.net/projects/apngasm/
# gif2apng: http://sourceforge.net/projects/gif2apng/
# apng2gif: http://sourceforge.net/projects/apng2gif/
provides=('apngasm' 'apngdis' 'gif2apng' 'apng2gif')
license=('LGPL')
depends=('libpng' 'gcc-libs')
makedepends=('cmake' 'boost')
source=("https://sourceforge.net/projects/apngdis/files/${_apngdis_pkgver}/apngdis-${_apngdis_pkgver}-src.zip"
        "$pkgname-$pkgver.tar.gz::https://github.com/apngasm/apngasm/archive/${_apngasm_pkgver}.tar.gz"
        "https://sourceforge.net/projects/gif2apng/files/${_gif2apng_pkgver}/gif2apng-${_gif2apng_pkgver}-src.zip"
        "https://sourceforge.net/projects/apng2gif/files/${_apng2gif_pkgver}/apng2gif-${_apng2gif_pkgver}-src.zip"
       cli.patch)
sha512sums=('4bcce5066c37ea5e4db0bfaf2f6a81e4d3ba7f5b6c952f598facff27f84cc1a3af778f4db096119cb9f4aa57c0193c90acf7bed28f283b6930f5b3121dd9cf32'
            'cbc6f0ad119a7ce17079be3434e516265bea619ecb46fe147d652bbaff4652a858698df07a072f5095894961137fe32546f75ad603c7483476be7ffe463cf999'
            '6f161699aad949466c60e0fb6abb2f38e7ec8353dd15e65ccb9944a66dabc5a4acf32523cb64073c73290e54cc2b753db68123c14f3f7789343491a4f65dcd2c'
            '54fee0bf1e5448531298a816562a611cb5f2f661d40ade622e2d24e58a30de96fa69254ee891c5329e8b065c999b95620215d6e1ae276f0c596ffe69b0b31cda'
            '1998f8a86581eadf456daaa7c8674455c06d81c3716485348740183efada4969557612fabebbab8f30cc6d19f4717df8ff5a3afffc7e7ca0168bf590aee6e258')
noextract=( 
	"gif2apng-${_gif2apng_pkgver}-src.zip"
	"apng2gif-${_apng2gif_pkgver}-src.zip" 
	"apngdis-${_apngdis_pkgver}-src.zip" 
)

prepare() {
  cd  "$srcdir"/apngasm-${_apngasm_pkgver}
  patch -Np1 < "$srcdir"/cli.patch
}

build() {
  # Several packages now use a different build approach than before.
  for _pack in "${noextract[@]}"; do
        _builddir=${_pack%%-*}
	[[ -d $_builddir ]] || mkdir $_builddir
  	bsdtar xf "${_pack}" --directory $_builddir
  
  	cd $_builddir
  	make ${MAKEFLAGS}
	
	cd "${srcdir}"
  done

  cd "${srcdir}/apngasm-${_apngasm_pkgver}"

  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd "${srcdir}"
  install -d "$pkgdir"/usr/bin/
  for _pack in "${noextract[@]}"; do
	_builddir=${_pack%%-*}
  	install -Dm755 "$_builddir/$_builddir" "$pkgdir"/usr/bin/
  done
  
  cd "$srcdir"/apngasm-${_apngasm_pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}"/usr/man/man1/apngasm.1 "${pkgdir}"/usr/share/man/man1/apngasm.1
  rm -r "${pkgdir}"/usr/man
}

