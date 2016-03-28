# Maintainer: Joerg Schuck <joerg_schuck at web dot de>
# Contributor: Tyler <tjb0607 at gmail dot com>
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=apng-utils
pkgver=3.1.6
_apngdis_pkgver=2.8
_apngasm_pkgver=3.1.6
_gif2apng_pkgver=1.9
_apng2gif_pkgver=1.7
pkgrel=1
pkgdesc="apngasm for assembling apng files, apngdis for disassembling apng files, and gif2apng/apng2gif for converting."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/apngdis/"
# apngasm: http://sourceforge.net/projects/apngasm/
# gif2apng: http://sourceforge.net/projects/gif2apng/
# apng2gif: http://sourceforge.net/projects/apng2gif/
provides=( apngasm apngdis gif2apng apng2gif)
license=('LGPL')
depends=( 'libpng' 'gcc-libs' )
makedepends=( 'boost' 'cmake' )
source=("http://sourceforge.net/projects/apngdis/files/${_apngdis_pkgver}/apngdis-${_apngdis_pkgver}-src.zip"
        "https://github.com/apngasm/apngasm/archive/3.1.6.tar.gz"
        "http://sourceforge.net/projects/gif2apng/files/${_gif2apng_pkgver}/gif2apng-${_gif2apng_pkgver}-src.zip"
        "http://sourceforge.net/projects/apng2gif/files/${_apng2gif_pkgver}/apng2gif-${_apng2gif_pkgver}-src.zip"
)
noextract=( 
	"gif2apng-${_gif2apng_pkgver}-src.zip"
	"apng2gif-${_apng2gif_pkgver}-src.zip" 
	"apngdis-${_apngdis_pkgver}-src.zip" 
)
md5sums=('2e8a430ae2a8c544af4965840d9fad23'
         'da03e28b408a54206a2e9765deb448b1'
         '4e7336fe6b71c18ac830bb2977204819'
         '9877249603e7d01bc1970130a40cd035')
sha256sums=('58f5082025f3e97d9072dfe3fbd3abc43252ee118a7463209b65d05b8fd71741'
            '0068e31cd878e07f3dffa4c6afba6242a753dac83b3799470149d2e816c1a2a7'
            '3b21308e935d799b3ffb4a86c6e00ffa4cb9b3f72f52d58d51c66eb0574ae7d2'
            '6c7b2cce851378f2fc8f6b490ce098e9cf0038aa05da7099771c8be94620e6ca')

build() {
  cd "${srcdir}"
  
  # Several packages now use a different build approach than before.
  for _pack in "${noextract[@]}"; do
        _builddir=${_pack%%-*}
	mkdir $_builddir
  	bsdtar xf "${_pack}" --directory $_builddir
  
  	cd $_builddir
  	make ${MAKEFLAGS}
	
	cd "${srcdir}"
  done
  
  cd "${srcdir}/apngasm-${_apngasm_pkgver}"
  mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX="/usr" ../
  make
}

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/bin/"
  for _pack in "${noextract[@]}"; do
	_builddir=${_pack%%-*}
  	install -Dm755 "$_builddir/$_builddir" "$pkgdir/usr/bin/"
  done
  
  cd "${srcdir}/apngasm-${_apngasm_pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

