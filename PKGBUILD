# Maintainer: MaslovKK <maslovkk@protonmail.com>
#
# Infernix built from the windows-<date> release tag: the tag names the release
# train, not the platform (the Linux build is supported, README "Quick start
# (Linux)"). Kernels compile for sm_120a only: needs an RTX 50-series GPU, the
# NVIDIA driver >= 580 and CUDA >= 13.4 (CMake refuses an older toolkit).
pkgname=infernix
pkgver=2026.11.20
pkgrel=1
pkgdesc="C++/CUDA inference engine serving Qwen models on RTX 50-series GPUs: CLI, server and launcher"
arch=('x86_64')
url="https://github.com/Wallawalla47/Infernix"
license=('Apache-2.0')
depends=('ca-certificates' 'cuda' 'curl' 'ffmpeg' 'libjpeg-turbo' 'nvidia-utils')
makedepends=('cmake' 'ninja' 'pkgconf' 'python')
_pdfium_release=chromium%2F8152
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/windows-${pkgver}.tar.gz"
        "https://github.com/bblanchon/pdfium-binaries/releases/download/${_pdfium_release}/pdfium-linux-x64.tgz")
sha256sums=('f7cde424373f30788ec3d7ee1004aaef7f54c53b34c3ce8dcffdabcae61f85f2'
            '384ab5c51882408a143a21f9c14dcd2caf1f75280ae41c554d0489b46c3dba9f')

prepare() {
  cd "${srcdir}/Infernix-windows-${pkgver}"
  # Unpack the PDFium archive into the tree fetch_pdfium.py's own pin checks.
  python3 -I tools/deps/fetch_pdfium.py --platform linux-x64 \
    --archive "${srcdir}/pdfium-linux-x64.tgz" --dest "${srcdir}/pdfium"
}

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
    -DINFERNIX_BUILD_BENCHMARKS=OFF \
    -DPDFIUM_ROOT="${srcdir}/pdfium" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_RPATH='$ORIGIN/../lib/infernix'
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/Infernix-windows-${pkgver}"
  local bin
  for bin in infernix infernix-serve infernix-launcher infernix-perplexity infernix-certify; do
    install -Dm755 "build/apps/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  # PDFium links shared and ships no distro package here (jellyfin-server owns
  # /usr/lib/libpdfium.so): the binaries find it through $ORIGIN/../lib/infernix.
  install -Dm755 "${srcdir}/pdfium/lib/libpdfium.so" "${pkgdir}/usr/lib/infernix/libpdfium.so"
  install -Dm644 "${srcdir}/pdfium/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdfium"
  cp -r "${srcdir}/pdfium/licenses" "${pkgdir}/usr/share/licenses/${pkgname}/pdfium"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 infernix.example.toml "${pkgdir}/usr/share/infernix/infernix.example.toml"
}
