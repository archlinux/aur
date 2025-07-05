# Maintainer: Needed!

pkgname=samrewritten-git
pkgver=r68.dacac70
pkgrel=1
pkgdesc="Unlock achievements and stats on Steam, and more!"
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL3')
arch=('x86_64')

makedepends=('cargo' 'gtk4' 'pkg-config')

depends=('gtk4')
optdepends=('libadwaita: for Adwaita styling')

source=("git+https://github.com/PaulCombal/SamRewritten.git")

# Generate these using `updpkgsums` after setting the `source` array.
# cd /path/to/PKGBUILD && makepkg -g >> PKGBUILD (then copy/paste)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/SamRewritten"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/SamRewritten"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

pkgver() {
    cd "${srcdir}/SamRewritten"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/SamRewritten"

  install -Dm755 "target/release/samrewritten" "$pkgdir/usr/bin/samrewritten"
  install -Dm644 "assets/icon_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/samrewritten.png"
  install -Dm644 "assets/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/samrewritten.png"
  install -Dm644 "package/samrewritten.desktop" "$pkgdir/usr/share/applications/samrewritten.desktop"
}