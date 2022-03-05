# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: dylan araps <dylan.araps@gmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

_name=Impactor
pkgname=cydia-impactor
pkgver=0.9.56
pkgrel=1
pkgdesc='A GUI tool for working with mobile devices'
arch=('i686' 'x86_64')
url='http://www.cydiaimpactor.com'
license=('unknown')
depends=('atk' 'cairo' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libsm' 'libudev0-shim' 'libx11' 'ncurses5-compat-libs' 'pango')
makedepends=('gendesk' 'libicns' 'p7zip')
optdepends=('usbmuxd: for connecting to iOS devices')
source=("https://cache.saurik.com/impactor/mac/${_name}_$pkgver.dmg")
source_i686=("https://cache.saurik.com/impactor/l32/${_name}32_$pkgver.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/${_name}64_$pkgver.tgz")
sha256sums=('e73c88bb617462fb997821d2db7e7c50936af59bc790523805eeed6517249841')
sha256sums_i686=('e89350dba5e6b4f3165ab18f5328cd1a36b4e3ff9df55484f11fe10eed3cae29')
sha256sums_x86_64=('29f820217a13bc5deb087e81860229dccf4ba812d05d8f8cfa62e95ae14c09fe')

build() {
  gendesk -f -n --pkgname $_name --pkgdesc "$pkgdesc" --name 'Cydia Impactor' --categories 'Utility'
  7z e -y ${_name}_$pkgver.dmg $_name/$_name.app/Contents/Resources/$_name.icns || true
  icns2png -x $_name.icns
}

package() {
  install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin"
  install -Dm755 -t "$pkgdir/opt/$pkgname" $_name
  ln -s /opt/$pkgname/$_name "$pkgdir/usr/bin/$_name"
  install -Dm644 -t "$pkgdir/opt/$pkgname" $_name.{dat,pem}
  install -Dm755 -t "$pkgdir/usr/lib" $_name.so
  install -Dm644 -t "$pkgdir/usr/share/applications" "$_name.desktop"

  for size in 256 512 1024; do
    install -Dm644 "${_name}_${size}x${size}x32.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_name.png"
  done
}
