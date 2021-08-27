# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=horde3d
pkgver=2.0.0
pkgrel=1
pkgdesc='Horde3D is a small 3D rendering and animation engine. It is written in an effort to create an engine being as lightweight and conceptually clean as possible.'
url='http://www.horde3d.org/'
license=('EPL')
arch=('i686' 'x86_64')
depends=('libgl' 'glfw-x11')
makedepends=('cmake' 'ninja')
source=("https://github.com/horde3d/Horde3D/archive/refs/tags/v${pkgver}.tar.gz"
        "fix-building-under-linux-and-gcc-10.patch")
sha512sums=('0c267a4ce80c6db4cc18064759aae69761cf39a232e31cc24674092eb35c13439a7df0b984c46a2b93dee446cecc5c266f4a47e78f24577a491bee6582782927'
            '15cac2942803297591ead6cbfa597699b4dffd210bee750a6508338cca98d2bd5e61c6b603a249c780e2119fa6671797839fdf787b217f3619fb72597490f10c')

prepare() {
  cd "${srcdir}/Horde3D-${pkgver}"
  patch -p1 -i "../fix-building-under-linux-and-gcc-10.patch"
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"

  cmake \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="${CFLAGS/-O2/-Ofast}" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-O2/-Ofast}" \
    ../Horde3D-${pkgver}

  ninja
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install

  install -Dm755 "${srcdir}/build/Binaries/Linux/Release/ColladaConv" "${pkgdir}"/usr/bin/ColladaConv
}
