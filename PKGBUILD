# Maintainer: MaslovKK <maslovkk@protonmail.com>

pkgname=infernix-git
pkgver=2026.11.07.297.gfcac555f
pkgrel=1
pkgdesc="C++/CUDA inference engine serving Qwen models on RTX 50-series GPUs: CLI, server and launcher (git)"
arch=('x86_64')
url="https://github.com/Wallawalla47/Infernix"
license=('Apache-2.0')
depends=('ca-certificates' 'cuda' 'curl' 'ffmpeg' 'libjpeg-turbo' 'nvidia-utils')
makedepends=('cmake' 'git' 'ninja' 'pkgconf' 'python')
provides=('infernix')
conflicts=('infernix')
source=('git+https://github.com/Wallawalla47/Infernix.git')
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/Infernix"
  # windows-2026.11.07-157-g8a6467f2 -> 2026.11.07.157.g8a6467f2
  git describe --tags | sed -e 's/^windows-//' -e 's/-/./g'
}

build() {
  cd "${srcdir}/Infernix"
  # Arch's CFLAGS add -Werror=format-security; the certify summary writer's line()
  # helper takes its printf format as a function argument, which trips it.
  export CXXFLAGS="$CXXFLAGS -Wno-error=format-security"
  # PDFium at the release the checkout pins (downloads when the pin moved).
  local pdfium_root
  pdfium_root=$(python3 -I tools/deps/fetch_pdfium.py --platform linux-x64)
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DINFERNIX_BUILD_APPS=ON \
    -DBUILD_TESTING=OFF \
    -DINFERNIX_BUILD_BENCHMARKS=OFF \
    -DPDFIUM_ROOT="${pdfium_root}" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_RPATH='$ORIGIN/../lib/infernix'
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/Infernix"
  local bin
  for bin in infernix infernix-serve infernix-launcher infernix-perplexity infernix-certify; do
    install -Dm755 "build/apps/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  # PDFium links shared and ships no distro package here (jellyfin-server owns
  # /usr/lib/libpdfium.so): the binaries find it through $ORIGIN/../lib/infernix.
  local pdfium_root
  pdfium_root=$(python3 -I tools/deps/fetch_pdfium.py --platform linux-x64)
  install -Dm755 "${pdfium_root}/lib/libpdfium.so" "${pkgdir}/usr/lib/infernix/libpdfium.so"
  install -Dm644 "${pdfium_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdfium"
  cp -r "${pdfium_root}/licenses" "${pkgdir}/usr/share/licenses/${pkgname}/pdfium"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 infernix.example.toml "${pkgdir}/usr/share/infernix/infernix.example.toml"
}
