# Maintainer: James McMurray <jamesmcm03@gmail.com>
pkgname=electric-eye
pkgver=0.1.0
pkgrel=1
pkgdesc="Explain what applications are doing with eBPF-based Linux activity monitoring"
arch=('x86_64')
url="https://github.com/jamesmcm/electric-eye"
license=('MIT')
depends=('gcc-libs' 'sqlite' 'systemd-libs' 'pacman')
makedepends=('rustup' 'clang' 'llvm' 'lld' 'bpf-linker' 'pkgconf' 'systemd')
install=electric-eye.install
# Keep the BPF object intact, but do not ship the daemon's debug sources in the
# main package.
options=('!strip' '!debug')
backup=('etc/electric-eye/allowlist.conf' 'etc/electric-eye/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-r3.tar.gz")
sha256sums=('0c75934f8b913f2cea3711001eb1978bf3de90d3502e85f161de9b9dc123f072')

build() {
  cd "$pkgname-$pkgver"
  source scripts/arch-toolchain.sh

  # The eBPF crate is a separate workspace built for bpfel-unknown-none. It is
  # pinned to the nightly whose bundled LLVM matches bpf-linker; see
  # docs/TOOLCHAIN.md before changing either pin.
  rustup toolchain install stable --profile minimal
  rustup default stable
  rustup toolchain install nightly-2026-01-20 --profile minimal --component rust-src
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build --remap-path-prefix=$HOME/.cargo=/build/cargo --remap-path-prefix=$HOME/.rustup=/build/rustup"
  cargo xtask build-ebpf
  cargo build --release --locked -p electric-eyed -p electric-eye-cli
}

check() {
  cd "$pkgname-$pkgver"
  source scripts/arch-toolchain.sh
  cargo test --workspace --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/electric-eyed "$pkgdir/usr/bin/electric-eyed"
  install -Dm755 target/release/electric-eye "$pkgdir/usr/bin/electric-eye"
  install -Dm644 target/bpfel-unknown-none/release/electric-eye-ebpf \
    "$pkgdir/usr/lib/electric-eye/electric-eye-ebpf"
  install -Dm644 packaging/systemd/electric-eye.service \
    "$pkgdir/usr/lib/systemd/system/electric-eye.service"
  install -Dm644 packaging/sysusers/electric-eye.conf \
    "$pkgdir/usr/lib/sysusers.d/electric-eye.conf"
  install -Dm644 packaging/allowlist.conf \
    "$pkgdir/etc/electric-eye/allowlist.conf"
  install -Dm644 config/default.toml "$pkgdir/etc/electric-eye/config.toml"
  install -Dm644 .opencode/skills/electric-eye/SKILL.md \
    "$pkgdir/usr/share/electric-eye/skills/electric-eye/SKILL.md"
  install -Dm644 .opencode/skills/electric-eye/references/queries.md \
    "$pkgdir/usr/share/electric-eye/skills/electric-eye/references/queries.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/electric-eye/README.md"
  install -Dm644 docs/PERFORMANCE.md "$pkgdir/usr/share/doc/electric-eye/PERFORMANCE.md"
  install -Dm644 packaging/man/electric-eye.1 "$pkgdir/usr/share/man/man1/electric-eye.1"
  install -Dm644 packaging/man/electric-eyed.8 "$pkgdir/usr/share/man/man8/electric-eyed.8"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh:
