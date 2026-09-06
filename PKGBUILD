# Maintainer: Gentrit Biba <gentritbiba@gmail.com>
pkgname=cogpit-server
pkgver=2.6.0
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
# !strip: the bundled Claude CLI (node_modules/@anthropic-ai/claude-agent-sdk-*/claude)
# is a Bun-compiled executable whose embedded JS bundle lives in the ELF trailer.
# makepkg's default strip truncates it, silently degrading the CLI into a bare
# `bun` runtime (every SDK spawn then fails with: Script not found "stream-json").
# !debug: without strip there are no symbols to split into a -debug package.
options=('!strip' '!debug')

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
