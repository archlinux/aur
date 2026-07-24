# Maintainer: javsanpar <javsanpar@riseup.net>

pkgname=acheron-git
_pkgname=acheron
pkgver=r192.5fcc437
pkgrel=1
pkgdesc='Alternative Discord client made in C++ with Qt 6'
arch=('x86_64')
url='https://github.com/ouwou/acheron'
license=('GPL-3.0-or-later')
depends=(
  qt6-base
  qt6-svg
  qt6-imageformats
  qtkeychain-qt6
  libstdc++
  libgcc
  glibc
  zlib
  curl
  openssl
  libsodium
  opus
  rnnoise
)
makedepends=(
  git
  cmake
  ninja
  qt6-tools
  nlohmann-json
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/ouwou/acheron.git"
  'acheron.desktop'
)
sha256sums=(
  'SKIP'
  '22348420fd0e6cce6c9cf24c1ba9f4498d27b1ed169a0e38d88a0ef6a379f8e6'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule update --init --filter=tree:0 vendor/{emoji-segmenter,libdave,miniaudio,mlspp,qrcodegen}
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -B build -S . -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DUSE_VCPKG=OFF
  cmake --build build
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 build/acheron "${pkgdir}/usr/lib/${_pkgname}/acheron"
  install -Dm644 certs/cacert.pem "${pkgdir}/usr/lib/${_pkgname}/certs/cacert.pem"
  install -Dm644 resources/TwemojiCOLRv0.ttf "${pkgdir}/usr/lib/${_pkgname}/fonts/TwemojiCOLRv0.ttf"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/acheron" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/acheron.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
