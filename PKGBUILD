# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

# Last version before porting to rizin
_fragment="#commit=0e9b0c92b9ed0efe12a59c15545952103aea7ad2"

pkgname=radare2-cutter-git
pkgver=1.10.3.pre.r172.g0e9b0c92
pkgrel=1
pkgdesc='Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)'
url='https://github.com/radareorg/cutter'
arch=('x86_64')
license=('GPL3')
depends=('python' 'capstone' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'python-shiboken2' 'pyside2' 'graphviz' 'qt5-tools')
makedepends=('git' 'cmake' 'shiboken2' 'meson' 'ninja')
optdepends=()
provides=('radare2-cutter')
backup=()
source=("${pkgname}::git+https://github.com/radareorg/cutter.git${_fragment}")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  cd "${pkgname}/src"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCUTTER_ENABLE_PYTHON=ON \
    -DCUTTER_ENABLE_PYTHON_BINDINGS=ON \
    -DCUTTER_USE_BUNDLED_RADARE2=ON \
    -DCUTTER_USE_ADDITIONAL_RADARE2_PATHS=OFF \
    -DCUTTER_ENABLE_CRASH_REPORTS=OFF \
    -DCUTTER_ENABLE_GRAPHVIZ=ON
  make -C build VERBOSE=1
}

package() {
  cd ${pkgname}

  install -DTm755 src/build/Cutter "${pkgdir}/usr/bin/Cutter"
  install -DTm644 src/org.radare.Cutter.desktop "${pkgdir}/usr/share/applications/org.radare.Cutter.desktop"
  install -DTm644 src/img/cutter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutter.svg"
  install -DTm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 docs/ "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
