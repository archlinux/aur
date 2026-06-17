# Maintainer: aur.chaotic.cx
# Contributor: robertfoster

_pkgname="whisper.cpp"
pkgname="$_pkgname"
pkgver="1.9.0"
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
sha256sums=('58252617f539320c42f8f40052433bce0556f78977d3f47f0ddcfe31a4722146')

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
