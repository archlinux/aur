# Maintainer: FlowOSS <https://github.com/FlowOSS>
#
# FlowShot - screenshot + annotation for Linux (Wayland and X11).
# VCS package: builds the tip of `main`; the -bin sibling repackages the
# prebuilt release asset instead.
#
# Build-dependency notes:
#   clang    - bindgen (a build-dependency of libspa-sys via the pipewire
#              crate) dlopens libclang.so, owned by `clang` on Arch.
#   pipewire - libspa-sys/pipewire-sys pkg-config-probe libpipewire-0.3 at
#              build time; the Arch package ships the headers and .pc files.
#   pkgconf  - that probe is pkg-config(1).
#   librsvg  - rsvg-convert renders the hicolor PNG sizes from the SVG source.
#   cmake is deliberately NOT required: aws-lc-sys (via rustls) uses its cc
#   builder on x86_64-linux unless AWS_LC_SYS_CMAKE_BUILDER=1 or `fips`.
#
# Never build with --all-features: the daemon's `test-drive` feature wires a
# headless event-injection seam that must not reach user installs.
pkgname=flowshot-git
_pkgname=flowshot
pkgver=0.1.0.r2.gab0d34c
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland and X11 with mixed-DPI support'
arch=('x86_64')
url='https://github.com/FlowOSS/flowshot'
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'libgcc'
  'libpipewire-0.3.so'
  # dlopen'd or data-only, so invisible to ldd/namcap (namcap will warn
  # "may not be needed" for these; they are real runtime requirements):
  'wayland'              # wayland-sys dlopens libwayland-client.so.0
  'vulkan-icd-loader'    # ash dlopens libvulkan.so.1
  'fontconfig'           # cosmic-text parses the fontconfig configuration
  'ttf-font'             # virtual provide: cosmic-text needs at least one font
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
# The test suite renders text through cosmic-text, which panics without any
# installed fonts; same fix as the official alacritty package.
checkdepends=('ttf-dejavu')
# AUR submission naming: the `flowshot` pkgbase on the AUR is squatted by an
# unrelated install script. The suffixes (-git/-bin) are a submission-level
# workaround only - the software's package name is `flowshot`, and every
# family member provides+conflicts it (the standard takeover pattern), so
# installing FlowShot replaces anything else claiming the name.
provides=("flowshot=$pkgver")
conflicts=('flowshot')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')
# Arch's default makepkg.conf enables `lto`, exporting -flto=auto to C
# compilations. aws-lc-sys (vendored C/C++ crypto via rustls) built with slim
# LTO objects fails to link through ld.lld (undefined aws_lc_* symbols), so C
# LTO is disabled per the Rust package guidelines. Rust-level LTO is set in
# build() and is unaffected.
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
  # The workspace profile enables line-table debug info for the release
  # pipeline's companion split; local builds gain nothing from it (makepkg
  # strips and splits on its own), so keep them light.
  export CARGO_PROFILE_RELEASE_DEBUG=false
  cargo build --release --frozen --bin flowshot --bin flowshot-daemon
  # Man pages come from a dev-dependency example (clap_mangen), built
  # separately from the shipped binaries.
  cargo build --release --frozen -p flowshot-cli --example man_pages
}

check() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_pkgname"

  # The CLI logs a config-load warning to stderr when run without a user
  # config (the case under fakeroot); keep the build log clean.
  export RUST_LOG=error

  install -Dm0755 target/release/flowshot "$pkgdir/usr/bin/flowshot"
  # Optional at runtime (the CLI self-spawns as the daemon) but shipped:
  # supervised foreground use and systemd user units reference it.
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
