# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=clauth
pkgver=0.18.0
pkgrel=1
pkgdesc="Claude Code multi-account manager and usage monitor with auto-switch (CLI, TUI, MCP plugin)"
arch=('x86_64' 'aarch64')
url="https://github.com/uwuclxdy/clauth"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('claude-code: clauth start, resume, delegate and the Claude Code plugin'
            'openai-codex: codex profiles'
            'herdr: pane tags and the herdr plugin'
            'inetutils: hostname lookup for the daemon --listen certificate')
conflicts=('clauth-bin')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uwuclxdy/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname-notify-only-update.patch")
sha256sums=('b89423c6095f1651f6ab4e0667505956a6ac7f1ecacb59b8013d9ad2dfea7cd5'
            'fed8d959821e18c4cb18756eabd85569013e937ce75932afcec69748cfd6cd95')

prepare() {
  cd "$pkgname-$pkgver"
  # A binary under /usr/bin belongs to pacman: report a new release, never
  # download one over it.
  patch -Np1 -i "$srcdir/$pkgname-notify-only-update.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Unit tests only: the suites under tests/ start daemons and MCP servers. The
  # daemon:: tests shell out to ps, hostname and openssl, and upstream marks
  # the openssl fixture as flaky on a loaded host. The update toast test checks
  # the cargo install hint the notify-only-update patch replaces, and the
  # unbindable-port test races other processes for a free local port.
  cargo test --frozen --release --bins -- --skip daemon:: \
    --skip tui::app::tests::update_banner_and_row_text_prose_style_their_keys_and_commands \
    --skip proxy::tests::a_silent_but_unbindable_port_is_refused_as_unbindable
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _home="$srcdir/completions-home"
  mkdir -p "$_home"
  HOME="$_home" "target/release/$pkgname" completions bash |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  HOME="$_home" "target/release/$pkgname" completions zsh |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  HOME="$_home" "target/release/$pkgname" completions fish |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
