# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=rsdkv4-git
pkgver=1.3.2.r53.ge5f88fe
pkgrel=1
pkgdesc="Complete decompilation of Sonic 1 & Sonic 2 (2013) & Retro Engine (v4)"
arch=(x86_64)
url="https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation"
license=(custom)
depends=(glibc gcc-libs sdl2 glew libvorbis libglvnd)
makedepends=(git cmake)
provides=(rsdkv4)
conflicts=(rsdkv4)
source=("rsdkv4::git+https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/leethomason/tinyxml2.git"
        "git+https://github.com/chriskohlhoff/asio.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd rsdkv4
  git submodule init
  git config submodule.dependencies/all/stb-image.url "${srcdir}/stb"
  git config submodule.dependencies/all/tinyxml2.url "${srcdir}/tinyxml2"
  git config submodule.flatpak/shared-modules.update none
  git config submodule.dependencies/all/asio.url "${srcdir}/asio"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd rsdkv4
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "rsdkv4" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  #DESTDIR="$pkgdir" cmake --install build

  install -D build/RSDKv4 -t "${pkgdir}/usr/bin"
  ln -s /usr/bin/RSDKv4 "${pkgdir}/usr/bin/rsdkv4"

  install -D rsdkv4/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
