# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=forge-git
_pkgname=forge
pkgdesc="High Performance Visualizations"
url='https://github.com/arrayfire/forge'
pkgver=1.1.0_af3.2.2.r418.g735e642
arch=('x86_64')
pkgrel=1
license=('BSD')
depends=('glfw' 'freetype2' 'fontconfig' 'freeimage' 'glbinding')
makedepends=('cmake' 'graphviz' 'git' 'python' 'glm' 'boost')
source=("git+https://github.com/arrayfire/forge.git")
sha512sums=('SKIP')
options=('!buildflags')
provides=(forge)
conflicts=(forge)

pkgver() {
  cd $_pkgname
  cmakever=$(cat CMakeLists.txt | grep "project(Forge" | sed 's/project(Forge VERSION //;s/LANGUAGES C CXX)//;s/ //g')
  gitdescribe=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  printf "%s_%s" $cmakever $gitdescribe
}

build() {
  cd $_pkgname

  cmake . \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DFG_BUILD_EXAMPLES=ON \
      -DFG_BUILD_DOCS=OFF

  make -C build
}

package() {
  cd $_pkgname

  install -Dm644 .github/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  DESTDIR="${pkgdir}/" make -C build install
}
