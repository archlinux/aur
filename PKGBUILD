# Maintainer: Perdixky <3293789706@qq.com>

pkgbase=clice-nightly-bin
pkgname=('clice-nightly-bin' 'clice-nightly-bin-debug')
pkgver=0.1.2026102908
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
  'c10a1c78aef63bc9c0794a69fb99d10ec1865538c2f85b375001ce40e304ab65'
  'ca2159545013b175ee1f5739a54cc35fbdbc21c5723391f5da830cc1bba5bbfb'
)

source_aarch64=(
  "clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.tar.gz"
  "clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz::${url}/releases/download/v${pkgver}/clice-${pkgver}.aarch64-unknown-linux-gnu.symbols.tar.xz"
)
sha256sums_aarch64=(
  'e49fd4f2a4506083ffaa43e7dd6f76634a810438b355aae17be4981c342895db'
  '7e490ca577cd8bd40cd4ee753e8bbb38f3b62dfbc130aa5d787afb86d961f019'
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
