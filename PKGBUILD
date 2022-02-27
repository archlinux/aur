# Maintainer: Frederik Schwan <freswa at archlinux dot org>

_pkgname=OpenBoardView
pkgname=${_pkgname,,}
pkgver=8.0
pkgrel=2
pkgdesc='Linux SDL/ImGui edition software for viewing .brd files'
arch=('i686' 'x86_64')
url='https://openboardview.org/'
license=('MIT')
depends=('sdl2' 'sqlite' 'zlib' 'fontconfig' 'gtk3' 'libpng')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/OpenBoardView/OpenBoardView.git#tag=${pkgver}"
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/sheredom/utf8.h.git'
        'git+https://github.com/Dav1dde/glad.git'
        'git+https://github.com/OpenBoardView/imgui'
        fix-build-gcc10.patch
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '6fb0e86dc317ee55896050b541cf53cf178831a553c3d574d02982e5dab341683925f06b211f6c916ea13747fb6f39215164933954feeb174aaa6f9e6bea1265')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.'src/zlib'.url "${srcdir}"/zlib
  git config submodule.'src/utf8'.url "${srcdir}"/utf8.h
  git config submodule.'src/glad'.url "${srcdir}"/glad
  git config submodule.'src/imgui'.url "${srcdir}"/imgui
  git submodule update --recursive

  patch -Np1 -i "${srcdir}/fix-build-gcc10.patch"
}

build() {
  cd ${_pkgname}
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}
