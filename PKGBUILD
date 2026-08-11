# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
# Source of truth lives in the clicue repo at packaging/aur/PKGBUILD;
# `make publish` verifies pkgver against Cargo.toml, computes sha256sums,
# regenerates .SRCINFO, and pushes to AUR. Edit there, not in the AUR
# clone. sha256sums stays SKIP here BY DESIGN: this file ships inside the
# tarball it would checksum, so a committed sum is circular — the real
# sum lives in the published AUR copy, and the publish flow alarms if the
# tarball for an ALREADY-PUBLISHED version ever changes underneath it.
# Version bump: edit pkgver only. The publish flow's local makepkg cannot
# catch a missing depends entry (everything is installed on the dev box) —
# the real check before publishing a depends change is a clean-chroot
# build (devtools' extra-x86_64-build) plus namcap on the package.
pkgname=clicue
pkgver=0.4.0
pkgrel=1
pkgdesc="Live, contextual command guidance for zsh — a daemon behind a generated shim"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/clicue"
license=('MIT')
depends=('zsh' 'gcc-libs')
makedepends=('cargo')
optdepends=('man-db: glosses for system commands (whatis)')
install=clicue.install
# cargo already strips the release binary (profile.release strip=true), so
# makepkg's debug split would ship an empty -debug package — suppress it.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a8bb2137c29cb0098d43b30859b099fc32d9d841f33dc43b77b74c1170d92c06')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # All network work here, so build() runs offline in a clean chroot.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release -p clicue
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # --lib deliberately: the unit suite is self-contained (temp dirs, its
  # own sockets); the repo's e2e pty scenarios live outside the crate and
  # need an interactive sandbox no build chroot has. If an integration
  # suite ever lands under crates/clicue/tests/, revisit this flag —
  # today it excludes nothing but doc-tests.
  cargo test --frozen --release -p clicue --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/clicue "$pkgdir/usr/bin/clicue"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
