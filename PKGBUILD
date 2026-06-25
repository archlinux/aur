# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=asteria
_pkgname=Asteria
pkgver=2.4.7
pkgrel=1
pkgdesc='Astrological chart calculator and analyzer with AI interpretations'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('AGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-webengine' 'qt6-positioning' 'qt6-charts' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "swisseph-2.10.3final.tar.gz::https://github.com/aloistr/swisseph/archive/refs/tags/v2.10.3final.tar.gz"
        "asteria.install")
sha256sums=('df1fb07ffa8a5a00ca0eda1c5c9d7ed3b6486237d98381801a17b78acd7dcab2'
            '032a71d18cff92c9bf960020abda28d44c8f0c678072dcbab561e9aeb0399fbc'
	    '89e47c8772b86d78ec898a9759e2d1a4ea149e82f6013f41af493dac3f83af32')
install="asteria.install"

prepare(){
  # first copy the Swiss Ephemeris into the Asteria's build directory (it needs to be compiled statically with Asteria) as 'swisseph':
  mv "$srcdir/swisseph-2.10.3final" "$srcdir/swisseph"
  cp -r "$srcdir/swisseph" "$srcdir/${_pkgname}-${pkgver}"
  
  # now, change the value of the local SWISSEPH_DIR in file CMakeLists.txt - line 55:
  sed -i '55 s/\/home\/dharma\/ssd\/cpp/\./' "$srcdir/${_pkgname}-${pkgver}/CMakeLists.txt"
}


build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}


package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
