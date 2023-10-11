# Maintainer: robertfoster

pkgname=llama.cpp-git
pkgver=b1369
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=()
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

  rm -rf "${pkgdir}/usr/bin/"*

  cd "${srcdir}/${pkgname%-git}/build/bin/"
  for i in *; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgname%-git}-${i}"
  done
  mv "${pkgdir}/usr/bin/${pkgname%-git}-main" \
    "${pkgdir}/usr/bin/${pkgname%-git}"
}

sha256sums=('SKIP')
