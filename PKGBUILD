pkgname=arch-update-manager-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/destbg/arch-update-manager"
license=('MIT')
depends=('gtk4' 'vte4' 'gtksourceview5' 'polkit' 'pacman' 'pacman-contrib' 'expect' 'sudo' 'curl')
provides=('arch-update-manager')
conflicts=('arch-update-manager')
optdepends=('paru: AUR helper support'
            'yay: AUR helper support'
            'flatpak: Flatpak package support'
            'meld: visual diff editor for pacnew files'
            'timeshift: pre-update system snapshots'
            'snapper: pre-update Btrfs snapshots')
source=(
  "arch-update-manager-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/arch-update-manager-${pkgver}-x86_64.tar.gz"
  "${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('317fa0b0846c33b925e10a83aeddedd422c7e07f58aa8fcebc9510ab2c10896e'
            'ce018855b063979210328df8319e2feea7558bd3be40eec3dc628f75431665c7')

package() {
  cd "$srcdir"
  install -Dm755 arch-update-manager "$pkgdir/usr/bin/arch-update-manager"
  if [[ -f arch-update-manager-tray ]]; then
    install -Dm755 arch-update-manager-tray "$pkgdir/usr/bin/arch-update-manager-tray"
  fi
  if [[ -f arch-update-manager-check ]]; then
    install -Dm755 arch-update-manager-check "$pkgdir/usr/bin/arch-update-manager-check"
  fi

  local srcdir_repo="${srcdir}/${pkgname%-bin}-${pkgver}"
  install -Dm644 "${srcdir_repo}/arch-update-manager.desktop" \
    "$pkgdir/usr/share/applications/arch-update-manager.desktop"
  install -Dm644 "${srcdir_repo}/com.destbg.arch-update-manager.policy" \
    "$pkgdir/usr/share/polkit-1/actions/com.destbg.arch-update-manager.policy"

  if [[ -f "${srcdir_repo}/res/systemd/arch-update-manager-check.service" ]]; then
    install -Dm644 "${srcdir_repo}/res/systemd/arch-update-manager-check.service" \
      "$pkgdir/usr/lib/systemd/user/arch-update-manager-check.service"
  fi
  if [[ -f "${srcdir_repo}/res/systemd/arch-update-manager-check.timer" ]]; then
    install -Dm644 "${srcdir_repo}/res/systemd/arch-update-manager-check.timer" \
      "$pkgdir/usr/lib/systemd/user/arch-update-manager-check.timer"
  fi
  if [[ -f "${srcdir_repo}/res/systemd/arch-update-manager-tray.service" ]]; then
    install -Dm644 "${srcdir_repo}/res/systemd/arch-update-manager-tray.service" \
      "$pkgdir/usr/lib/systemd/user/arch-update-manager-tray.service"
  fi

  for size in 48x48 256x256 512x512; do
    if [[ -f "${srcdir_repo}/icons/${size}/apps/arch-update-manager.png" ]]; then
      install -Dm644 "${srcdir_repo}/icons/${size}/apps/arch-update-manager.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}/apps/arch-update-manager.png"
    fi
  done

  install -Dm644 "${srcdir_repo}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
