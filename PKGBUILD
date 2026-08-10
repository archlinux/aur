# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=aprstac-bin
pkgver=0.2.4
pkgrel=2
pkgdesc="A modern APRS web client, digipeater, IGate, BBS, and fileshare (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://aprstac.com/"
license=('custom:proprietary')
options=('!strip')
depends=('gcc-libs' 'glibc')
provides=('aprstac')
conflicts=('aprstac')
source=('LICENSE'
        'aprstac.desktop'
        'aprstac.service'
        'aprstac.png')
source_x86_64=('APRStac-x86_64.AppImage::https://aprstac.com/downloads/APRStac-x86_64.AppImage')
source_aarch64=('aprstac-server-arm64::https://aprstac.com/downloads/aprstac-server-arm64')
sha256sums=('d2309a72446dac53dbe391ec2e8972f2fccbc6a06ab144c9011d5bd419c998e7'
            '6c57b27e9502b24d45105c6bd64f4e692750f485611285a92a75a87c5ffd2a12'
            'e0517815bc0ffe3a771b167757c00640f9c907ecbee0a753d1f8487e92205cf6'
            '9f57e5714745c334a09389cba494a101b193c88c642f9c5c68a4387844eae094')
sha256sums_x86_64=('838c67fa375937e312244be00cbf5452f7fb0bba21763b21be0c16795a97ed82')
sha256sums_aarch64=('12e5866981f0dae4c7735ba7addb54ca9d6f6cb221eeaf36f3e440d3f1ab5311')

prepare() {
  if [[ $CARCH == x86_64 ]]; then
    chmod +x "$srcdir/APRStac-x86_64.AppImage"
    cd "$srcdir"
    "$srcdir/APRStac-x86_64.AppImage" --appimage-extract >/dev/null
  fi
}

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/squashfs-root/usr/bin/aprstac-server" \
      "$pkgdir/usr/bin/aprstac-server"
  else
    install -Dm755 "$srcdir/aprstac-server-arm64" \
      "$pkgdir/usr/bin/aprstac-server"
  fi

  # Install enhanced desktop entry (adds GenericName, Keywords for Ham Radio menu integration)
  install -Dm644 "$srcdir/aprstac.desktop" "$pkgdir/usr/share/applications/aprstac.desktop"

  install -Dm644 "$srcdir/aprstac.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/aprstac.png"

  install -Dm644 "$srcdir/aprstac.service" \
    "$pkgdir/usr/lib/systemd/system/aprstac.service"

  # Install the custom license file
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
