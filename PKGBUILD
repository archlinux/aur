# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=asteria
_pkgname=Asteria
pkgver=2.5.0
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
sha256sums=('8a748007548f513fd2fea9e74ae73bee34ebc048281141f6ee1d8519d9964942'
            '032a71d18cff92c9bf960020abda28d44c8f0c678072dcbab561e9aeb0399fbc'
	    '89e47c8772b86d78ec898a9759e2d1a4ea149e82f6013f41af493dac3f83af32')
install="asteria.install"

prepare(){
  # first copy the Swiss Ephemeris into the Asteria's build directory (it needs to be compiled statically with Asteria) as 'swisseph':
  mv "${srcdir}/swisseph-2.10.3final" "${srcdir}/swisseph"
  cp -r "${srcdir}/swisseph" "${srcdir}/${_pkgname}-${pkgver}"
  
  # specify directory for local build in in file CMakeLists.txt - line 60:
  sed -i '60 s/\/home\/dharma\/ssd\/cpp/\./' "${srcdir}/${_pkgname}-${pkgver}/CMakeLists.txt"
}


build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install ./build_dir/
}
