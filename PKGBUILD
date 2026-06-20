# Maintainer: LIghtJUNction
pkgname=human-mcp-git
pkgver=0.1.20.r60.g54c78cb
pkgrel=1
pkgdesc='Human-in-the-loop MCP server'
arch=('x86_64')
url='https://github.com/LIghtJUNction/human-mcp'
license=('MIT')
depends=('gcc-libs' 'openssl' 'sudo')
makedepends=('bun' 'cargo' 'git')
provides=('human-mcp')
conflicts=('human-mcp')
backup=('etc/human-mcp.env')
install=human-mcp.install
source=('git+https://github.com/LIghtJUNction/human-mcp.git')
sha256sums=('SKIP')

pkgver() {
  cd human-mcp
  printf '0.1.20.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd human-mcp
  git submodule update --init human-mcp-webui
}

build() {
  cd human-mcp
  (
    cd human-mcp-webui
    bun install --frozen-lockfile
    bun run build
  )
  cargo build --release --locked
}

package() {
  cd human-mcp
  install -Dm755 target/release/human-mcp "$pkgdir/usr/bin/human-mcp"
  install -Dm644 packaging/systemd/human-mcp.service "$pkgdir/usr/lib/systemd/system/human-mcp.service"
  install -Dm644 packaging/systemd/human-mcp-self-update.service "$pkgdir/usr/lib/systemd/system/human-mcp-self-update.service"
  install -Dm755 packaging/scripts/human-mcp-self-update "$pkgdir/usr/lib/human-mcp/human-mcp-self-update"
  install -Dm440 packaging/sudoers/human-mcp-self-update "$pkgdir/etc/sudoers.d/human-mcp-self-update"
  install -Dm644 packaging/sysusers/human-mcp.conf "$pkgdir/usr/lib/sysusers.d/human-mcp.conf"
  install -Dm644 packaging/tmpfiles/human-mcp.conf "$pkgdir/usr/lib/tmpfiles.d/human-mcp.conf"
  install -Dm640 env.example "$pkgdir/etc/human-mcp.env"
  install -dm755 "$pkgdir/usr/share/human-mcp/web"
  cp -a --no-preserve=ownership human-mcp-webui/dist/. "$pkgdir/usr/share/human-mcp/web/"
}
