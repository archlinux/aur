# Maintainer: scottbass3 <valentin dot carroy at hotmail dot fr>

pkgname=artcraft-launcher-git
_name=artcraft-launcher
_appid=ai.storyteller.$_name
pkgver=0.3.2.r29.g78ef4a8
pkgrel=1
pkgdesc="Install, update and launch the Craft App Suite"
arch=('x86_64' 'aarch64')
url="https://github.com/storytold/craft-launcher"
license=('MIT OR Apache-2.0' 'LicenseRef-ArtCraft-Brand')
# Windowing and GPU libraries are dlopen()ed at runtime, so they are listed explicitly.
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
)
makedepends=('cargo' 'git')
optdepends=(
  'vulkan-icd-loader: Vulkan rendering'
  'xdg-desktop-portal: follow the system theme and animation settings'
  'flatpak: install Craft apps as Flatpaks'
)
provides=("$_name")
conflicts=("$_name")
options=('!lto')
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p "$_name"
}

check() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  "target/release/$_name" --version
}

package() {
  cd "$_name"
  install -Dm755 "target/release/$_name" "$pkgdir/usr/bin/$_name"
  install -Dm644 "packaging/linux/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"

  install -d "$pkgdir/usr/share/metainfo"
  sed -e "s/@VERSION@/${pkgver%%.r*}/g" \
    -e "s/@DATE@/$(date -u -d "@$(git log -1 --format=%ct)" +%Y-%m-%d)/g" \
    "packaging/linux/$_appid.metainfo.xml.in" > "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"

  install -d "$pkgdir/usr/share/icons"
  cp -r --no-preserve=ownership assets/app-icon/hicolor "$pkgdir/usr/share/icons/"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md NOTICE ATTRIBUTION.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT LICENSE-APACHE docs/brand/LICENSE-brand.txt
}
