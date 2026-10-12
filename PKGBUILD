# Maintainer: Perdixky <3293789706@qq.com>

pkgbase=clice-nightly-bin
pkgname=('clice-nightly-bin' 'clice-nightly-bin-debug')
pkgver=0.1.2026101209
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
  'bdd3df03e0d093d12a4b97e40aea7089372de6da6efbda320dec3bd17c721bd1'
  '3f1a9a9985146546a6a9a4a51cb71bb8ffd6812bf46ef38e42b999edbbf90659'
)

source_aarch64=(
  "clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_aarch64=(
  '7bb513278a098a38e1a3d91d741ad11b37834ae78ea48e6ad6e3cc455d91e45b'
  'cff31996650f47773f0be232dea8b4c75b2481bb3687ba6d8c69b1de2a5ef1f7'
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
