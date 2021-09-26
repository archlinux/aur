# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>

pkgname=np2kai-git
pkgver=0.86.rev.22.127.g3e8fedc7
pkgrel=1
pkgdesc="Neko Project II Kai, a PC-9801 emulator. (GIT version)"
arch=('x86_64')
url='http://domisan.sakura.ne.jp/article/np2kai/np2kai.html'
license=('MIT')
depends=('gtk2'
         'sdl2_mixer'
         'sdl2_ttf'
         )
makedepends=('cmake'
             'nasm'
             )
conflicts=('np2kai')
provides=('np2kai')
source=('np2kai::git+https://github.com/AZO234/NP2kai.git'
        'git+https://github.com/aminosbh/sdl2-cmake-modules.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd np2kai
  _ver="$(cat np2ver.h | grep -m1 NP2VER_CORE | cut -d ' ' -f2,3 | cut -d '"' -f1)"
  echo "${_ver}.$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p np2kai/build

  cd np2kai
    git config submodule.cmake/sdl2-cmake-modules.url "${srcdir}/sdl2-cmake-modules"
    git submodule update --init cmake/sdl2-cmake-modules
}

build() {
  cd np2kai/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man/man1 \
    -DBUILD_X=ON \
    -DBUILD_SDL=ON \
    -DBUILD_I286=ON \
    -DBUILD_HAXM=ON \
    -DUSE_X=ON \
    -DUSE_HAXM=ON \
    -DUSE_SDL=OFF \
    -DUSE_SDL_MIXER=ON \
    -DUSE_SDL_TTF=ON \
    -DUSE_ASYNCCPU=ON

  make
}

package() {
  make -C np2kai/build DESTDIR="${pkgdir}" install

  install -Dm644 np2kai/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
