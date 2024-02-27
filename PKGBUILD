# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=zutty-git
pkgver=140.7e481c0
pkgrel=1
pkgdesc='Terminal emulator'
arch=(x86_64)
url='https://tomscii.sig7.se/zutty/'
license=(GPL3)
conflicts=(zutty)
depends=(freetype2 libglvnd libxmu xorg-fonts-misc)
makedepends=(git python)
source=('git+https://git.hq.sig7.se/zutty.git')
sha256sums=(SKIP)

pkgver() {
  cd zutty
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd zutty
  python ./waf configure --prefix=/usr
  python ./waf build
}

package() {
  cd zutty
  python ./waf --destdir="$pkgdir" install
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -v doc/* "$pkgdir/usr/share/doc/$pkgname"
  cd icons
  install -Dm644 zutty.desktop "$pkgdir/usr/share/applications/zutty.desktop"
  install -Dm644 zutty.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zutty.svg"
  for res in 16x16 32x32 48x48 64x64 96x96 128x128; do
    install -Dm644 zutty_$res.png "$pkgdir/usr/share/icons/hicolor/$res/apps/zutty.png"
  done

}
