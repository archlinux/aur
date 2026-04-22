# Maintainer: Tim Herb <https://github.com/TimHerb2005>
pkgname=omarchy-window-restore-git
pkgver=r1
pkgrel=1
pkgdesc="Save and restore closed windows in Omarchy via keybindings"
arch=('any')
url="https://github.com/TimHerb2005/omarchy-window-restore"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('python' 'hyprland' 'walker')
makedepends=('git')
provides=("omarchy-window-restore=${pkgver}")
conflicts=('omarchy-window-restore')
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/TimHerb2005/omarchy-window-restore.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  # Install hypr-* scripts as data files (activated per-user via omarchy-install-window-restore)
  install -dm755 "$pkgdir/usr/share/$pkgname/bin"
  for script in bin/hypr-*; do
    install -m644 "$script" "$pkgdir/usr/share/$pkgname/$script"
  done

  # Install user-facing activation command into PATH
  install -Dm755 bin/omarchy-install-window-restore \
    "$pkgdir/usr/bin/omarchy-install-window-restore"

  # Install user-facing deactivation command into PATH
  install -Dm755 bin/omarchy-uninstall-window-restore \
    "$pkgdir/usr/bin/omarchy-uninstall-window-restore"

  # Install auto-update alpm hook (runs omarchy-install-window-restore on upgrade)
  install -Dm644 hooks/omarchy-window-restore-update.hook \
    "$pkgdir/usr/share/libalpm/hooks/omarchy-window-restore-update.hook"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
