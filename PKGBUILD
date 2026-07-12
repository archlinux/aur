# Maintainer: LIghtJUNction <lightjunction@users.noreply.github.com>

pkgname=cortexfs-git
pkgver=0.1.0.r568.ge844578
pkgrel=1
pkgdesc="Unix-style filesystem and CLI surface for AI agents"
arch=('x86_64')
url="https://github.com/LIghtJUNction/cortexfs"
license=('MIT')
depends=('fuse3' 'libgcc')
makedepends=('cargo' 'git')
provides=('cortexfs' 'cortex-cli')
conflicts=('cortexfs' 'cortex-cli')
source=(
  'git+https://github.com/LIghtJUNction/cortexfs.git'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/cortexfs"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/cortexfs"
  cargo build --release --locked -p cortexfs \
    --bin ctx \
    --bin tsh \
    --bin ctxterm \
    --bin cortexfs-mount \
    --bin cortexfs-agent-runtime \
    --bin cortexfs-object-runner \
    --all-features
}

package() {
  cd "$srcdir/cortexfs"
  install -Dm755 target/release/ctx "$pkgdir/usr/bin/ctx"
  install -Dm755 target/release/tsh "$pkgdir/usr/bin/tsh"
  install -Dm755 target/release/ctxterm "$pkgdir/usr/bin/ctxterm"
  install -Dm755 target/release/cortexfs-mount "$pkgdir/usr/bin/cortexfs-mount"
  install -Dm755 target/release/cortexfs-agent-runtime "$pkgdir/usr/bin/cortexfs-agent-runtime"
  install -Dm755 target/release/cortexfs-object-runner "$pkgdir/usr/bin/cortexfs-object-runner"
  install -Dm644 packaging/systemd/cortexfs.service "$pkgdir/usr/lib/systemd/system/cortexfs.service"
  install -Dm644 packaging/systemd/cortexfs-agent@.service "$pkgdir/usr/lib/systemd/system/cortexfs-agent@.service"
  install -Dm644 packaging/systemd/cortexfs-agent@.socket "$pkgdir/usr/lib/systemd/system/cortexfs-agent@.socket"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/DESIGN.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
  find docs/spec -type f -name '*.md' -print0 |
    while IFS= read -r -d '' doc; do
      install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
    done
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
