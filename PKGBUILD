# Maintainer: Perdixky <3293789706@qq.com>

pkgbase=clice-nightly-bin
pkgname=('clice-nightly-bin' 'clice-nightly-bin-debug')
pkgver=0.1.2026101407
pkgrel=1
pkgdesc='Nightly C++ language server and matching crash symbols'
arch=('x86_64' 'aarch64')
url='https://github.com/clice-io/clice'
license=('Apache-2.0')
makedepends=('patchelf' 'python' 'llvm')
options=('!strip' '!debug')

source=("symbolize-${pkgver}.py::https://raw.githubusercontent.com/clice-io/clice/v${pkgver}/scripts/symbolize.py")
sha256sums=('a77049dbaddd1a8438cbc61a0ddb5dfece58c5981a49193bb2e79c38a637a6d9')

source_x86_64=(
  "clice-${pkgver}.x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.x86_64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.x86_64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.x86_64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_x86_64=(
  '37ee9fdedce4d060fa933ed8b75a743e51228fcced016d3a92f125a0f6f4e7ef'
  '6b48e9f5c72195190740fa2bece0318fefd9e69f925997a4c153e18141ae37a0'
)

source_aarch64=(
  "clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_aarch64=(
  '65ef6be55cceb11bb90aaddfe64e2b6473f42dfc9a9f5520a4ffcdd7333eb108'
  'c93a252147748588f8451144fe2a7a5fc1e0d51e6dcd6e8e5aaf53c494d43770'
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
