# Maintainer: mafuzyk
pkgname=kernel-panic-git
pkgver=2.5.0.r0.g4c36561
pkgrel=1
pkgdesc='Neon arena shooter about keeping one stubborn process alive (development version)'
arch=('x86_64')
url='https://github.com/mafuzyk/kernel-panic'
license=('MIT')
depends=('godot')
makedepends=('git')
provides=('kernel-panic')
conflicts=('kernel-panic' 'kernel-panic-bin')
source=(
  'git+https://github.com/mafuzyk/kernel-panic.git#branch=main'
  'kernel-panic.sh'
  'kernel-panic.desktop'
  'LICENSE'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/kernel-panic"
  git describe --long --tags --match='v[0-9]*' | \
    sed -E 's/^v//; s/([^-]*)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
}

build() {
  cd "$srcdir/kernel-panic"
  mkdir -p build/aur
  godot --headless --path . --export-pack 'Linux x86_64' build/aur/kernel-panic.pck
}

package() {
  install -Dm755 "$srcdir/kernel-panic.sh" \
    "$pkgdir/usr/bin/kernel-panic"
  install -Dm644 "$srcdir/kernel-panic/build/aur/kernel-panic.pck" \
    "$pkgdir/usr/share/kernel-panic/kernel-panic.pck"
  install -Dm644 "$srcdir/kernel-panic.desktop" \
    "$pkgdir/usr/share/applications/kernel-panic.desktop"
  install -Dm644 "$srcdir/kernel-panic/assets/icons/launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/kernel-panic.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
