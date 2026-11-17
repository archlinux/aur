# SPDX-License-Identifier: Apache-2.0
#
# The git package of the AUR for ahk: it builds the runner FROM SOURCE at
# the head of the repository, with the vector extensions of the machine of
# the user turned on (`-C target-cpu=native`). The plain `ahk` package
# installs the portable prebuilt binary of the release; this one tracks the
# tree and trades portability for the SIMD of the CPU it is built on.
pkgname=ahk-git
pkgver=0.5.0.r0.ga0c3b01a
pkgrel=1
pkgdesc="An AutoHotkey interpreter written in Rust (from source, git head, target-cpu=native)"
arch=('x86_64' 'aarch64')
url="https://github.com/danalec/ahk"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'git')
optdepends=('python: the helper of the desktop, for the keyboard, the pointer and the screen')
provides=('ahk')
conflicts=('ahk')
options=('!strip' '!lto')
source=("git+https://github.com/danalec/ahk.git")
sha256sums=('SKIP')

pkgver() {
  cd ahk
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ahk
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
