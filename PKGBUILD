# Maintainer: xenoz <https://github.com/sreevarshan-xenoz>
pkgname=pocketdesk
pkgver=0.8.2
pkgrel=1
pkgdesc="Your Linux or Windows desktop on your Android phone: screen, input, clipboard, files and notifications over LAN, Tailscale or the internet"
arch=('x86_64')
url="https://github.com/sreevarshan-xenoz/Pocketdesk"
license=('MIT OR Apache-2.0')
# The libraries the binaries link to (the .deb's Depends, and namcap's check).
depends=('ffmpeg' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libpipewire' 'libxcb' 'mesa' 'opus')
optdepends=(
  'pipewire: screen capture through the portal, and sound'
  'xdg-desktop-portal: screen capture on GNOME and KDE'
  'wl-clipboard: the clipboard on Wayland'
  'xclip: the clipboard on X11'
  'playerctl: what is playing, and Play/Pause and skip from the phone'
  'tailscale: reaching the computer through a tailnet'
)
makedepends=('cargo' 'clang' 'cmake' 'libglvnd' 'pkgconf' 'wayland')
install=pocketdesk.install
# makepkg's LTO turns ring's and aws-lc's C into GCC bitcode that the Rust
# link cannot read (undefined ring_core_* symbols).
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d5a4dfbacfa04ba6985eda576326f63e3ede1e376209a4cd355caf5a4cf3a6b')

# GitHub names the unpacked folder after the repository, not the package.
_src="Pocketdesk-${pkgver}"

prepare() {
  cd "${_src}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_src}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Two builds, as the release does, so the server's zbus features are not
  # unified into the desktop app's.
  cargo build --frozen --release --bin pocketdesk
  cargo build --frozen --release -p pocketdesk-desktop --bin pocketdesk-app --bin pocketdesk-tray
}

package() {
  cd "${_src}"
  for bin in pocketdesk pocketdesk-app pocketdesk-tray; do
    install -Dm755 "target/release/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
  # Session-bound USER unit: each user can `systemctl --user enable --now
  # pocketdesk` from their desktop session.
  install -dm755 "${pkgdir}/usr/lib/systemd/user"
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/pocketdesk start|' pocketdesk.service \
    > "${pkgdir}/usr/lib/systemd/user/pocketdesk.service"
  chmod 644 "${pkgdir}/usr/lib/systemd/user/pocketdesk.service"
  install -Dm644 packaging/linux/dev.pocketdesk.Pocketdesk.desktop \
    "${pkgdir}/usr/share/applications/dev.pocketdesk.Pocketdesk.desktop"
  install -Dm644 assets/brand/pocketdesk-icon-512.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pocketdesk.png"
  install -Dm644 assets/brand/pocketdesk-icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pocketdesk.svg"
  install -Dm644 man/pocketdesk.1 "${pkgdir}/usr/share/man/man1/pocketdesk.1"
  for file in README.md SECURITY.md config.toml.example; do
    install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
  done
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
