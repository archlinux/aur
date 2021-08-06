# Maintainer:  Wez Furlong <wez at wezfurlong dot org>
# Co-Maintainer: Bernat Gabor <gaborjbernat@gmail.com>

pkgname=("wezterm-git")
pkgdesc="A terminal emulator implemented in Rust, using OpenGL ES 2 for rendering."
pkgver=20210806.095157.40bb5ddb
pkgrel=1
arch=("x86_64" "i686")
url="https://github.com/wez/wezterm"
license=("MIT")
depends=(
  "dbus"
  "fontconfig"
  "hicolor-icon-theme"
  "libx11"
  "libxkbcommon-x11"
  "wayland"
  "xcb-util-image"
  "xcb-util-keysyms"
  "xcb-util-wm"
)
makedepends=("rust" "cargo" "cmake" "git" "pkgconf" "python")
source=(
  "wezterm::git+https://github.com/wez/wezterm.git"
  "harfbuzz::git+https://github.com/harfbuzz/harfbuzz.git"
  "libpng::git+https://github.com/glennrp/libpng.git"
  "zlib::git+https://github.com/madler/zlib.git"
  "freetype2::git+https://github.com/wez/freetype2.git"
)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")
conflicts=("wezterm-bin" "wezterm-nightly-bin")

prepare() {
  cd $srcdir/wezterm
  git submodule init
  git config -f .gitmodules "submodule.harfbuzz/harfbuzz.url" $srcdir/harfbuzz
  git config -f .gitmodules "submodule.freetype/libpng.url" $srcdir/libpng
  git config -f .gitmodules "submodule.deps/freetype/zlib.url" $srcdir/zlib
  git config -f .gitmodules "submodule.freetype2.url" $srcdir/freetype2
  git submodule update
}

pkgver() {
  cd $srcdir/wezterm
  git show -s "--format=%cd-%h" "--date=format:%Y%m%d-%H%M%S" | tr - .
}

build() {
  cd $srcdir/wezterm
	cargo build --release
}

package() {
	cd $srcdir/wezterm
  install -Dsm755 target/release/wezterm $pkgdir/usr/bin/wezterm
  install -Dsm755 target/release/wezterm-gui $pkgdir/usr/bin/wezterm-gui
  install -Dsm755 target/release/wezterm-mux-server $pkgdir/usr/bin/wezterm-mux-server
  install -Dsm755 target/release/strip-ansi-escapes $pkgdir/usr/bin/strip-ansi-escapes
  install -Dm644 assets/icon/terminal.png $pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
  install -Dm644 assets/wezterm.desktop $pkgdir/usr/share/applications/org.wezfurlong.wezterm.desktop
  install -Dm644 assets/wezterm.appdata.xml $pkgdir/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

