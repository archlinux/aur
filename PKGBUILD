# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: dylan araps <dylan.araps@gmail.com>
# Contributor: mitts <mittens2001@opmbx.org>

_name=Impactor
pkgname=cydia-impactor
pkgver=0.9.52
pkgrel=4
pkgdesc='A GUI tool for working with mobile devices'
arch=('i686' 'x86_64')
url='http://www.cydiaimpactor.com'
license=('unknown')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk2' 'hicolor-icon-theme' 'libsm' 'libudev0-shim' 'libx11' 'ncurses5-compat-libs' 'pango')
makedepends=('gendesk' 'libicns' 'p7zip' 'patchelf')
optdepends=('usbmuxd: for connecting to iOS devices')
source=("https://cache.saurik.com/impactor/mac/${_name}_$pkgver.dmg")
source_i686=("https://cache.saurik.com/impactor/l32/${_name}32_$pkgver.tgz")
source_x86_64=("https://cache.saurik.com/impactor/l64/${_name}64_$pkgver.tgz")
sha256sums=('9db548074424473c5804d1118d27cd4f052db8b53b3e7c3261c1a903f521cbf1')
sha256sums_i686=('135218c123214a419b0a18dcae84ec1eeb47fa90515c509ad68aa6ec1091449f')
sha256sums_x86_64=('23b758162a34c6160021e6f82193df76bfbcc09f9476e492b76b130bb4e9e323')

build() {
  gendesk -f -n --pkgname $_name --pkgdesc "$pkgdesc" --name 'Cydia Impactor' --categories 'Utility'
  7z e -y ${_name}_$pkgver.dmg $_name/$_name.app/Contents/Resources/$_name.icns || true
  icns2png -x $_name.icns

  # remove overlinking
  patchelf \
    --remove-needed libatk-1.0.so.0 \
    --remove-needed libatomic.so.1 \
    --remove-needed libfontconfig.so.1 \
    --remove-needed libfreetype.so.6 \
    --remove-needed libgio-2.0.so.0 \
    --remove-needed libgmodule-2.0.so.0 \
    --remove-needed libncurses.so.5 \
    --remove-needed libpangoft2-1.0.so.0 \
    --remove-needed librt.so.1 \
    --remove-needed libudev.so.0 \
    Impactor
  patchelf \
    --remove-needed libatomic.so.1 \
    Impactor.so
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
