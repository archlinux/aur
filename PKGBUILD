# Maintainer: YOU <you@example.com>
#
# Binary package for MultiClipRelay (downloads prebuilt release tarball).
# Recommended package name on AUR: multicliprelay-bin

pkgname=multicliprelay-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Wayland clipboard sync via TCP relay (prebuilt binaries)"
arch=(x86_64)
url="https://github.com/KasumiNova/MultiClipRelay"
license=(GPL3)

# Runtime deps only (no Rust toolchain needed for -bin packages)
depends=(wl-clipboard gtk4)

provides=(multicliprelay)
# When users enable `OPTIONS=(debug)` in makepkg.conf, a split debug package
# like `multicliprelay-bin-debug` may be installed alongside the main package.
# Add cross-variant debug packages to conflicts so switching between -bin/-git
# won't get stuck on stale debug package dependencies.
conflicts=(
  multicliprelay
  multicliprelay-git
  multicliprelay-debug
  multicliprelay-git-debug
)

source=("${url}/releases/download/v${pkgver}/multicliprelay-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('3c4c197893e98fc7d5e76af4b5aa27a65165851b1b1809d62c0f39ab09c0f511')

package() {
  local dir="multicliprelay-${pkgver}-x86_64-linux"

  cd "${srcdir}"
  tar -xzf "${srcdir}/multicliprelay-${pkgver}-x86_64-linux.tar.gz"

  install -Dm755 "${dir}/multicliprelay-relay"   "${pkgdir}/usr/bin/multicliprelay-relay"
  install -Dm755 "${dir}/multicliprelay-node"    "${pkgdir}/usr/bin/multicliprelay-node"
  install -Dm755 "${dir}/multicliprelay-ui-gtk"  "${pkgdir}/usr/bin/multicliprelay-ui-gtk"
  install -Dm755 "${dir}/multicliprelay-ui-tray" "${pkgdir}/usr/bin/multicliprelay-ui-tray"

  # Desktop entries
  install -Dm644 "${dir}/packaging/common/multicliprelay-ui-gtk.desktop"  "${pkgdir}/usr/share/applications/multicliprelay-ui-gtk.desktop"
  install -Dm644 "${dir}/packaging/common/multicliprelay-ui-tray.desktop" "${pkgdir}/usr/share/applications/multicliprelay-ui-tray.desktop"

  # systemd user units
  install -Dm644 "${dir}/packaging/common/systemd/multicliprelay-relay.service"    "${pkgdir}/usr/lib/systemd/user/multicliprelay-relay.service"
  install -Dm644 "${dir}/packaging/common/systemd/multicliprelay-wl-watch.service" "${pkgdir}/usr/lib/systemd/user/multicliprelay-wl-watch.service"
  install -Dm644 "${dir}/packaging/common/systemd/multicliprelay-wl-apply.service" "${pkgdir}/usr/lib/systemd/user/multicliprelay-wl-apply.service"
  install -Dm644 "${dir}/packaging/common/systemd/multicliprelay-x11-sync.service" "${pkgdir}/usr/lib/systemd/user/multicliprelay-x11-sync.service"

  # Examples/docs
  install -Dm644 "${dir}/packaging/common/systemd/multicliprelay.env.example" "${pkgdir}/usr/share/doc/${pkgname}/multicliprelay.env.example"
  install -Dm644 "${dir}/packaging/common/ui.toml.example" "${pkgdir}/usr/share/doc/${pkgname}/ui.toml.example"
  install -Dm644 "${dir}/packaging/README.md" "${pkgdir}/usr/share/doc/${pkgname}/packaging-README.md"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
