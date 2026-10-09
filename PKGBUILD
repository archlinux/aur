# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=satsat
pkgver=0.6
pkgrel=1
pkgdesc="Satellite pass tracker for the desktop, a port of the SatSat iOS app"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/gosatsat"
license=('MIT')
makedepends=('go')
optdepends=(
  'libnotify: desktop pass notifications (notify-send)'
  'libxkbcommon: Wayland keyboard support'
  'mesa: GPU-accelerated rendering'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/gosatsat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f74ec17f33f5bcb96d25ff31ab1bf24cf14b576973662f3cf3fea76f8f5cd36')

build() {
  cd "gosatsat-$pkgver"
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o satsat .
}

package() {
  cd "gosatsat-$pkgver"

  # The Shirei app resolves assets from $SHIREI_RESOURCES or <exeDir>/Resources,
  # so the real binary lives outside /usr/bin and a launcher points it at the
  # installed assets.
  install -Dm755 satsat "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/Resources"
  install -m644 Resources/*.png Resources/icon.icns "$pkgdir/usr/share/$pkgname/Resources/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
export SHIREI_RESOURCES=/usr/share/$pkgname/Resources
exec /usr/lib/$pkgname/$pkgname "\$@"
EOF

  install -Dm644 Resources/icon.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=SatSat
Comment=Satellite pass tracker
Exec=$pkgname
Icon=$pkgname
Terminal=false
Categories=Science;Astronomy;Utility;
EOF
}
