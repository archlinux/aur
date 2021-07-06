# Maintainer: onbjerg <hi@notbjerg.me>
pkgname=frame-eth
pkgver="0.4.4"
pkgrel=1
pkgdesc="System-wide Web3"
arch=('x86_64')
url='https://frame.sh'
license=('GPL3')
depends=('gtk3' 'nss' 'libxss')
makedepends=('nodejs>=14.8.0' 'libusb' 'python3' 'git' 'node-gyp')
provides=('frame')
install=$pkgname.install
source=("git+https://github.com/floating/frame.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('SKIP' 'SKIP')

build() {
  cd frame
  npm install --cache "${srcdir}/npm-cache"
  npm run build -- --linux dir
}

package() {
  cd frame
  install -d "$pkgdir/opt/$pkgname"
  cp -r --preserve=mode dist/linux-unpacked/* "$pkgdir/opt/$pkgname/"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "asset/png/FrameAppIcon.png" "$pkgdir/usr/share/pixmaps/frame.png"
  printf "#!/bin/sh\n\n/opt/$pkgname/frame \"\$@\"\n" | install -Dm755 /dev/stdin "$pkgdir/usr/bin/frame"
}
