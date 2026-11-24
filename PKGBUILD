# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=openjkdf2-git
pkgver=0.9.9.r253.g3e4bc4a
pkgrel=1
pkgdesc='A function-by-function reimplementation of DF2 (Dark Forces 2) in C'
arch=('i686' 'x86_64')
url='https://github.com/shinyquagsire23/OpenJKDF2'
license=('0BSD' 'BSD-3-Clause')
depends=(
  'curl'
  'glew'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libglvnd'
  'libpng'
  'openal'
  'physfs'
  'sdl3'
  'sdl3_mixer'
)
makedepends=(
  'at-spi2-core'
  'cairo'
  'cmake'
  'freeglut'
  'gdk-pixbuf2'
  'git'
  'glu'
  'harfbuzz'
  'pango'
  'python-cogapp'
)
provides=('openjkdf2')
conflicts=('openjkdf2')
options=('!lto')
source=(
  "${pkgname}::git+${url}.git"
  'git+https://github.com/ValveSoftware/GameNetworkingSockets.git'
  'git+https://github.com/protocolbuffers/protobuf.git'
  'openjkdf2-use-system-libs.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP' # Run updpkgsums to populate
)

pkgver() {
  git -C "${pkgname}" describe --long --tags --abbrev=7 \
    | sed --regexp-extended 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  patch --directory="${pkgname}" --strip=1 --input="${srcdir}/openjkdf2-use-system-libs.patch"

  local _submodules=(
    'GameNetworkingSockets'
    'protobuf'
  )

  git -C "${pkgname}" submodule init "${_submodules[@]/#/lib/}"

  local _git_args=(-c protocol.file.allow=always)
  local _mod
  for _mod in "${_submodules[@]}"; do
    _git_args+=(-c "submodule.${_mod}.url=${srcdir}/${_mod}")
  done

  git -C "${pkgname}" "${_git_args[@]}" submodule update "${_submodules[@]/#/lib/}"
}

build() {
  export CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types"

  cmake -B build -S "${pkgname}" \
    -D CMAKE_BUILD_TYPE:STRING=None \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D CMAKE_SKIP_RPATH:BOOL=ON \
    -W no-dev

  cmake --build build
}

package() {
  install -D --mode=755 build/openjkdf2 "${pkgdir}/usr/bin/openjkdf2"

  # Desktop file
  install -D --mode=644 "${srcdir}/${pkgname}/packaging/flatpak/org.openjkdf2.OpenJKDF2.desktop" \
    "${pkgdir}/usr/share/applications/org.openjkdf2.OpenJKDF2.desktop"

  # Icons
  local _size
  for _size in 16 24 32 48 64 96 128 192 256 384 512; do
    install -D --mode=644 "${srcdir}/${pkgname}/packaging/flatpak/icons/${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/org.openjkdf2.OpenJKDF2.png"
  done
  install -D --mode=644 "${srcdir}/${pkgname}/packaging/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/org.openjkdf2.OpenJKDF2.png"

  # Licenses
  install -D --mode=644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D --mode=644 "${srcdir}/${pkgname}/lib/GameNetworkingSockets/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GameNetworkingSockets"
  install -D --mode=644 "${srcdir}/${pkgname}/lib/protobuf/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.protobuf"
}
