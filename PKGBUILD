# Maintainer: aur.chaotic.cx

_pkgname="plutosvg"
pkgname="$_pkgname"
pkgver=0.0.8
pkgrel=1
pkgdesc="Tiny SVG rendering library in C"
url="https://github.com/sammycage/plutosvg"
license=("MIT")
arch=('x86_64')

depends=(
  'freetype2'
  'libplutovg.so' # aur/plutovg
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=('libplutosvg.so')

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git#tag=v$pkgver")
sha256sums=('9a9fda98d8f6b462f744711584264cd463ac9cee8fd7a01f08e5e954f5452ef2')

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -DPLUTOSVG_BUILD_EXAMPLES=ON
    -DPLUTOSVG_ENABLE_FREETYPE=ON
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # examples
  for i in emoji2png svg2png; do
    install -Dm755 "build/examples/$i" "${pkgdir}/usr/bin/$i-plutosvg"
  done
}
