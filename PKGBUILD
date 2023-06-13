# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: TheAifam5 <theaifam5 at gmail com>

pkgbase=sol2-git
pkgname=(sol2-git sol2-single-git)
pkgver=3.3.0.r13.geab1430c
pkgrel=1
pkgdesc="C++ <-> Lua Wrapper Library"
arch=(any)
url="https://sol2.rtfd.io/"
license=(MIT)
makedepends=(git cmake python lua)
source=("git+https://github.com/ThePhD/sol2.git")
sha256sums=('SKIP')

pkgver() {
  cd sol2
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
    -S sol2 \
    -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_COMPILER=g++ \
    -DSOL2_BUILD_LUA:BOOL=FALSE \
    -Wno-dev
}

package_sol2-git() {
 conflicts=(sol2)
 provides=(sol2)
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 sol2/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_sol2-single-git() {
 conflicts=(sol2-single sol2)
 provides=(sol2-single)
  cd sol2/single

  # install headers
  install -d ${pkgdir}/usr/include/sol
  python single.py --input ../include --output ${pkgdir}/usr/include/sol/sol.hpp

  install -Dm 644 ${srcdir}/sol2/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
