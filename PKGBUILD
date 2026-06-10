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
        "ttyrecall-web.service"
        "ttyrecall.sysusers"
        "ttyrecall.tmpfiles")
b2sums=('SKIP'
        '557f4a71f91d45c78a710c75d7806db751a0a15125966c8f51a0b901ef0d1f8988df5c15a0d74b6ade381bf5744c42cbdfb44c93e5ed2d5117fa835d54e4bf23'
        '1a994cb2aa0806cbff8089d34e32a34736f04ce3a2712efafd68ebf36b3954463bdc40e550bd8294ea1e397bf2ba639ce07e264c6426cc8cda100bc250c2b7eb'
        '669c8b9c38f078cd0fcac52f5a2beee7a70878a591faef2904fac8b2ff505374bedd7e6dcd80cc8509b7ce63e4879ea718b9a67c2e803d4c846be7e02b87d7a8'
        'c76f2629694f7d9ad4d1fb07615f7e30032227dceb7e26522a1805702fc6cb6a4d12dc3561a172b1930d6f74ab8725733635c1e9ae2992a2d2a2b36a7402410d')
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
  install -vDm644 "$srcdir/ttyrecall.sysusers" "$pkgdir/usr/lib/sysusers.d/ttyrecall.conf"
  install -vDm644 "$srcdir/ttyrecall.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ttyrecall.conf"
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
