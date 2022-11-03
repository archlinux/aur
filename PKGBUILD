#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

# shellcheck disable=SC2015
((DISABLE_BUNDLED_RADARE)) && {
	depends+=('radare2>=5.1.0')
	_CMAKE_FLAGS+=(-DIAITO_USE_BUNDLED_RADARE2=OFF)
} || {
	source+=("radare2::git+https://github.com/radareorg/radare2")
	md5sums+=('SKIP')
	_CMAKE_FLAGS+=(-DIAITO_USE_BUNDLED_RADARE2=ON)
	conflicts+=('radare2')
	provides+=('radare2')
}


pkgname=r2-iaito-git
epoch=1
pkgver=5.7.8.r0.gcccaa377
pkgrel=1
pkgdesc='Qt and C++ GUI for radare2 reverse engineering framework (fork of Cutter)'
url='https://github.com/radareorg/iaito'
arch=('x86_64')
license=('GPL3')
depends+=('python' 'capstone' 'qt5-base' 'qt5-svg' 'qt5-webengine' 'icu' 'python-shiboken2' 'pyside2' 'graphviz' 'qt5-tools' 'syntax-highlighting')
makedepends=('git' 'cmake' 'shiboken2' 'meson' 'ninja')
conflicts+=('radare2-cutter-git')
optdepends=()
backup=()
source+=("${pkgname}::git+https://github.com/radareorg/iaito.git${_fragment}"
	"iaito-translations::git+https://github.com/radareorg/iaito-translations")
md5sums+=('SKIP'
         'SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  git config submodule.src/translations.url "${srcdir}"/iaito-translations
  git  -c protocol.file.allow=always submodule update --init --recursive "${submodules[@]}" src/translations
  ((DISABLE_BUNDLED_RADARE)) || {
    git config submodule.radare2.url "${srcdir}"/radare2
    git -c protocol.file.allow=always submodule update --init --recursive "${submodules[@]}" radare2
  }
}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DIAITO_ENABLE_PYTHON=ON
    -DIAITO_ENABLE_PYTHON_BINDINGS=ON
    -DIAITO_USE_ADDITIONAL_RADARE2_PATHS=OFF
    -DIAITO_ENABLE_CRASH_REPORTS=OFF
    -DIAITO_ENABLE_GRAPHVIZ=ON
)
  cmake -B build -S "${srcdir}/${pkgname}/src" "${_CMAKE_FLAGS[@]}"
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -a ${pkgname}/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
}
