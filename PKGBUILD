# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=clauth
pkgver=0.17.0
pkgrel=2
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
sha256sums=('c6f58cad159ed15a7f956f264e43911aa64d8300c60c353efabc5be11c500869'
            '2f02edb553775db054b5266a6ceeeeea19880baac9c96dc0cf5272a7b77715a4')

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
  # the openssl fixture as flaky on a loaded host.
  cargo test --frozen --release --bins -- --skip daemon::
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
