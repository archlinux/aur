# Maintainer: aur.chaotic.cx
# Contributor: robertfoster

_pkgname="whisper.cpp"
pkgname="$_pkgname"
pkgver="1.8.6"
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
url="https://github.com/ggml-org/whisper.cpp"
license=('MIT')
arch=('armv7h' 'aarch64' 'x86_64')

depends=(
  'libggml'
  'sdl2'
)
makedepends=(
  'cmake'
  'ninja'
)

provides=('libwhisper.so')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('f8e632016ceae556f3132a16c7f704be1e7715595041f474fa81a2b64c1abf7c')

build() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DWHISPER_BUILD_TESTS=$(CHECKFUNC)
    -DWHISPER_SDL2=ON
    -DWHISPER_USE_SYSTEM_GGML=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
