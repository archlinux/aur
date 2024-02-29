# Maintainer:  Alex Amellal <aur@alexamellal.com>

pkgname=("weenyterm-git")
pkgdesc="The weeniest terminal for Arch Linux"
pkgver=20240121.180215.76028ca1
pkgrel=2
arch=("x86_64" "i686" "aarch64")
url="https://github.com/amellalalex/weenyterm"
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
makedepends=("cargo" "cmake" "git" "pkgconf" "python")
options=(!lto)
provides=("weenyterm" "weenyterm-gui" "weenyterm-mux-server" "weenyterm-shell-integration" "weenyterm-terminfo")
conflicts=("weenyterm" "weenyterm-bin" "weenyterm-nightly-bin" "weenyterm-shell-integration" "weenyterm-terminfo")
source=(
  "weenyterm::git+https://github.com/amellalalex/weenyterm.git"
  "harfbuzz::git+https://github.com/harfbuzz/harfbuzz.git"
  "libpng::git+https://github.com/glennrp/libpng.git"
  "zlib::git+https://github.com/madler/zlib.git"
  "freetype2::git+https://github.com/wez/freetype2.git"
)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
  cd "$srcdir/weenyterm"
  git submodule init
  git config "submodule.harfbuzz/harfbuzz.url" "$srcdir/harfbuzz"
  git config "submodule.freetype/libpng.url" "$srcdir/libpng"
  git config "submodule.deps/freetype/zlib.url" "$srcdir/zlib"
  git config "submodule.freetype2.url" "$srcdir/freetype2"
  git -c protocol.file.allow=always submodule update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$srcdir/weenyterm" || exit 1
  git -c "core.abbrev=8" show -s "--format=%cd-%h" "--date=format:%Y%m%d-%H%M%S" | tr - .
}

build() {
  cd "$srcdir/weenyterm" || exit 1
  bash ci/check-rust-version.sh
  cargo build --frozen --release
  tic -x -o "$srcdir/terminfo" "$srcdir/weenyterm/termwiz/data/weenyterm.terminfo"
}

package() {
  cd "$srcdir/weenyterm" || exit 1

  install -Dsm755 target/release/weenyterm "$pkgdir/usr/bin/weenyterm"
  install -Dsm755 target/release/weenyterm-gui "$pkgdir/usr/bin/weenyterm-gui"
  install -Dsm755 target/release/weenyterm-mux-server "$pkgdir/usr/bin/weenyterm-mux-server"
  install -Dsm755 target/release/strip-ansi-escapes "$pkgdir/usr/bin/strip-ansi-escapes"

  install -Dm644 assets/icon/terminal.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.weenyterm.png"
  install -Dm644 assets/weenyterm.desktop "$pkgdir/usr/share/applications/org.wezfurlong.weenyterm.desktop"
  install -Dm644 assets/weenyterm.appdata.xml "$pkgdir/usr/share/metainfo/org.wezfurlong.weenyterm.appdata.xml"
  install -Dm644 assets/weenyterm-nautilus.py "$pkgdir/usr/share/nautilus-python/extensions/weenyterm-nautilus.py"
  install -Dm644 ../terminfo/w/weenyterm "$pkgdir/usr/share/terminfo/w/weenyterm"

  install -Dm644 assets/shell-integration/weenyterm.sh "$pkgdir/etc/profile.d/weenyterm.sh"
  install -Dm644 assets/shell-completion/bash "$pkgdir/usr/share/bash-completion/completions/weenyterm"
  install -Dm644 assets/shell-completion/zsh "$pkgdir/usr/share/zsh/site-functions/_weenyterm"
  install -Dm644 assets/shell-completion/fish "$pkgdir/usr/share/fish/completions/weenyterm.fish"

  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
