# Maintainer: KannarFr <kannarfr@gmail.com>
pkgname=gitlab-inbox-git
_pkgsrc=glab-desktop-ui
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="A glanceable desktop inbox for GitLab things that need your reply (via glab)"
arch=('x86_64')
url="https://github.com/KannarFr/glab-desktop-ui"
license=('MIT')
# Release GUI binary: a separate -debug subpackage isn't useful.
#
# Note: makepkg still warns "Package contains reference to $srcdir". That single
# reference is CARGO_MANIFEST_DIR, baked into the binary by Tauri's
# generate_context!() macro as a compile-time string literal — neither !debug
# nor --remap-path-prefix removes it, and it's never read at runtime since the
# frontend is embedded. The warning is benign.
options=('!debug')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'librsvg'
  'libayatana-appindicator'
  'glab'
  'hicolor-icon-theme'
)
makedepends=('git' 'rust' 'pkgconf')
optdepends=(
  'xdg-utils: open items in your default browser'
  'mako: Wayland notification daemon for click-to-open notifications (or dunst/swaync)'
)
provides=('gitlab-inbox')
conflicts=('gitlab-inbox')
source=("$pkgname::git+https://github.com/KannarFr/glab-desktop-ui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Prefer a tag if one ever exists, otherwise fall back to commit count + hash.
  local tag
  if tag=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/gitlab-inbox "$pkgdir/usr/bin/gitlab-inbox"

  # Icons (the app id / StartupWMClass is "gitlab-inbox").
  install -Dm644 src-tauri/icons/32x32.png      "$pkgdir/usr/share/icons/hicolor/32x32/apps/gitlab-inbox.png"
  install -Dm644 src-tauri/icons/128x128.png    "$pkgdir/usr/share/icons/hicolor/128x128/apps/gitlab-inbox.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gitlab-inbox.png"
  install -Dm644 src-tauri/icons/icon.png       "$pkgdir/usr/share/icons/hicolor/512x512/apps/gitlab-inbox.png"
  install -Dm644 src-tauri/icons/logo.svg       "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitlab-inbox.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Desktop entry. StartupWMClass matches the Wayland app_id so the Super+g
  # focus binding documented in the README works out of the box.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/gitlab-inbox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=GitLab Inbox
GenericName=GitLab review inbox
Comment=A glanceable desktop inbox for GitLab things that need your reply
Exec=gitlab-inbox
Icon=gitlab-inbox
Terminal=false
Categories=Development;RevisionControl;Utility;
Keywords=gitlab;glab;merge request;review;inbox;
StartupWMClass=gitlab-inbox
EOF
}
