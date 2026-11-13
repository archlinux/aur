# Maintainer: Perdixky <3293789706@qq.com>

pkgbase=clice-nightly-bin
pkgname=('clice-nightly-bin' 'clice-nightly-bin-debug')
pkgver=0.1.2026111303
pkgrel=1
pkgdesc='Nightly C++ language server and matching crash symbols'
arch=('x86_64' 'aarch64')
url='https://github.com/clice-io/clice'
license=('Apache-2.0')
makedepends=('patchelf' 'python' 'llvm')
options=('!strip' '!debug')

source=("symbolize-${pkgver}.py::https://raw.githubusercontent.com/clice-io/clice/v${pkgver}/scripts/symbolize.py")
sha256sums=('9027641f0686c1ca93a14f315ff4fd754bf896b9e28c13da2a279ae70a68d204')

source_x86_64=(
  "clice-${pkgver}.x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.x86_64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.x86_64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.x86_64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_x86_64=(
  'ea0533dc04779c01c8d89c27b78ac7f3a2b4fae80acdacea0e1d875199d7481d'
  '176546daf80a0d53b69f697975e6d203421025b12a292d6e57ab6ec17140c294'
)

source_aarch64=(
  "clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_aarch64=(
  '5ccbd7fb1615537ddaee380472206f3bc9e3906a2d3eda15344d5fc2f7abfecf'
  '75d9f014bc8c171ca40cec7b95e18983f3fe8eb68be63d11125ff8bbeb32c2eb'
)

package_clice-nightly-bin() {
  pkgdesc='Next-generation C++ language server (upstream nightly binary)'
  depends=('glibc')
  provides=("clice=${pkgver}")
  conflicts=('clice' 'clice-bin' 'clice-git')

  install -Dm755 "${srcdir}/clice/bin/clice" "${pkgdir}/usr/lib/clice/bin/clice"
  install -dm755 "${pkgdir}/usr/lib/clice/lib"
  cp -a "${srcdir}/clice/lib/clang" "${pkgdir}/usr/lib/clice/lib/"
  patchelf --remove-rpath "${pkgdir}/usr/lib/clice/bin/clice"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/clice/bin/clice "${pkgdir}/usr/bin/clice"
  install -Dm644 "${srcdir}/clice/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/clice/clice.toml" "${pkgdir}/usr/share/doc/${pkgname}/clice.toml"
}

package_clice-nightly-bin-debug() {
  pkgdesc='Matching GSYM crash symbols for clice nightly'
  depends=("clice-nightly-bin=${pkgver}-${pkgrel}" 'python' 'llvm')

  install -Dm644 "${srcdir}/clice.gsym" "${pkgdir}/usr/share/clice-nightly-bin/clice.gsym"
  install -Dm755 "${srcdir}/symbolize-${pkgver}.py" "${pkgdir}/usr/share/clice-nightly-bin/symbolize.py"
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/clice-symbolize" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/share/clice-nightly-bin/symbolize.py "$@" --symbols /usr/share/clice-nightly-bin/clice.gsym
EOF
  chmod 755 "${pkgdir}/usr/bin/clice-symbolize"
}
