# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=aur-check-rebuild
pkgver=1.0.4
pkgrel=1
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/aur-check-rebuild'
license=('GPL-2')
depends=(
  'alacritty'
  'python'
  'python-dataclasses-json'
  'python-pip'
  'python-psutil'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)

prepare() {
    if [[ ! -d "${HOME}/.local/share/pnpm" ]]; then
        echo "Setup for pnpm..."
        SHELL=/bin/bash pnpm setup
    fi
}

build() {
    pip install --break-system-packages pyyaml
}

package() {
  cd "$srcdir/aur-check-rebuild"

  touch "aur-check-rebuild.log" 

  install -Dm644 "hooks/zz-aur-check-rebuild.hook" "$pkgdir/usr/share/libalpm/hooks/zz-aur-check-rebuild.hook"
  install -Dm755 "scripts/aur-check-rebuild.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild"
  install -Dm644 "settings.json" "$pkgdir/usr/share/aur-check-rebuild/settings.json"
  install -Dm644 "aur-check-rebuild.log" "$pkgdir/var/log/aur-check-rebuild.log"
}