# Maintainer: Frederik Schwan <freswa at archlinux dot org>

_pkgname=OpenBoardView
pkgname=${_pkgname,,}
pkgver=9.95.2
pkgrel=1
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
)
b2sums=('ec3d0fe70350a429d0916774bcce4e77d2e91e326f7862e8746f27f1648dd795363cc9bf22ee288525e82db1af7d7ab0464cd25fd8929eac3bdc17ce76f0acd9'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

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
}

build() {
  cd ${_pkgname}
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make -C build
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}
