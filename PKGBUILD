# Contributor: Barry <brrtsm at gmail dot com>
# Contributor: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=apng-utils
pkgver=3.1.10
_apngdis_pkgver=2.9
_apngasm_pkgver=3.1.10
_gif2apng_pkgver=1.9
_apng2gif_pkgver=1.8
_apngopt_pkgver=1.4
pkgrel=3
pkgdesc="APNG utilities"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/apng/"
# apngdis: "https://sourceforge.net/projects/apngdis/"
# apngasm: "https://sourceforge.net/projects/apngasm/"
# gif2apng: "https://sourceforge.net/projects/gif2apng/"
# apng2gif: "https://sourceforge.net/projects/apng2gif/"
provides=('apngasm' 'apngdis' 'gif2apng' 'apng2gif' 'apngopt')
license=('LGPL' 'zlib')
depends=('libpng' 'gcc-libs')
makedepends=('cmake' 'boost')
conflicts=('apngasm' 'apngdis' 'gif2apng' 'apng2gif' 'apngopt')
source=("https://sourceforge.net/projects/apngdis/files/${_apngdis_pkgver}/apngdis-${_apngdis_pkgver}-src.zip"
        "$pkgname-$pkgver.tar.gz::https://github.com/apngasm/apngasm/archive/${_apngasm_pkgver}.tar.gz"
        "https://sourceforge.net/projects/gif2apng/files/${_gif2apng_pkgver}/gif2apng-${_gif2apng_pkgver}-src.zip"
        "https://sourceforge.net/projects/apng2gif/files/${_apng2gif_pkgver}/apng2gif-${_apng2gif_pkgver}-src.zip"
        "https://sourceforge.net/projects/apng/files/APNG_Optimizer/${_apngopt_pkgver}/apngopt-${_apngopt_pkgver}-src.zip")
sha512sums=('4bcce5066c37ea5e4db0bfaf2f6a81e4d3ba7f5b6c952f598facff27f84cc1a3af778f4db096119cb9f4aa57c0193c90acf7bed28f283b6930f5b3121dd9cf32'
            '670d75251ddc771f9b2b4a1f401066f2012a6814bec781b918f1d9e8960835654c66c3d19b4c8920d5186d85af12cdc4bba8b61c8f3d349b4fc70513d8ecb34e'
            '6f161699aad949466c60e0fb6abb2f38e7ec8353dd15e65ccb9944a66dabc5a4acf32523cb64073c73290e54cc2b753db68123c14f3f7789343491a4f65dcd2c'
            '54fee0bf1e5448531298a816562a611cb5f2f661d40ade622e2d24e58a30de96fa69254ee891c5329e8b065c999b95620215d6e1ae276f0c596ffe69b0b31cda'
            '8dd97ca6fdd10b1285c3a850ab0f6e14113df0b4a607877a6fb7c5bacded02432504e3af87a43c4aa660bad7226f300af8e0967368ca1eef00c9df7f624d578c')
noextract=(
	"gif2apng-${_gif2apng_pkgver}-src.zip"
	"apng2gif-${_apng2gif_pkgver}-src.zip"
	"apngdis-${_apngdis_pkgver}-src.zip"
	"apngopt-${_apngopt_pkgver}-src.zip"
)

build() {
  # Several packages now use a different build approach than before.
  for _pack in "${noextract[@]}"; do
        _builddir=${_pack%%-*}
	[[ -d $_builddir ]] || mkdir $_builddir
  	bsdtar xf "${_pack}" --directory $_builddir

  	cd $_builddir
  	make -j1

	cd "${srcdir}"
  done

  cd "${srcdir}/apngasm-${_apngasm_pkgver}"

  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make -j1
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
