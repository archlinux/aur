# Maintainer: Felitendo
# Contributor: Infrawrench LLC <astrid@infrawrench.com>
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=schist
pkgver=0.15.0
pkgrel=1
pkgdesc="Layered image editor with PSD and Affinity support"
arch=('x86_64' 'aarch64')
url="https://github.com/Infrawrench/schist"
license=('MIT')
# Upstream's own list (packaging/linux/aur/schist), checked by pkg.sh on every
# new version. fontconfig, wayland and the Vulkan loader are dlopen'd.
# vulkan-driver: the loader alone draws nothing.
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon'
         'libxkbcommon-x11' 'vulkan-driver' 'vulkan-icd-loader' 'wayland')
# dlopen'd, the app starts without it
optdepends=('libheif>=1.23.4: HEIC import')
# clang + mold: upstream's .cargo/config.toml links with them on x86_64
makedepends=('cargo' 'clang' 'mold')
# !lto: makepkg's -flto=auto turns ring's C objects into GCC bitcode that the
# clang link cannot read
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ff11e4d29c47d6a8fe8736cb7efa6293894211b4f96cf9fca5bca9a0e7bb2585')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p schist-app
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/schist "$pkgdir/usr/bin/schist"
  install -Dm644 packaging/linux/schist.desktop \
    "$pkgdir/usr/share/applications/schist.desktop"
  # named after the desktop entry's Icon= key
  install -Dm644 packaging/linux/schist.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.infrawrench.schist.png"
  install -Dm644 packaging/linux/com.infrawrench.schist.mime.xml \
    "$pkgdir/usr/share/mime/packages/com.infrawrench.schist.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
