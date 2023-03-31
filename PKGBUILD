# Maintainer: robertfoster

pkgname=llama.cpp-git
pkgver=master.02c5b27
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=()
makedepends=('cmake')
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

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgname%-git}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${pkgname%-git}-main" \
    "${pkgdir}/usr/bin/${pkgname%-git}"
}

sha256sums=('SKIP')
