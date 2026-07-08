# Maintainer: Parker Young <parker at parker8283 dot net>

pkgname=dolphin-memory-engine
pkgver=2026.06.25
pkgrel=1
pkgdesc="Dolphin emulator memory searcher"
arch=(x86_64)
url="https://github.com/aldelaro5/dolphin-memory-engine"
license=('MIT')
depends=(bash glibc hicolor-icon-theme libgcc_s.so libstdc++.so qt6-base qt6-svg)
makedepends=(cmake git)
optdepends=()
install="${pkgname}.install"
source=("git+https://github.com/aldelaro5/dolphin-memory-engine.git#tag=${pkgver}"
        "0001-desktop-exec.patch")
sha256sums=('01cb6884f31888b918cb5e66a60bae0bd7274be7e269297b3a5981034ef2dafd'
            'f90dbab8b97ed03249be5ab31cdf871424550ee73e5972ebe9afa0a5ca41f9b4')

prepare() {
  cd "${pkgname}"
  patch -Np1 -i ../0001-desktop-exec.patch
}

build() {
  export APP_VERSION="${pkgver}"
  local cmake_options=(
    -B build
    -S Source
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
  )

  cd "${pkgname}"
  cmake "${cmake_options[@]}"
  cmake --build build --parallel
}

package() {
  cd "${pkgname}"
  install -Dm 755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 ".github/assets/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 Source/Resources/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
