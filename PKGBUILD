pkgname=arch-update-manager-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="A Linux Mint inspired GTK4-based update manager for Arch Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/destbg/arch-update-manager"
license=('MIT')
depends=('gtk4' 'vte4' 'polkit' 'pacman' 'timeshift' 'expect')
provides=('arch-update-manager')
conflicts=('arch-update-manager')
optdepends=('paru: AUR helper support'
            'yay: AUR helper support')
source=(
  "arch-update-manager-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/arch-update-manager-${pkgver}-x86_64.tar.gz"
  "${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('f1215cd7d6416060fcb4c157f3459023acc999de0e7869c39a46432d0ab623a8'
            '140f35e37bdd30f004f22f0b04401e1ddfd69bc863eeeda35a412604429b1a27')

package() {
  cd "$srcdir"
  install -Dm755 arch-update-manager "$pkgdir/usr/bin/arch-update-manager"

  local srcdir_repo="${srcdir}/${pkgname%-bin}-${pkgver}"
  install -Dm644 "${srcdir_repo}/arch-update-manager.desktop" \
    "$pkgdir/usr/share/applications/arch-update-manager.desktop"
  install -Dm644 "${srcdir_repo}/com.destbg.arch-update-manager.policy" \
    "$pkgdir/usr/share/polkit-1/actions/com.destbg.arch-update-manager.policy"

  for size in 48x48 256x256 512x512; do
    if [[ -f "${srcdir_repo}/icons/${size}/apps/arch-update-manager.png" ]]; then
      install -Dm644 "${srcdir_repo}/icons/${size}/apps/arch-update-manager.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}/apps/arch-update-manager.png"
    fi
  done

  install -Dm644 "${srcdir_repo}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
