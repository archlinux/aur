# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=whiplash
pkgver=0.3.0
pkgrel=1
pkgdesc="Xmonad-style Wayland compositor with a Haskell brain and a TOML config"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/whiplash"
license=('MIT')
depends=('wlroots0.20' 'wayland' 'libxkbcommon' 'libinput' 'libxcb' 'xcb-util-wm'
         'gmp' 'libffi' 'numactl' 'xorg-xwayland' 'dbus' 'glibc')
# Only GHC's own libraries are used, so the build needs no Hackage access.
# ghc-static: cabal links the Haskell libraries statically.
makedepends=('ghc' 'ghc-static' 'cabal-install' 'wayland-protocols' 'pkgconf')
optdepends=(
  'xdg-desktop-portal-wlr: screen sharing and screenshots through portals'
  'xdg-desktop-portal-gtk: default portal backend (file dialogs, etc.)'
  'libnotify: config errors shown as notifications'
)
backup=('etc/xdg-desktop-portal/whiplash-portals.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a7f8e6e3b47fdb689d1a53855818b8549c86207bd959e738635556e4e4ef870')

build() {
    cd "$pkgname-$pkgver"
    # cabal wants a writable home for its config and store.
    export CABAL_DIR="$srcdir/cabal"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
