# SPDX-License-Identifier: Apache-2.0
#
# The SIMD package of the AUR for ahk: it builds the runner FROM SOURCE on
# the machine of the user, with the vector extensions of that machine turned
# on (`-C target-cpu=native`). The plain `ahk` package installs the portable
# prebuilt binary of the release; this one is opt-in and trades portability
# for the SIMD of the CPU it is built on -- a binary of it only runs on a CPU
# at least as new as the one that built it.
#
# The source is the tag of the release, so the version is the same as the
# binary package; the checksum is SKIP because it is a VCS source pinned to
# the tag.
pkgname=ahk-simd
pkgver=0.5.0
pkgrel=1
pkgdesc="An AutoHotkey interpreter written in Rust (SIMD build from source, target-cpu=native)"
arch=('x86_64' 'aarch64')
url="https://github.com/danalec/ahk"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'git')
optdepends=('python: the helper of the desktop, for the keyboard, the pointer and the screen')
provides=('ahk')
conflicts=('ahk' 'ahk-git')
options=('!strip' '!lto')
source=("git+https://github.com/danalec/ahk.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd ahk
  # native: the build is local, so the SIMD of the machine of the user is
  # exactly what the binary may use. The flags go to the target only, so the
  # build-scripts of the host are not built with a CPU they may not have.
  local t
  t=$(rustc -vV | sed -n 's/^host: //p')
  local T
  T=$(printf '%s' "$t" | tr 'a-z-' 'A-Z_')
  export CARGO_TARGET_${T}_RUSTFLAGS="-C target-cpu=native"
  cargo build --release --locked -p ahk-cli
}

package() {
  cd ahk
  install -Dm755 target/release/ahk "$pkgdir/usr/bin/ahk"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [ -d resources/icons/hicolor ]; then
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r resources/icons/hicolor "$pkgdir/usr/share/icons/hicolor"
  fi
  if [ -f resources/desktop/ahk.desktop ]; then
    install -Dm644 resources/desktop/ahk.desktop "$pkgdir/usr/share/applications/ahk.desktop"
  fi
}
