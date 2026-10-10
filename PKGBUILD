# Maintainer: 0bCdian <diegoparranava@protonmail.com>
pkgname='waypaper-engine'
pkgver=3.3.0
pkgrel=1
pkgdesc="A wallpaper setter GUI with playlist functionality for Wayland and X11"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
makedepends=('go' 'pnpm' 'nodejs' 'git')
provides=('waypaper-engine')
conflicts=('waypaper-engine-git')
optdepends=(
  'awww: animated wallpapers on Wayland'
  'hyprpaper: static image wallpapers on Hyprland'
  'mpvpaper: video wallpapers on wlroots compositors'
  'feh: static image wallpapers on X11'
  'wal-qt: HTML / WebEngine wallpaper backend'
  'xorg-xrandr: monitor detection on X11'
)
_archive="Waypaper-Engine-$pkgver"
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1d1382bfef293c55bf2b196f3a37259715322fc65702b3594fa45aa3165b244')

prepare() {
  cd "$_archive"
  make deps
}

build() {
  cd "$_archive"
  # The release tarball has no .git, so the Makefile's `git describe` version
  # detection fails (and would otherwise pick up an unrelated parent repo).
  # Pass the version explicitly so the daemon binary is stamped correctly.
  make electron DAEMON_VERSION="v$pkgver"
}

package() {
  cd "$_archive"
  make install-system DESTDIR="$pkgdir" INSTALL_PREFIX_SYSTEM=/usr \
    ICON_DIR="$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
