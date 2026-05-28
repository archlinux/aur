# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=asteria
_pkgname=Asteria
pkgver=2.4.6
pkgrel=1
pkgdesc='Astrological chart calculator and analyzer with AI interpretations'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('AGPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'qt6-webengine' 'qt6-positioning' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "swisseph-2.10.3final.tar.gz::https://github.com/aloistr/swisseph/archive/refs/tags/v2.10.3final.tar.gz")
sha256sums=('b7e9a0035b308a9da4c14ee65cf47e4828b6b3d1a4e4a0245a774c4698c0451f'
            '032a71d18cff92c9bf960020abda28d44c8f0c678072dcbab561e9aeb0399fbc')

prepare(){
  #first copy the Swiss Ephemeris into the Asteria build directory (it needs to be compiled statically with Asteria) as 'swisseph':
  mv "$srcdir/swisseph-2.10.3final" "$srcdir/swisseph"
  cp -r "$srcdir/swisseph" "$srcdir/${_pkgname}-${pkgver}"
  
  #now, change the value of the local SWISSEPH_DIR in file CMakeLists.txt - line 55:
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
