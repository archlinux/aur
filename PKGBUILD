# Maintainer: MaslovKK <maslovkk@protonmail.com>

pkgname=infernix
pkgver=2026.11.07
pkgrel=1
pkgdesc="C++/CUDA inference engine serving Qwen models on RTX 50-series GPUs: CLI, server and launcher"
arch=('x86_64')
url="https://github.com/Wallawalla47/Infernix"
license=('Apache-2.0')
depends=('ca-certificates' 'cuda' 'curl' 'ffmpeg' 'libjpeg-turbo' 'nvidia-utils')
makedepends=('cmake' 'ninja' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/windows-${pkgver}.tar.gz")
sha256sums=('a3a25aca535b7acde4a04f25e8e31e14efe8a4792f3d2024d0b19a0da6367f61')

build() {
  cd "${srcdir}/Infernix-windows-${pkgver}"
  # Arch's CFLAGS add -Werror=format-security; the certify summary writer's line()
  # helper takes its printf format as a function argument, which trips it.
  export CXXFLAGS="$CXXFLAGS -Wno-error=format-security"
  # The tarball has no .git for the build-id stamp; record the release tag.
  export INFERNIX_BUILD_ID="windows-${pkgver}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DINFERNIX_BUILD_APPS=ON \
    -DBUILD_TESTING=OFF \
    -DINFERNIX_BUILD_BENCHMARKS=OFF
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/Infernix-windows-${pkgver}"
  local bin
  for bin in infernix infernix-serve infernix-launcher infernix-perplexity infernix-certify; do
    install -Dm755 "build/apps/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 infernix.example.toml "${pkgdir}/usr/share/infernix/infernix.example.toml"
}
