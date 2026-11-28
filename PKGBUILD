# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=whiplash
pkgver=0.4.1
pkgrel=1
pkgdesc="Xmonad-style Wayland compositor and X11 WM with a Haskell brain"
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
backup=('etc/xdg-desktop-portal/whiplash-portals.conf'
        'etc/xdg/whiplash-x11/xdg-desktop-portal/whiplash-portals.conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c79a3c7033409d3a10a69cdf3e3ee45f2f9f8f257685f87befe31130e1c5857b')

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
