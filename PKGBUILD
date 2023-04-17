# Maintainer: robertfoster

pkgname=alpaca.cpp-git
pkgver=81bd894.r4.a0c74a7
pkgrel=1
pkgdesc="Locally run an Instruction-Tuned Chat-Style LLM"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/antimatter15/alpaca.cpp"
license=("MIT")
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  cmake -B ./build \
    -S . \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build ./build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  cmake --install ./build

  install -Dm755 "build/chat" \
    "${pkgdir}/usr/bin/${pkgname%-git}-chat"
  install -Dm755 "build/quantize" \
    "${pkgdir}/usr/bin/${pkgname%-git}-quantize"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP')
