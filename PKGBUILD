# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=maelstrom-git
pkgver=4.0.2.r0.gfdc0582
pkgrel=1
pkgdesc='Fast-action Asteroids-like arcade game'
arch=('x86_64')
license=('Zlib' 'CC-BY-3.0')
url="https://github.com/libsdl-org/Maelstrom"
conflicts=(maelstrom)
provides=(maelstrom)
depends=('gcc-libs' 'glibc' 'physfs' 'sdl3')
makedepends=('cmake' 'git' 'ninja' 'pkgconf')
source=("Maelstrom::git+$url"
        "SDL_net::git+https://github.com/libsdl-org/SDL_net"
        "physfs::git+https://github.com/icculus/physfs"
        "Maelstrom.desktop")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '88d3cb71ab486749e8bdd7af378977a46d046e7c76c59c94a155e728dc9ba7540f35e63b3c095e36e1d8b6b84382d37d2af3a6399d4b63c44a27fa03d5eb28a8')

pkgver() {
  cd "${srcdir}/Maelstrom"
  git describe --long --tags --abbrev=7 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Maelstrom"

  git submodule init external/SDL_net external/physfs
  git config submodule.external/SDL_net.url "${srcdir}/SDL_net"
  git config submodule.external/physfs.url "${srcdir}/physfs"
  git -c protocol.file.allow=always submodule update external/SDL_net external/physfs
}

build() {
  cmake -S "${srcdir}/Maelstrom" -B "${srcdir}/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_C_FLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=." \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=." \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSTANDALONE_INSTALL=OFF \
    -DSTEAM=OFF \
    -DUSE_VENDORED_PHYSFS=OFF \
    -DUSE_VENDORED_SDL=OFF \
    -DUSE_VENDORED_SDL_NET=ON
  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  install -Dm644 "${srcdir}/Maelstrom.desktop" "${pkgdir}/usr/share/applications/Maelstrom.desktop"
  for _icon in "${srcdir}"/Maelstrom/Data/Icons/icon-[0-9]*.png; do
    _size="${_icon##*/icon-}"
    _size="${_size%.png}"
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/Maelstrom.png"
  done
}
