# Maintainer: Gentrit Biba <gentritbiba@gmail.com>
pkgname=cogpit-server
pkgver=0.4.0
pkgrel=1
pkgdesc="Headless web server for Cogpit — Claude Code session dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/gentritbiba/cogpit"
license=('MIT')
depends=('bun')
makedepends=('git' 'python' 'nodejs')
conflicts=()
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd cogpit
  bun install --frozen-lockfile
  bun run build
}

package() {
  cd cogpit

  # Install application files
  install -dm755 "${pkgdir}/opt/${pkgname}"

  # Copy built frontend
  cp -r dist "${pkgdir}/opt/${pkgname}/"

  # Copy server + electron/server.ts (reused by standalone entry point)
  cp -r server "${pkgdir}/opt/${pkgname}/"
  cp -r electron "${pkgdir}/opt/${pkgname}/"
  cp -r src "${pkgdir}/opt/${pkgname}/"

  # Copy cogpit-memory CLI source (used by /api/cogpit-search route)
  install -dm755 "${pkgdir}/opt/${pkgname}/packages/cogpit-memory"
  cp -r packages/cogpit-memory/src "${pkgdir}/opt/${pkgname}/packages/cogpit-memory/"
  cp packages/cogpit-memory/package.json "${pkgdir}/opt/${pkgname}/packages/cogpit-memory/"
  cp package.json "${pkgdir}/opt/${pkgname}/"
  cp tsconfig.json "${pkgdir}/opt/${pkgname}/" 2>/dev/null || true
  cp -r node_modules "${pkgdir}/opt/${pkgname}/"

  # Install systemd user unit
  install -Dm644 aur/cogpit-server.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  # Install license (if present)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
