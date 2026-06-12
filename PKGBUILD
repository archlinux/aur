# Maintainer: LIghtJUNction
pkgname=humen-mcp-git
pkgver=0.1.7.r46.ga5367d9
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/humen-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl' 'sudo')
makedepends=('bun' 'cargo' 'git')
provides=('humen-mcp')
conflicts=('humen-mcp')
backup=('etc/humen-mcp.env')
install=humen-mcp.install
source=('git+https://github.com/LIghtJUNction/humen-mcp.git')
sha256sums=('SKIP')

pkgver() {
  cd humen-mcp
  printf '0.1.7.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd humen-mcp
  git submodule update --init humen-mcp-webui
}

build() {
  cd humen-mcp
  (
    cd humen-mcp-webui
    bun install --frozen-lockfile
    bun run build
  )
  cargo build --release --locked
}

package() {
  cd humen-mcp
  install -Dm755 target/release/humen-mcp "$pkgdir/usr/bin/humen-mcp"
  install -Dm644 packaging/systemd/humen-mcp.service "$pkgdir/usr/lib/systemd/system/humen-mcp.service"
  install -Dm644 packaging/systemd/humen-mcp-self-update.service "$pkgdir/usr/lib/systemd/system/humen-mcp-self-update.service"
  install -Dm755 packaging/scripts/humen-mcp-self-update "$pkgdir/usr/lib/humen-mcp/humen-mcp-self-update"
  install -Dm440 packaging/sudoers/humen-mcp-self-update "$pkgdir/etc/sudoers.d/humen-mcp-self-update"
  install -Dm644 packaging/sysusers/humen-mcp.conf "$pkgdir/usr/lib/sysusers.d/humen-mcp.conf"
  install -Dm644 packaging/tmpfiles/humen-mcp.conf "$pkgdir/usr/lib/tmpfiles.d/humen-mcp.conf"
  install -Dm640 env.example "$pkgdir/etc/humen-mcp.env"
  install -dm755 "$pkgdir/usr/share/humen-mcp/web"
  cp -a --no-preserve=ownership humen-mcp-webui/dist/. "$pkgdir/usr/share/humen-mcp/web/"
}
