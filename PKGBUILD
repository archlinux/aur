# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geopard
pkgver=1.6.0+3+g2c32ba5
pkgrel=1
pkgdesc="Colorful, adaptive gemini browser"
arch=('x86_64' 'aarch64')
url="https://ranfdev.com/projects/Geopard"
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
_commit=2c32ba550b9d275c2f8ce91f26a62a1bba974609
source=("git+https://github.com/ranfdev/Geopard.git#commit=${_commit}")
sha256sums=('ab5bb6e8b4ccc8528f4b6a4b04d93fcf3e6550422138f118d984e03fef5f1a55')

pkgver() {
  cd Geopard
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

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
