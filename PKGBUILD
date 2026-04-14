# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=aur-check-rebuild
pkgver=1.0.1
pkgrel=1
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/aur-check-rebuild'
license=('GPL-2')
depends=(
  'python'
  'python-psutil'
  'python-pip'
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
    pip install --break-system-packages asyncio pyyaml
}

package() {
  install -Dm644 "$srcdir/aur-check-rebuild/hooks/zz-aur-check-rebuild.hook" "$pkgdir/usr/share/libalpm/hooks/zz-aur-check-rebuild.hook"
  install -Dm755 "$srcdir/aur-check-rebuild/scripts/aur-check-rebuild.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild"
}