# Maintainer: zt <zt@zt64.dev>
pkgname=vencord-desktop-git
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=r363.24fbf35
pkgrel=2

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=(
  'alsa-lib'
  'cairo'
  'dbus'
  'gtk3'
  'glib2'
  'glibc'
  'libcups'
  'nss'
  'nspr'
  'pango'
)
makedepends=("nodejs>=18" "git")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vencord")
conflicts=("vencord")

source=("$pkgname::git+$url.git" "vesktop.desktop")

sha256sums=('SKIP'
            '894ac515e31e2fe7e88ac771184cc783885706dced346470c5eb428302b7802c')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  corepack pnpm i
  corepack pnpm package:dir
}

package() {
  cd "$srcdir/$pkgname"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/vesktop"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Copy application files to /usr/lib/vesktop
  cp -R "dist/linux-unpacked/." "$pkgdir/usr/lib/vesktop"

  # Install desktop entry
  install -Dm 644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"

  # Install icon
  install -Dm 644 "static/icon.png" "$pkgdir/usr/share/pixmaps/vesktop.png"

  # Install license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create a symlink for the executable in /usr/bin
  ln -s /usr/lib/vesktop/vesktop "$pkgdir/usr/bin/vesktop"
}
