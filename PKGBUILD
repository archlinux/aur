# Maintainer: lostmason <lostmason@tutamail.com>
# SPDX-License-Identifier: 0BSD
# Official PGO-optimized release binaries; no Rust or Node.js runtime required.
pkgname=tsc-rs-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='TypeScript compiler and language server ported to Rust (official binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/pingdotgg/ts-rust'
license=('MIT' 'Apache-2.0' 'BSD-3-Clause' 'Unicode-3.0')
provides=("tsc-rs=${pkgver}")
conflicts=('tsc-rs')
# Upstream ships static musl binaries. Preserve their optimized layout.
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/tsc-rs-${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/tsc-rs-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('909bc899363a368f5f482494dfe22061510ee3389d1a34e7ee1b4dd6a26fd512')
sha256sums_aarch64=('9f5f2cf7993f032a88b558921388662999d0ec5f7ad8e94edb142611be6f30c5')

package() {
  local platform
  case "${CARCH}" in
    x86_64) platform=linux-x64 ;;
    aarch64) platform=linux-arm64 ;;
  esac
  cd "${srcdir}/tsc-rs-${pkgver}-${platform}"

  # The compiler resolves its standard library next to its real executable.
  install -Dm755 tsc "${pkgdir}/usr/lib/tsc-rs/tsc"
  install -m644 lib*.d.ts "${pkgdir}/usr/lib/tsc-rs/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s ../lib/tsc-rs/tsc "${pkgdir}/usr/bin/tsc-rs"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
}
