# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geopard
pkgver=1.7.0
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/geopard"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'cargo'
  'git'
  'meson'
)
source=("git+https://github.com/ranfdev/Geopard.git#tag=v$pkgver")
sha256sums=('f2206585288a958d2e1041419a989426bef589231c3d53b64906e1487a3647fc')

prepare() {
  cd Geopard
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Geopard build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
