# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

((DISABLE_BUNDLED_RADARE)) && {
	depends+=('radare2>=5.1.0')
	_CMAKE_FLAGS+=(-DCUTTER_USE_BUNDLED_RADARE2=OFF)
} || {
	source+=("radare2::git+https://github.com/radareorg/radare2")
	md5sums+=('SKIP')
	_CMAKE_FLAGS+=(-DCUTTER_USE_BUNDLED_RADARE2=ON)
}


pkgname=radare2-cutter-git
epoch=1
pkgver=0.1.0.r2.gbaf2c363
pkgrel=1
pkgdesc='Qt and C++ GUI for radare2 reverse engineering framework (originally named Iaito)'
url='https://github.com/radareorg/cutter'
arch=('x86_64')
license=('GPL3')
depends+=('python' 'capstone' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'python-shiboken2' 'pyside2' 'graphviz' 'qt5-tools' 'syntax-highlighting')
makedepends=('git' 'cmake' 'shiboken2' 'meson' 'ninja')
optdepends=()
provides=('radare2-cutter')
backup=()
source+=("${pkgname}::git+https://github.com/radareorg/r2cutter.git${_fragment}"
	"cutter-translations::git+https://github.com/radareorg/cutter-translations")
md5sums+=('SKIP'
         'SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git config submodule.src/translations.url "${srcdir}"/cutter-translations
  ((DISABLE_BUNDLED_RADARE)) && {
    git submodule update --init --recursive "${submodules[@]}" src/translations
  } || {
    git config submodule.radare2.url "${srcdir}"/radare2
    git submodule update --init --recursive "${submodules[@]}"
  }
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DCUTTER_ENABLE_PYTHON=ON
    -DCUTTER_ENABLE_PYTHON_BINDINGS=ON
    -DCUTTER_USE_ADDITIONAL_RADARE2_PATHS=OFF
    -DCUTTER_ENABLE_CRASH_REPORTS=OFF
    -DCUTTER_ENABLE_GRAPHVIZ=ON
)
  cmake -B build -S "${srcdir}/${pkgname}/src" "${_CMAKE_FLAGS[@]}"
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a ${pkgname}/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
