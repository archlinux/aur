# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.7.3
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OPENBlas CPU optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('blas-openblas')
makedepends=(
  'cmake'
  'git'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake \
    -B build \
    -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_OPENBLAS=1

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  for i in build/bin/*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${pkgname}-${i//build\/bin\//}"
  done
  mv "${pkgdir}/usr/bin/${pkgname}-main" \
    "${pkgdir}/usr/bin/${pkgname}"
  rm "${pkgdir}/usr/include/"ggml*
  rm "${pkgdir}/usr/lib/libggml.so"

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('a36faa04885b45e4dd27751a37cb54300617717dbd3b7e5ec336f830e051a28c')
