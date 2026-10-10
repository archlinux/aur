# Maintainer: FlowOSS <https://github.com/FlowOSS>
pkgname=flowshot-git
_pkgname=flowshot
pkgver=0.1.0.r3.g6b6d7b7
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland and X11 with mixed-DPI support'
arch=('x86_64')
url='https://github.com/FlowOSS/flowshot'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'libgcc'
  'libpipewire-0.3.so'
  # dlopen'd or data-only: real runtime deps, namcap warnings are false positives
  'wayland'
  'vulkan-icd-loader'
  'fontconfig'
  'ttf-font'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'clang'
  'desktop-file-utils'
  'git'
  'librsvg'
  'pipewire'
  'pkgconf'
)
optdepends=(
  'xdg-desktop-portal: portal capture, global shortcuts and OpenURI'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma (KWin ScreenShot2)'
  'xdg-desktop-portal-hyprland: portal backend for Hyprland'
  'xdg-desktop-portal-wlr: portal backend for wlroots compositors (Sway)'
  'vulkan-driver: Vulkan implementation for the GPU-accelerated overlay'
  'gnome-shell-extension-appindicator: system tray icon under GNOME'
)
checkdepends=('ttf-dejavu')
provides=("flowshot=$pkgver")
conflicts=('flowshot')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null |
      sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=thin
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  export CARGO_PROFILE_RELEASE_DEBUG=false
  cargo build --release --frozen --bin flowshot --bin flowshot-daemon
  cargo build --release --frozen -p flowshot-cli --example man_pages
}

check() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_pkgname"

  # keep the fakeroot build log clean (CLI config-load warning)
  export RUST_LOG=error

  install -Dm0755 target/release/flowshot "$pkgdir/usr/bin/flowshot"
  install -Dm0755 target/release/flowshot-daemon "$pkgdir/usr/bin/flowshot-daemon"

  install -Dm0644 packaging/flowshot.desktop.in \
    "$pkgdir/usr/share/applications/org.flowoss.FlowShot.desktop"
  desktop-file-validate "$pkgdir/usr/share/applications/org.flowoss.FlowShot.desktop"

  install -Dm0644 assets/logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.flowoss.FlowShot.svg"
  local size
  for size in 48 64 128 256 512; do
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -w "$size" -h "$size" assets/logo.svg \
      -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/org.flowoss.FlowShot.png"
  done

  ./target/release/examples/man_pages "$srcdir/man"
  install -dm0755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/man/man5"
  install -m0644 "$srcdir"/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -m0644 "$srcdir"/man/*.5 -t "$pkgdir/usr/share/man/man5/"

  install -dm0755 \
    "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/zsh/site-functions" \
    "$pkgdir/usr/share/fish/vendor_completions.d" \
    "$pkgdir/usr/share/elvish/lib"
  # Standard Arch completion paths (bash no extension, zsh _-prefixed, fish
  # vendor_completions.d, elvish lib). pwsh/nushell have no Arch convention.
  ./target/release/flowshot completions bash \
    > "$pkgdir/usr/share/bash-completion/completions/flowshot"
  ./target/release/flowshot completions zsh \
    > "$pkgdir/usr/share/zsh/site-functions/_flowshot"
  ./target/release/flowshot completions fish \
    > "$pkgdir/usr/share/fish/vendor_completions.d/flowshot.fish"
  ./target/release/flowshot completions elvish \
    > "$pkgdir/usr/share/elvish/lib/flowshot.elv"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 NOTICES "$pkgdir/usr/share/licenses/$pkgname/NOTICES"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md docs/config-reference.md docs/dbus-api.md
}
