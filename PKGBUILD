# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=hegn-git
pkgver=0.1.0.r68.g9029000
pkgrel=1
pkgdesc="Cloud Hypervisor MicroVM sandbox manager and TUI for coding agents (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Henriklmao/hegn"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'git')
optdepends=(
  'cloud-hypervisor: boot MicroVMs (available as cloud-hypervisor or cloud-hypervisor-bin in the AUR)'
  'virtiofsd: share the project directory into the guest'
  'lazygit: open projects with the g shortcut'
)
provides=('hegn')
conflicts=('hegn' 'hegn-bin')
makedepends=('cargo' 'rust' 'git')
install=hegn.install
# aws-lc-sys (pulled in by rustls/reqwest) does not link with makepkg's
# GCC LTO flags; the Rust release profile already uses thin LTO.
# The release profile strips symbols, so a -debug package would be empty.
options=('!lto' '!debug')
source=('hegn::git+https://github.com/Henriklmao/hegn.git'
  'hegn.desktop')
sha256sums=('SKIP'
  '05b3b79cf4d05728448a826f872296f2e8eca75fbb3716b36109c7c8e4584f63')

pkgver() {
  cd "$srcdir/hegn"
  local version
  version=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hegn"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/hegn"

  # Install binary
  install -Dm 755 "$srcdir/target/release/hegn" "$pkgdir/usr/bin/hegn"

  # Install desktop entry (globally)
  cd "$srcdir"
  install -Dm 644 "hegn.desktop" "$pkgdir/usr/share/applications/hegn.desktop"
}
