# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=citron
pkgver=0.4
pkgrel=4
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://citron-emu.org
license=(GPL-2.0-or-later)
provides=('citron')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'ffmpeg' 'sdl2' 'gamemode' 'hicolor-icon-theme' 'brotli' 'libusb')
makedepends=('curl' 'git' 'boost' 'catch2' 'cmake' 'clang' 'fmt' 'doxygen' 'python-pip' 'glslang' 'libzip' 'lz4' 'mbedtls' 'ninja' 'nlohmann-json' 'zip' 'unzip' 'libzip')
conflicts=('citron')
options=(!debug)
_tag="v${pkgver}-canary-refresh"
source=(${pkgname}::git+https://git.citron-emu.org/Citron/Citron.git#tag=${_tag})
b2sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git rm -f externals/SDL
  git rm -f externals/ffmpeg/ffmpeg
  find . -type d -name ".git" -execdir git submodule update --init --recursive \;
}

build() {
  cd "$srcdir/$pkgname"
  cmake -B build -GNinja \
    -DCITRON_USE_BUNDLED_VCPKG=ON \
    -DCITRON_USE_BUNDLED_QT=OFF \
    -DCITRON_USE_BUNDLED_FFMPEG=OFF \
    -DCITRON_USE_BUNDLED_SDL2=OFF \
    -DCITRON_USE_EXTERNAL_SDL2=OFF \
    -DCITRON_TESTS=OFF \
    -DCITRON_USE_LLVM_DEMANGLE=OFF \
    -DCITRON_ENABLE_LTO=ON \
    -DCITRON_USE_QT_MULTIMEDIA=ON \
    -DCITRON_USE_QT_WEB_ENGINE=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DCITRON_USE_FASTER_LD=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-march=native" \
    -DCMAKE_CXX_FLAGS="-march=native"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C "$srcdir/$pkgname"/build install
}
