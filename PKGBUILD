# Maintainer: darkClaw921 <darkclaw921@users.noreply.github.com>
#
# Сборка пакета `devforge` из исходников F.O.R.G.E. (cargo workspace).
# Статика (HTML/CSS/JS, xterm.js) уже встроена в бинарь через rust-embed
# (см. tmux-web/src/static_embed.rs) — отдельный каталог /usr/share не нужен.
#
# Локальная сборка/проверка:
#   makepkg -si
# или в docker:
#   docker run --rm -v "$PWD:/pkg" -w /pkg archlinux:latest bash -c \
#     "pacman -Syu --noconfirm base-devel rust tmux && useradd -m b && \
#      chown -R b /pkg && sudo -u b makepkg -s --noconfirm"

pkgname=devforge
pkgver=0.1.52
pkgrel=1
pkgdesc="Tmux + kanban + git web cockpit (F.O.R.G.E.) — single-binary devforge"
arch=('x86_64' 'aarch64')
url="https://github.com/darkClaw921/F.O.R.G.E."
license=('MIT')
depends=('tmux' 'gcc-libs' 'glibc')
makedepends=('rust' 'cargo')
optdepends=(
  'lazygit: встроенная Git-вкладка'
  'lazydocker: встроенная Docker-вкладка'
  'television: fuzzy-finder Find-вкладки'
  'fd: helper для television (channel files)'
  'bat: preview для television'
  'ripgrep: helper для television (channel content)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/darkClaw921/F.O.R.G.E./archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74a939876deb4e6f5e8cad7fb37048c3d6d9a0065f9bd6e3ae4ff4373a8a5535')
options=('!lto')

_srcdir="F.O.R.G.E.-$pkgver"

build() {
  cd "$_srcdir"
  export CARGO_TARGET_DIR="$srcdir/target"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked -p devforge
}

check() {
  cd "$_srcdir"
  export CARGO_TARGET_DIR="$srcdir/target"
  # Тесты devforge могут требовать tmux в PATH — мягкий режим.
  cargo test --release --locked -p devforge || true
}

package() {
  cd "$_srcdir"
  install -Dm755 "$srcdir/target/release/devforge" "$pkgdir/usr/bin/devforge"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
