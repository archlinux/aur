# Maintainer: LandWarderer2772 <navaneethbinoy@gmail.com>
# Maintainer: Amog-us at amogussugomus dot proton dot me
pkgname=openclaude
pkgver=0.26.0
pkgrel=1
pkgdesc="OpenClaude is an open-source coding-agent CLI for cloud and local model providers."
arch=('x86_64' 'aarch64')
url="https://github.com/Gitlawb/openclaude"
license=('MIT' 'custom')
depends=('nodejs')
optdepends=('ripgrep: for faster file search within openclaude')
makedepends=('bun' 'git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1f437595cd5abfb3a2f6c8a3e24c5959369bdb2b8a25f85471598cce32793e9')

build() {
  cd "${pkgname}-${pkgver}"
  bun install
  bun run build
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # Install node_modules (needed at runtime)
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r node_modules "${pkgdir}/usr/lib/${pkgname}/node_modules"
  
  # Install bin script
  install -Dm755 bin/openclaude "${pkgdir}/usr/lib/${pkgname}/bin/openclaude"
  
  # Install built CLI
  install -Dm644 dist/cli.mjs "${pkgdir}/usr/lib/${pkgname}/dist/cli.mjs"
  rm -f "${pkgdir}/usr/lib/${pkgname}/dist/cli.mjs.map"

  # Install README and LICENSE
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Create wrapper script in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'

#!/bin/sh
exec node /usr/lib/openclaude/bin/openclaude "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
