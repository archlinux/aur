# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=paleta
pkgver=0.3.1
pkgrel=4
pkgdesc="Extract the dominant colors from any image."
arch=('x86_64')
url="https://github.com/nate-xyz/paleta"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'cargo'
  'git'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("git+https://github.com/nate-xyz/paleta.git#tag=v$pkgver")
sha256sums=('e4fd896fc1ab4112b8c26c5d24cb9a9262b10cb6c97551d84f6521bd1d19ca7c')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {

  # Only validate schema & desktop file
  meson test -C build "Validate schema file" "Validate desktop file" --no-rebuild --print-errorlogs

  # Use appstreamcli instead of appstream-util
  appstreamcli validate --no-net build/data/io.github.nate_xyz.Paleta.appdata.xml || :
}

package () {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
