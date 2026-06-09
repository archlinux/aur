# Maintainer: Levi Zim <rsworktech@outlook.com>

_pkgname=ttyrecall
pkgname=$_pkgname-git
pkgver=0.0.1.r59.g32949e4
pkgrel=1
pkgdesc="Recall, but for terminals"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/kxxt/ttyrecall"
license=('AGPL-3.0-or-later AND GPL-2.0-or-later AND MIT-0')
depends=('gcc-libs' 'libbpf' 'libelf' 'pam' 'zlib' 'zstd')
makedepends=('bpf' 'cargo' 'clang' 'git' 'npm' 'pkgconf' 'ripgrep')
optdepends=('ripgrep: full-text search in the web UI and TUI')
source=("$_pkgname::git+https://github.com/kxxt/ttyrecall.git"
        "ttyrecalld.service"
        "ttyrecall-web.service")
b2sums=('SKIP'
        '8323fb059dcc4b2471be17193e37498158d697af09c359988fde6dd7aaac88203d5c0f4bcc68e49bbf6ea9f24fe4e64abf9e5c951a8f1b2ac1738d54646f1e0f'
        '1b2652950f47ceff9ab78e95be83c57cc932869f7d4a8bef45a17e70ee29155bee3e4e8356ee79e7789725aff01a5e42a4054b60858194ead0f5da9b34061df6')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-bin)
backup=('etc/ttyrecall/config.toml')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
  npm ci --prefix frontend
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable # Only the eBPF build need nightly toolchain
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo xtask build --release --no-default-features --skip-frontend-deps
  local compgen="target/release/$_pkgname generate-completion"
  mkdir -p completions
  $compgen bash >"completions/$_pkgname"
  $compgen elvish >"completions/$_pkgname.elv"
  $compgen fish >"completions/$_pkgname.fish"
  $compgen zsh >"completions/_$_pkgname"
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export ZSTD_SYS_USE_PKG_CONFIG=1
  cargo test --frozen --release
}

package() {
  cd "$_pkgname"
  # Binary
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  # Service
  install -vDm644 "$srcdir/ttyrecalld.service" "$pkgdir/usr/lib/systemd/system/ttyrecalld.service"
  install -vDm644 "$srcdir/ttyrecall-web.service" "$pkgdir/usr/lib/systemd/system/ttyrecall-web.service"
  # Web frontend
  install -dm755 "$pkgdir/usr/share/ttyrecall/web"
  cp -a frontend/dist/. "$pkgdir/usr/share/ttyrecall/web/"
  # Storage dir
  install -dm755 "$pkgdir/var/lib/ttyrecall"
  # Config
  install -dm755 "$pkgdir/etc/ttyrecall"
  install -Dm644 etc/config.toml "$pkgdir/etc/ttyrecall/config.toml"
  # Shell completions
  install -Dm644 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 "completions/$_pkgname.elv" -t "$pkgdir/usr/share/elvish/lib/"
  install -Dm644 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  # Docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # License
  install -Dm644 ttyrecall/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.AGPL3"
  install -Dm644 ttyrecall-ebpf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL2"
  install -Dm644 ttyrecall-common/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT0"
}

# vim:set ts=2 sw=2 et:
