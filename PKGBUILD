# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="librepods"
pkgver=0.2.0alpha
_pkgver="${pkgver//alpha/-alpha}"
pkgrel=2
pkgdesc="AirPods liberated from Apple's ecosystem"
arch=(
  'x86_64'
)
url="https://github.com/kavishdevar/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'openssl'
  'qt6-base'
  'qt6-connectivity'
  'qt6-declarative'
)
makedepends=(
  'cmake>=2.8.12'
  'git'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${_pkgver}?signed"
)
b2sums=('4a3f8bb003fd9c304d1c88f202f3abb93ca023c4e283fcacb7fce6b9fbbeda4220622e4a7b2fc2af088b7073d23ec70be5ca73b178ac97dfbef3d45389f5101b')
validpgpkeys=(
  '2D58709F32193AA828ED43D72DBD7F9150AB7E67' # Kavish Devar (GitHub Signing Key) <mail@kavishdevar.me>
)

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}/linux"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_SKIP_RPATH:BOOL=TRUE
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
