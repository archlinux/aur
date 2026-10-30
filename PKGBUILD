# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
#
# The repository's packaging/arch/PKGBUILD builds its working tree with the
# same dependencies and package(); keep the two alike. To release:
#   1. with the repository public, push the tag v$pkgver to
#      github.com/crazyboycjr/silent, and set pkgver here and pkgrel=1;
#   2. updpkgsums, which puts the tarball's sha256 in place of SKIP;
#   3. makepkg --printsrcinfo > .SRCINFO;
#   4. makepkg -f, a test build whose check() runs the tests, and
#      namcap PKGBUILD silent-*.pkg.tar.*;
#   5. git commit -am "silent $pkgver", and git push.
pkgname=silent
pkgver=1.0.0
pkgrel=1
pkgdesc='A borderless, fast file previewer for Nautilus on X11 (replaces sushi)'
arch=('x86_64')
url='https://github.com/crazyboycjr/silent'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'glib2' 'fontconfig' 'libseccomp' 'libarchive'
         'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'vulkan-icd-loader' 'vulkan-driver'
         'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good'
         'glycin' 'bubblewrap' 'hicolor-icon-theme'
         'noto-fonts' 'ttf-jetbrains-mono')
optdepends=('gst-libav: more video and audio formats'
            'gst-plugins-bad: more video formats and hardware decoding'
            'libheif: AVIF and HEIC pictures'
            'noto-fonts-cjk: Chinese, Japanese and Korean text'
            'noto-fonts-emoji: colour emoji'
            'ttf-carlito: Office documents set in Calibri or Aptos'
            'ttf-caladea: Office documents set in Cambria'
            'ttf-liberation: Office documents set in Arial, Times or Courier'
            'xdg-utils: opening the links of Markdown and HTML pages')
makedepends=('cargo' 'python')
provides=('sushi')
conflicts=('sushi' 'nemo-preview')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/silent -t "$pkgdir/usr/bin/"
  install -Dm644 data/org.gnome.NautilusPreviewer.service data/org.nemo.Preview.service \
    -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  local icon
  for icon in assets/icon/linux/hicolor/*/apps/silent.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/${icon#assets/icon/linux/}"
  done
}
