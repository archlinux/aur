# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
# Released by the srv release flow (infra docs/runbooks/release-flow.md): the tag v$pkgver of the
# canonical forge repository is the source, so this recipe and the crates.io crate (clck-kiosk;
# crates.io `clck` is taken) are built from the same commit. The binary stays `clck`.
pkgname=clck
pkgver=0.3.0
pkgrel=1
pkgdesc="Wayland session locker with live kiosk outputs"
arch=('x86_64')
url="https://git.corbet.ch/corbet-fsl/clck"
license=('LicenseRef-FSL-1.1-ALv2')
depends=('pam' 'wayland' 'libxkbcommon')
# clang: pam-sys generates its PAM bindings with bindgen (libclang) at build time.
makedepends=('cargo' 'git' 'clang')
conflicts=('nixlock' 'nixlock-bin' 'clck-bin')
replaces=('nixlock-bin' 'nixlock')
source=("$pkgname::git+https://git.corbet.ch/corbet-fsl/clck.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --frozen --bin clck
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/clck "$pkgdir/usr/bin/clck"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
