# Maintainer: robertfoster

pkgname=whisper.cpp
pkgver=1.7.5 # renovate: datasource=github-tags depName=ggerganov/whisper.cpp
pkgrel=4
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with OPENBlas CPU optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")
depends=('ggml-git' 'sdl2-compat')
makedepends=(
  'cmake'
  'git'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_SDL2=1 \
    -DWHISPER_USE_SYSTEM_GGML=1

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  cd "${srcdir}/build/bin"
  for i in whisper-*; do
    install -Dm755 "${i}" \
      "${pkgdir}/usr/bin/${i}"
  done

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('2fda42b57b7b8427d724551bd041616d85401fb9382e42b0349132a28920a34f')
