# Maintainer: Victor Queiroz <victorcqueirozg at gmail dot com>

pkgbase=openresearch
pkgname=(openresearch openresearch-cli openresearch-bin openresearch-cli-bin)
pkgver=0.2.17
pkgrel=1
pkgdesc="Automated research with coding agents"
arch=("x86_64" "aarch64")
url="https://github.com/alphaXiv/OpenResearch"
license=("MIT")
makedepends=("rust" "nodejs" "pnpm>=11" "pkgconf" "gtk3" "webkit2gtk-4.1" "sqlite" "7zip" "patchelf")
# Rust's LLVM linker cannot consume GCC LTO objects from ring's C code.
options=("!debug" "!lto")
_release_url="$url/releases/download/v$pkgver"
_source_dir="openresearch-cli-$pkgver"
source=("openresearch-$pkgver.tar.gz::$_release_url/source.tar.gz")
sha256sums=("5a5d50bf61a7aa451ea31c877370b5f69a65c2c4f193da622da18115eabc3771")
source_x86_64=(
  "OpenResearch-$pkgver-x86_64.AppImage::$_release_url/OpenResearch-x86_64.AppImage"
  "openresearch-cli-$pkgver-x86_64.tar.xz::$_release_url/openresearch-cli-x86_64-unknown-linux-musl.tar.xz"
)
sha256sums_x86_64=(
  "957348df22aaa302b264323fdfa091326bf8f939039e5070f877f555177b1aaa"
  "3eaeadfb6feee68b8e7c65de2f930b015d45d23b4be52842773ca18cedbf528d"
)
source_aarch64=(
  "OpenResearch-$pkgver-aarch64.AppImage::$_release_url/OpenResearch-aarch64.AppImage"
  "openresearch-cli-$pkgver-aarch64.tar.xz::$_release_url/openresearch-cli-aarch64-unknown-linux-musl.tar.xz"
)
sha256sums_aarch64=(
  "b8fa5fc9b002d75d8cfe3d13e89e8a2dde0deafb26e0ba4b587345360eaa773d"
  "76a5ac4c8deeba3b3a1acc71ea764f53fcf9532b548e92255c76e8e5930acc3b"
)
noextract=("OpenResearch-$pkgver-x86_64.AppImage" "OpenResearch-$pkgver-aarch64.AppImage")

_prepare_appimage() {
  # 7zip extracts either architecture without executing downloaded code.
  7z x -y "OpenResearch-$pkgver-$CARCH.AppImage" -o"$srcdir/appimage"
  # The extracted app belongs to pacman, even if launched from another AppImage.
  sed -i '/^set -e$/a unset APPIMAGE APPDIR' "$srcdir/appimage/AppRun.wrapped"
  # Upstream's nested GTK modules look beside themselves, outside usr/lib.
  # Resolve their dependencies from the bundle rather than the host toolkit.
  local module
  for module in "$srcdir/appimage/usr/lib/gtk-3.0/3.0.0/"{immodules,printbackends}/*.so \
    "$srcdir/appimage/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders/"*.so; do
    patchelf --set-rpath "\$ORIGIN/../../.." "$module"
  done
}

prepare() {
  _prepare_appimage

  cd "$srcdir/$_source_dir"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cd ui
  # pnpm 11 requires explicit approval of esbuild's native-binary setup.
  printf '%s\n' 'allowBuilds:' '  esbuild: true' > pnpm-workspace.yaml
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/$_source_dir/ui"
  pnpm build

  cd "$srcdir/$_source_dir"
  export CARGO_TARGET_DIR="$srcdir/target"
  # Link Arch's SQLite instead of upstream's bundled C build for static musl.
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  # Upstream reserves its production telemetry channel for official CI builds.
  unset ORX_OFFICIAL_RELEASE_BUILD
  cargo build --release --frozen --target "$CARCH-unknown-linux-gnu"
  install -Dm755 "$CARGO_TARGET_DIR/$CARCH-unknown-linux-gnu/release/orx" "$srcdir/orx-cli"
  cargo build --release --frozen --target "$CARCH-unknown-linux-gnu" --features desktop
  install -Dm755 "$CARGO_TARGET_DIR/$CARCH-unknown-linux-gnu/release/orx" "$srcdir/orx-desktop"
}

_install_license() {
  install -Dm644 "$srcdir/$_source_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_install_desktop_entry() {
  install -Dm644 "$srcdir/$_source_dir/linux/OpenResearch.desktop" \
    "$pkgdir/usr/share/applications/openresearch.desktop"
  sed -i 's/^Exec=.*/Exec=openresearch/' "$pkgdir/usr/share/applications/openresearch.desktop"
  install -Dm644 "$srcdir/$_source_dir/linux/OpenResearch.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/OpenResearch.png"
}

package_openresearch() {
  pkgdesc="Automated research with coding agents (desktop, built from source)"
  depends=("bash" "glibc" "gcc-libs" "gtk3" "webkit2gtk-4.1" "sqlite" "ca-certificates" "hicolor-icon-theme")
  optdepends=("openresearch-cli: standalone headless orx command" "git: local project version control")
  conflicts=("openresearch-bin")

  install -Dm755 "$srcdir/orx-desktop" "$pkgdir/usr/lib/openresearch/orx"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /usr/lib/openresearch/orx app' > "$pkgdir/usr/bin/openresearch"
  chmod 755 "$pkgdir/usr/bin/openresearch"
  _install_desktop_entry
  _install_license
}

package_openresearch-cli() {
  pkgdesc="Automated research with coding agents (headless CLI, built from source)"
  depends=("glibc" "gcc-libs" "sqlite" "ca-certificates")
  optdepends=("git: local project version control" "openssh: remote compute over SSH")
  conflicts=("openresearch-cli-bin")

  install -Dm755 "$srcdir/orx-cli" "$pkgdir/usr/bin/orx"
  _install_license
}

package_openresearch-bin() {
  pkgdesc="Automated research with coding agents (desktop, upstream binary)"
  depends=(
    "bash" "glibc" "gcc-libs" "ca-certificates" "fontconfig" "harfbuzz" "fribidi"
    "libglvnd" "mesa" "libx11" "libgpg-error" "e2fsprogs" "gmp" "hicolor-icon-theme" "ttf-font"
  )
  optdepends=(
    "openresearch-cli: standalone headless orx command"
    "git: local project version control"
    "zenity: graphical startup error dialogs"
    "xorg-xwayland: desktop app on Wayland"
  )
  provides=("openresearch=$pkgver")
  conflicts=("openresearch")
  options=("!strip" "!debug")

  install -dm755 "$pkgdir/opt/openresearch" "$pkgdir/usr/bin"
  cp -a "$srcdir/appimage/." "$pkgdir/opt/openresearch/"
  ln -s /opt/openresearch/AppRun.wrapped "$pkgdir/usr/bin/openresearch"
  _install_desktop_entry
  _install_license
}

package_openresearch-cli-bin() {
  pkgdesc="Automated research with coding agents (headless CLI, upstream binary)"
  depends=("ca-certificates")
  optdepends=("git: local project version control" "openssh: remote compute over SSH")
  provides=("openresearch-cli=$pkgver")
  conflicts=("openresearch-cli")
  options=("!strip" "!debug")

  install -Dm755 "$srcdir/openresearch-cli-$CARCH-unknown-linux-musl/orx" "$pkgdir/usr/bin/orx"
  _install_license
}
