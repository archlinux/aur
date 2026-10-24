# Maintainer: 123llyrr <your-email@example.com>

pkgname=clarion-git
pkgver=0.1.0.r93.ga758930
pkgrel=1
pkgdesc='Wayland compositor with native Vulkan rendering, HDR10/scRGB color management and an integrated GPUI desktop shell (git version)'
arch=(x86_64 aarch64)
url='https://github.com/123llyrr/clarion'
license=(GPL-3.0-or-later)
makedepends=(
  clang
  git
  pkgconf
  rust
)
depends=(
  cairo
  fontconfig
  freetype2
  glib2
  libdisplay-info
  libinput
  libpipewire
  libxkbcommon
  mesa
  pango
  pixman
  python
  seatd
  systemd-libs
  vulkan-icd-loader
  wayland
  xdg-desktop-portal-impl
)
optdepends=(
  'xdg-desktop-portal-gnome: portal implementation preferred by the default config'
  'xdg-desktop-portal-gtk: portal implementation preferred by the default config'
  'gnome-keyring: secrets portal backend'
  'xwayland-satellite: Xwayland support for X11 apps'
  'alacritty: terminal bound in the default config'
  'fuzzel: app launcher bound in the default config'
  'swaylock: screen locker bound in the default config'
  'waybar: status bar bound in the default config'
  'swaybg: wallpaper'
  'mako: notification daemon'
  'swayidle: idle management'
  'noto-fonts-cjk: CJK fonts for the shell UI'
)
provides=(clarion)
conflicts=(clarion)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
# Upstream keeps line-tables-only debug info in the binaries so panic
# backtraces carry line numbers (same intent as clarion.spec.rpkg, which
# disables stripping). Don't let makepkg strip it away.
options=(!strip)

pkgver() {
  cd "$pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    local ver
    ver=$(sed -n 's/^version = "\(.*\)"$/\1/p' Cargo.toml | head -n1)
    printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$pkgname"

  export CLARION_BUILD_COMMIT="$(git rev-parse HEAD)"

  cargo build --locked --release -p clarion -p clarion-settings -p clarion-shell
}

package() {
  cd "$pkgname"

  # Rust binaries
  install -Dm755 -t "$pkgdir/usr/bin" \
    target/release/clarion \
    target/release/clarion-settings \
    target/release/clarion-shell

  # Session launcher and helper scripts
  install -Dm755 -t "$pkgdir/usr/bin" \
    resources/clarion-session \
    resources/clarion-shell-msg \
    resources/compat/realand-shell \
    resources/compat/realand-shell-msg

  # Session / application entries
  install -Dm644 resources/clarion.desktop -t "$pkgdir/usr/share/wayland-sessions"
  install -Dm644 resources/clarion-shell.desktop -t "$pkgdir/usr/share/applications"

  # Portal configuration
  install -Dm644 resources/clarion-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal"

  # systemd user units
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    resources/clarion.service \
    resources/clarion-shell.service \
    resources/clarion-shutdown.target

  # Shell icons
  install -dm755 "$pkgdir/usr/share/clarion-shell/icons"
  install -m644 -t "$pkgdir/usr/share/clarion-shell/icons" clarion-shell/assets/icons/*

  # Shell completions
  ./target/release/clarion completions bash > clarion.bash
  ./target/release/clarion completions fish > clarion.fish
  ./target/release/clarion completions zsh > _clarion
  install -Dm644 clarion.bash "$pkgdir/usr/share/bash-completion/completions/clarion"
  install -Dm644 clarion.fish "$pkgdir/usr/share/fish/vendor_completions.d/clarion.fish"
  install -Dm644 _clarion "$pkgdir/usr/share/zsh/site-functions/_clarion"

  # Documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/clarion" \
    README.md \
    resources/default-config.kdl
  cp -r docs/wiki "$pkgdir/usr/share/doc/clarion/wiki"

  # Licenses
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE \
    THIRD_PARTY_NOTICES.md \
    third_party/gpui/LICENSE-APACHE
}
