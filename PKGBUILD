# Maintainer: Mopigames <mopigames@proton.me>
pkgname=betterx-desktop-git
pkgver=1.0.0.alpha.1.r0.gxxxxxxx
pkgrel=1
pkgdesc="Desktop application for BetterX, enhancing your X browsing experience"
arch=('x86_64')
url="https://github.com/Feur-Inc/BetterX-Desktop"
license=('GPL-3.0-or-later')
depends=('electron')
makedepends=('git' 'pnpm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Feur-Inc/BetterX-Desktop.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/BetterX-Desktop"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/BetterX-Desktop"
  pnpm install
}

build() {
  cd "$srcdir/BetterX-Desktop"
  pnpm run build:arch
}

package() {
  cd "$srcdir/BetterX-Desktop"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname"
  
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/betterx-desktop" "$pkgdir/usr/bin/betterx-desktop"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}