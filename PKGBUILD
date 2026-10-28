# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=hegn-git
pkgver=0.1.0.r127.g82b962f
pkgrel=1
pkgdesc='Cloud Hypervisor sandbox manager and TUI for coding agents (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/Henriklmao/hegn'
license=('MIT' 'Apache-2.0')
# cloud-hypervisor-bin provides 'cloud-hypervisor', so either AUR package
# satisfies this dependency. hegn cannot start without the VMM or virtiofsd.
depends=('gcc-libs' 'git' 'cloud-hypervisor' 'virtiofsd')
optdepends=(
  'lazygit: open git with the g shortcut'
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
  '75d2c9907a9895a7f43d0626e186b18d567112cb29596c3811c90de66cc6e77f')

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
    install -Dm755 "$srcdir/target/release/hegn" "$pkgdir/usr/bin/hegn"
    install -Dm644 "$srcdir/hegn.desktop" "$pkgdir/usr/share/applications/hegn.desktop"
}
