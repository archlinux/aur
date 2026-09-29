# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=darwan
pkgver=0.5.0
pkgrel=1
pkgdesc='Themes for the SDDM login screen and the Quickshell lockscreen, with a CLI, TUI and GUI'
arch=('x86_64')
url='https://github.com/mah3uz/darwan'
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'mpvqt'
  'polkit'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-multimedia'
  'qt6-multimedia-ffmpeg'
  'quickshell'
  'ttf-jetbrains-mono-nerd'
)
makedepends=('cargo' 'cmake' 'librsvg' 'lld' 'qt6-shadertools')
optdepends=(
  'sddm: use the themes on the login screen'
  'libfaketime: darwan preview --at'
  'noto-fonts-cjk: Chinese text in the Genshin theme'
)
# makepkg's -flto turns cxx-qt's C++ into GCC LTO objects that the Rust link can't resolve.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c6021532f07c386832719cd5d3b2f4a8ac4e25ad8823438391d628a390672d72')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # cxx-qt's headers use __FILE__; keep the build directory out of the binary.
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  cargo build --frozen --release --workspace
  cmake -S plugin -B target/plugin -DCMAKE_BUILD_TYPE=None -Wno-dev
  cmake --build target/plugin
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export QT_QPA_PLATFORM=offscreen
  cargo test --frozen --release --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/darwan target/release/darwan-gui -t "$pkgdir/usr/bin"
  install -Dm755 target/release/darwan-helper -t "$pkgdir/usr/lib/darwan"
  install -Dm755 target/plugin/qml/Darwan/libdarwanplugin.so -t "$pkgdir/usr/lib/darwan/qml/Darwan"
  install -Dm644 target/plugin/qml/Darwan/{qmldir,darwanplugin.qmltypes} -t "$pkgdir/usr/lib/darwan/qml/Darwan"
  install -d "$pkgdir/usr/share/darwan"
  cp -r --no-preserve=ownership runtime themes "$pkgdir/usr/share/darwan/"
  install -Dm644 packaging/arch/org.darwan.policy -t "$pkgdir/usr/share/polkit-1/actions"
  install -Dm644 packaging/arch/darwan.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/arch/darwan.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  # Launchers that can't render SVG, or render it without its filters, need fixed-size PNGs.
  for size in 16 22 24 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -w "$size" -h "$size" packaging/arch/darwan.svg \
      -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/darwan.png"
  done
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/darwan"
}
