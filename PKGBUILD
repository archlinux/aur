# Maintainer: mafuzyk
pkgname=kernel-panic-git
pkgver=2.4.7.r0.gc2ba92d
pkgrel=1
pkgdesc='Neon arena shooter about keeping one stubborn process alive (development version)'
arch=('x86_64')
url='https://github.com/mafuzyk/kernel-panic'
license=('MIT')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2' 'glib2' 'glibc'
         'libglvnd' 'libpulse' 'libx11' 'libxcursor' 'libxi' 'libxinerama'
         'libxrandr' 'wayland' 'zlib')
makedepends=('git' 'godot')
provides=('kernel-panic')
conflicts=('kernel-panic' 'kernel-panic-bin')
source=(
  'git+https://github.com/mafuzyk/kernel-panic.git#branch=main'
  'kernel-panic.desktop'
  'LICENSE'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/kernel-panic"
  git describe --long --tags --match='v[0-9]*' | \
    sed -E 's/^v//; s/([^-]*)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
}

build() {
  cd "$srcdir/kernel-panic"
  mkdir -p build/aur
  godot --headless --path . --export-release 'Linux x86_64' build/aur/kernel-panic
}

package() {
  install -Dm755 "$srcdir/kernel-panic/build/aur/kernel-panic" \
    "$pkgdir/usr/bin/kernel-panic"
  install -Dm644 "$srcdir/kernel-panic.desktop" \
    "$pkgdir/usr/share/applications/kernel-panic.desktop"
  install -Dm644 "$srcdir/kernel-panic/assets/icons/launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/kernel-panic.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
