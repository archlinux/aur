# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>

pkgname=cortexfs-git
pkgver=0.1.21.r871.g32cd6ad
pkgrel=1
pkgdesc='FUSE filesystem interface for agent runtimes'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/cortexfs'
license=('MIT')
depends=('bubblewrap>=0.10.0' 'ca-certificates' 'curl' 'fuse3' 'libsecret' 'systemd' 'util-linux')
makedepends=('git' 'pkgconf' 'rust')
provides=('cortexfs' 'cortex-cli')
conflicts=('cortexfs' 'cortex-cli')
install=cortexfs.install
source=('git+https://github.com/LIghtJUNction/cortexfs.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cortexfs"
  local version
  version=$(awk '
    $0 == "[workspace.package]" { inside = 1; next }
    inside && /^version[[:space:]]*=/ {
      gsub(/[^0-9.]/, "", $0)
      print $0
      exit
    }
  ' Cargo.toml)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/cortexfs"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --release --locked \
    -p cortexfs -p cortexfs-mcp -p cortexfs-channel-tools \
    -p cortexfs-agents -p cortexfs-futureagi --bins
}

package() {
  cd "$srcdir/cortexfs"
  local binary unit
  install -d -m 0755 \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/systemd/system" \
    "$pkgdir/usr/lib/cortexfs" \
    "$pkgdir/usr/share/doc/cortexfs/docs/spec" \
    "$pkgdir/usr/share/licenses/cortexfs" \
    "$pkgdir/etc/cortexfs/providers.d" \
    "$pkgdir/var/lib/cortexfs/storage/generations"
  install -d -m 0700 "$pkgdir/var/lib/cortexfs/secrets" "$pkgdir/etc/cortexfs/channels"
  for binary in \
    ctx ctxterm ctxchat tsh cortexfs-mount cortexfs-object-runner \
    cortexfs-terminal-broker cortexfs-agent-runtime cortexfs-auth-runner \
    cortexfs-channel cortexfs-channel-tool ctxmcp \
    cortexfs-agent-architect cortexfs-agent-executor cortexfs-agent-product-manager \
    cortexfs-futureagi; do
    install -m 0755 "target/release/$binary" "$pkgdir/usr/bin/$binary"
  done
  for unit in \
    cortexfs.service cortexfs-agent@.service cortexfs-agent@.socket \
    cortexfs-terminal-broker.service cortexfs-terminal-broker.socket \
    cortexfs-channel@.service cortexfs-channel-bluesky.service \
    cortexfs-channel-driver@.service cortexfs-channel-telegram.service \
    cortexfs-channel-dingtalk.service cortexfs-channel-email.service \
    cortexfs-channel-gmail.service cortexfs-channel-irc.service \
    cortexfs-channel-matrix.service cortexfs-channel-mattermost.service \
    cortexfs-channel-mochat.service cortexfs-channel-notion.service \
    cortexfs-channel-qq.service cortexfs-channel-reddit.service \
    cortexfs-channel-twitch.service cortexfs-channel-twitter.service; do
    install -m 0644 "packaging/systemd/$unit" "$pkgdir/usr/lib/systemd/system/$unit"
  done
  install -m 0755 scripts/update-linux.sh "$pkgdir/usr/lib/cortexfs/update-linux"
  install -m 0644 README.md "$pkgdir/usr/share/doc/cortexfs/README.md"
  install -m 0644 docs/channels.md "$pkgdir/usr/share/doc/cortexfs/docs/channels.md"
  install -m 0644 docs/futureagi.md "$pkgdir/usr/share/doc/cortexfs/docs/futureagi.md"
  install -m 0644 docs/spec/*.md "$pkgdir/usr/share/doc/cortexfs/docs/spec/"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/cortexfs/LICENSE"
}
