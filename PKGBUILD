# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=waypointer
pkgver=0.1.0
pkgrel=1
pkgdesc="A tiny hand on a stick that points at things on your screen"
arch=('x86_64' 'aarch64')
url="https://github.com/Felitendo/waypointer"
license=('MIT')
# fontconfig, wayland and the Vulkan loader are dlopen'd.
# vulkan-driver: the loader alone draws nothing.
depends=('alsa-lib' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon'
         'vulkan-driver' 'vulkan-icd-loader' 'wayland')
optdepends=('kwin: shortcuts, Alt and Shift, and panels that stay usable on KDE Plasma'
            'xdg-desktop-portal: picking the picture for your own hand')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d7e33c2b4521b6fecda8237f2f57c50b049cf767a33ccb590a856f293c12fef3')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  # Upstream's Makefile: the binary, the hands and sounds, the icons, the
  # desktop file, the README and the license.
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
