# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="librepods"
pkgver=0.2.0alpha2
_pkgver="$(sed -E 's/([a-z]+)/-\1./g' <<< "$pkgver")"
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
  'hicolor-icon-theme'
  'libgcc'
  'libpulse'
  'libstdc++'
  'openssl'
  'qt6-base'
  'qt6-connectivity'
  'qt6-declarative'
)
makedepends=(
  'cmake>=2.8.12'
  'git'
  'qt6-tools'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${_pkgver}" # ?signed
)
b2sums=('a4b8270797e9db96531a479edab382e1402c7faaa319a34d4f55814202b181282abdb2d9b8a51359a958424753e9669d83fb46596fcd519bbfdb81f2ea796399')
validpgpkeys=(
  '2D58709F32193AA828ED43D72DBD7F9150AB7E67' # Kavish Devar (GitHub Signing Key) <mail@kavishdevar.me>
)

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}/linux"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_SKIP_RPATH:BOOL=TRUE
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
