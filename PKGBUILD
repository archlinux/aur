pkgname=deskcut-git
pkgver=r22.6dafd6e
pkgrel=1
arch=('x86_64')
pkgdesc="DeskCut is an extremely easy to use desktop shortcut creator app for Linux."
url='https://github.com/NayamAmarshe/DeskCut'
license=('GPL-2.0 ONLY')
makedepends=('yarn' 'asar' 'nodejs')
source=("$pkgname::git+https://github.com/NayamAmarshe/DeskCut.git"
        "deskcut.desktop")
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  yarn install
  yarn build
}

package() {
  cd "$pkgname"
  npx electron-builder --dir
  
  cd "dist"
  mkdir -p "$pkgdir/opt/DeskCut"
  cp -R linux-unpacked/* "$pkgdir/opt/DeskCut/"

  cd ../

  install -Dm644 build/icons/16x16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/deskcut.png"
  install -Dm644 build/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/deskcut.png"
  install -Dm644 build/icons/64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/deskcut.png"
  install -Dm644 build/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/deskcut.png"
  install -Dm644 build/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/deskcut.png"

  cd ../

  install -Dm755 deskcut.desktop "$pkgdir/usr/share/applications/deskcut.desktop"
}
