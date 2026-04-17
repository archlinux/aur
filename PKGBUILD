pkgname=sniffnet-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Comfortably monitor your network traffic (prebuilt binary)'
arch=('x86_64')
url='https://github.com/GyulyVGC/sniffnet'
license=('Apache-2.0' 'MIT')
depends=('alsa-lib' 'fontconfig' 'hicolor-icon-theme' 'libcap' 'libpcap')
provides=("sniffnet=${pkgver}")
conflicts=('sniffnet')
install="$pkgname.install"
source=("$pkgname-$pkgver.AppImage::https://github.com/GyulyVGC/sniffnet/releases/download/v$pkgver/Sniffnet_LinuxAppImage_amd64.AppImage")
sha256sums=('acd6360169831dd3481fcb28a64f0f23a3d4e84598e0662b425713ce87cc5b4e')
noextract=("$pkgname-$pkgver.AppImage")

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  rm -rf "$srcdir/squashfs-root"
  "$srcdir/$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/squashfs-root/usr/." "$pkgdir/opt/$pkgname/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/bin/sniffnet" "$pkgdir/usr/bin/sniffnet"

  install -Dm644 "$srcdir/squashfs-root/sniffnet.desktop" "$pkgdir/usr/share/applications/sniffnet.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/sniffnet|" "$pkgdir/usr/share/applications/sniffnet.desktop"
  sed -i '/^X-AppImage-Version=/d' "$pkgdir/usr/share/applications/sniffnet.desktop"

  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$srcdir/squashfs-root/usr/share/icons/." "$pkgdir/usr/share/icons/"

  if [[ -f "$srcdir/squashfs-root/usr/share/doc/sniffnet/copyright" ]]; then
    install -Dm644 "$srcdir/squashfs-root/usr/share/doc/sniffnet/copyright" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
