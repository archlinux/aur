# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>
#
# Builds scale_tail from a tagged release's source tarball and installs the binary, its desktop
# entry, icon and AppStream metadata, and the uQ integration folder (uq/, inert without uQ).
# After editing, regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO

pkgname=scale_tail
# TODO(release): the first release that has uq/ in its tree. Set pkgver to that tag (without the
# leading v), and replace SKIP below with the tarball's sha256 (updpkgsums), then regenerate .SRCINFO.
pkgver=0.6.0
pkgrel=1
pkgdesc='System-tray control centre for the Tailscale CLI'
arch=(x86_64 aarch64)
url='https://github.com/asafelobotomy/scale_tail'
license=(MIT)
depends=(tailscale gcc-libs glibc dbus hicolor-icon-theme)
makedepends=(cargo)
optdepends=('libnotify: notifications (notify-send)'
            'xdg-utils: open login and release pages in the browser'
            'wl-clipboard: copy IPs and names (Wayland)'
            'xclip: copy IPs and names (X11)'
            'zenity: pick files to send with Taildrop'
            'uq: Tailscale tile in uQ quick settings instead of the tray')
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72b72b5b1e097c225d72437b1e964711db05c3c656e3625f9b2e06b4aa7dbefa')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

# Install each <id>/ folder under $1 (if any) to $2/<id>/.
_install_uq_folders() {
  local d
  for d in "$1"/*/; do
    [[ -d $d ]] || continue
    install -Dm644 -t "$2/$(basename "$d")" "$d"*
  done
}

package() {
  cd "$pkgname-$pkgver"
  local appid=io.github.asafelobotomy.scale_tail
  install -Dm755 target/release/scale_tail "$pkgdir/usr/bin/scale_tail"
  install -Dm644 "packaging/$appid.desktop" "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "packaging/$appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 packaging/scale_tail.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/scale_tail.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # uQ integration (Phase 4 spec §2.6): widgets and settings pages.
  _install_uq_folders uq/widgets "$pkgdir/usr/share/uq/shell/widgets"
  _install_uq_folders uq/pages "$pkgdir/usr/share/uq/settings/pages"
}
