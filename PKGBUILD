# Maintainer: KasumiNova <you@example.com>

pkgname=multicliprelay-git
_pkgbase=multicliprelay
pkgver=0
pkgrel=1
pkgdesc="Wayland clipboard sync via TCP relay (git build)"
arch=(x86_64)
url="https://github.com/KasumiNova/MultiClipRelay"
license=(GPL3)

depends=(wl-clipboard gtk4)
makedepends=(git rust cargo)

optdepends=(
  'xclip: X11 clipboard integration (x11-sync)'
)

provides=(multicliprelay)
conflicts=(
  multicliprelay
  multicliprelay-bin
  multicliprelay-debug
  multicliprelay-bin-debug
)

source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  local v
  v=$(git describe --long --tags --abbrev=7 2>/dev/null) || v="r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
  printf '%s' "${v}" | sed 's/^v//; s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgbase}"
  cargo build --release -p relay -p node -p ui-gtk -p ui-tray
}

package() {
  cd "${srcdir}/${_pkgbase}"

  install -Dm755 target/release/relay   "${pkgdir}/usr/bin/multicliprelay-relay"
  install -Dm755 target/release/node    "${pkgdir}/usr/bin/multicliprelay-node"
  install -Dm755 target/release/ui-gtk  "${pkgdir}/usr/bin/multicliprelay-ui-gtk"
  install -Dm755 target/release/ui-tray "${pkgdir}/usr/bin/multicliprelay-ui-tray"

  install -Dm644 packaging/common/multicliprelay-ui-gtk.desktop  "${pkgdir}/usr/share/applications/multicliprelay-ui-gtk.desktop"
  install -Dm644 packaging/common/multicliprelay-ui-tray.desktop "${pkgdir}/usr/share/applications/multicliprelay-ui-tray.desktop"

  install -Dm644 packaging/common/systemd/multicliprelay-relay.service    "${pkgdir}/usr/lib/systemd/user/multicliprelay-relay.service"
  install -Dm644 packaging/common/systemd/multicliprelay-wl-watch.service "${pkgdir}/usr/lib/systemd/user/multicliprelay-wl-watch.service"
  install -Dm644 packaging/common/systemd/multicliprelay-wl-apply.service "${pkgdir}/usr/lib/systemd/user/multicliprelay-wl-apply.service"
  install -Dm644 packaging/common/systemd/multicliprelay-x11-sync.service "${pkgdir}/usr/lib/systemd/user/multicliprelay-x11-sync.service"

  install -Dm644 packaging/common/systemd/multicliprelay.env.example "${pkgdir}/usr/share/doc/${_pkgbase}/multicliprelay.env.example"
  install -Dm644 packaging/common/ui.toml.example "${pkgdir}/usr/share/doc/${_pkgbase}/ui.toml.example"
  install -Dm644 packaging/README.md "${pkgdir}/usr/share/doc/${_pkgbase}/packaging-README.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
}
