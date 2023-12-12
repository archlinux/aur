# Maintainer: Frederik Schwan <freswa at archlinux dot org>

_pkgname=OpenBoardView
pkgname=${_pkgname,,}
pkgver=9.95.0
pkgrel=2
pkgdesc='Linux SDL/ImGui edition software for viewing .brd files'
arch=('i686' 'x86_64')
url='https://openboardview.org/'
license=('MIT')
depends=('sdl2' 'sqlite' 'zlib' 'fontconfig' 'gtk3' 'libpng')
makedepends=('git' 'cmake' 'python')
source=("git+https://github.com/OpenBoardView/OpenBoardView.git#tag=${pkgver}"
        'git+https://github.com/gulrak/filesystem.git'
        'git+https://github.com/Dav1dde/glad.git'
        'git+https://github.com/ocornut/imgui.git'
        'git+https://github.com/nothings/stb.git'
        'git+https://github.com/sheredom/utf8.h.git'
        'git+https://github.com/madler/zlib.git'
        'gcc13.patch::https://github.com/OpenBoardView/OpenBoardView/commit/b03d0f69ec1611f5eb93f81291b4ba8c58cd29eb.diff'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '81aa5ce1297d2e54ffca843bfd3a5ca7d3c1039e1f7f65560eb54b6de87876ae5705d058c371921d26384177373d23639ce0acbaf8ffd15faf201b7f04ffcb3c')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.'src/filesystem'.url "${srcdir}"/filesystem
  git config submodule.'src/glad'.url "${srcdir}"/glad
  git config submodule.'src/zlib'.url "${srcdir}"/zlib
  git config submodule.'src/imgui'.url "${srcdir}"/imgui
  git config submodule.'src/stb'.url "${srcdir}"/stb
  git config submodule.'src/utf8'.url "${srcdir}"/utf8.h
  git config submodule.'src/zlib'.url "${srcdir}"/zlib
  git -c protocol.file.allow=always submodule update --recursive
  git apply "$srcdir/gcc13.patch"
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
