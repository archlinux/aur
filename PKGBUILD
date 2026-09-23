# Maintainer: Mohammadreza Khani
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.

pkgname=dicto
pkgver=0.6.2
pkgrel=1
pkgdesc="Minimal native dictionary app for MDX/MDD files"
arch=('x86_64')
url="https://github.com/logi-camp/dicto"
license=('AGPL-3.0-or-later')
depends=(
  'gtk3'
  'alsa-lib'
  'libxkbcommon'
  'xdotool'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'rust'
  'clang'
  'pkgconf'
)
optdepends=(
  'vulkan-driver: GPU rendering'
  'vulkan-intel: Intel GPU support'
)
options=(!lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/logi-camp/dicto/archive/refs/tags/v${pkgver}.tar.gz")
# Checksum is injected by CI from the real tag tarball (not SKIP).
b2sums=('790fe7ec813516833d10a59744ba6e48cb1ceb7ee80618bce9d9e923a1edd566d6be7052fa8a8f0385a2a3c6fb5be386c6596ee922967f3848443e68cc696579')

build() {
  cd "$srcdir/dicto-${pkgver}"

  export CARGO_TARGET_DIR="$srcdir/dicto-${pkgver}/target"
  cargo build --release --package dicto
}

package() {
  cd "$srcdir/dicto-${pkgver}"

  install -Dm755 "$srcdir/dicto-${pkgver}/target/release/dicto" \
    "$pkgdir/usr/bin/dicto"

  install -Dm644 "$srcdir/dicto-${pkgver}/packaging/arch/dicto.desktop" \
    "$pkgdir/usr/share/applications/dicto.desktop"

  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dicto.svg"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
