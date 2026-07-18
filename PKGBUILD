# Maintainer: Rezy Dev <me@rezydev.com>

pkgname=expandrive
pkgver=2026.6.11.862
pkgrel=1
pkgdesc='Mount cloud storage as native drives on Linux'
arch=('x86_64')
url='https://www.expandrive.com/'
license=('custom:proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'fuse2'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)
source=("expandrive.deb::https://www.expandrive.com/api/download/expandrive?platform=linux&ext=deb")
sha256sums=('SKIP')

prepare() {
  mkdir -p "$srcdir/pkg"
  bsdtar -xf "$srcdir/expandrive.deb" -C "$srcdir/pkg"
  bsdtar -xf "$srcdir/pkg/data.tar.xz" -C "$srcdir/pkg"
  rm -rf "$srcdir/pkg/opt/ExpanDrive/resources/app.asar.unpacked"
}

package() {
  cp -R "$srcdir/pkg/opt/" "$pkgdir/opt/"
  cp -R "$srcdir/pkg/usr/" "$pkgdir/usr/"

  install -Dm644 "$srcdir/pkg/opt/ExpanDrive/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
  ln -sf '/opt/ExpanDrive/expandrive' '/usr/local/bin/expandrive'
}

pre_remove() {
  rm -f '/usr/local/bin/expandrive'
}
