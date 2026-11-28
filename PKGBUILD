# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# Installs the official AppImage unchanged. CI updates pkgver and the checksums when upstream releases
# (see .github/workflows/yogurt-appimage.yml).

pkgname=yogurt-appimage
_pkgname=yogurt
pkgver=0.3.83
pkgrel=1
pkgdesc='Private AI meeting notes that stay on your computer (AppImage)'
arch=(x86_64)
url='https://yogurt.so'
license=(MIT)
depends=(
  alsa-lib
  fuse2
  gtk3
  hicolor-icon-theme
  libcups
  mesa
  nss
)
makedepends=(binutils squashfs-tools)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
options=(!strip !debug)
_appimage="$_pkgname-$pkgver.AppImage"
source=(
  "$_appimage::https://github.com/FrigadeHQ/yogurt/releases/download/v$pkgver/Yogurt-linux-x86_64.AppImage"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/FrigadeHQ/yogurt/v$pkgver/LICENSE"
)
noextract=("$_appimage")
sha256sums=('03db3f1c9c481f0dead706070f46be7bf6ab233d36af55f2e00dc4473d679ea3'
            '5c7f0de8bbe8ee8a29540939bfdd83adf000e8c2817587d618c9637347dd34ec')

prepare() {
  # Take the desktop entry and icons out of the AppImage's squashfs without running it. The squashfs starts where the
  # ELF runtime ends, after its section headers.
  local offset
  offset=$(readelf -h "$_appimage" | awk -F: '
    /Start of section headers/ { start = $2 + 0 }
    /Size of section headers/ { size = $2 + 0 }
    /Number of section headers/ { count = $2 + 0 }
    END { print start + size * count }')
  rm -rf squashfs-root
  unsquashfs -q -n -o "$offset" -d squashfs-root "$_appimage" "$_pkgname.desktop" usr/share/icons
}

package() {
  install -Dm755 "$_appimage" "$pkgdir/opt/$pkgname/Yogurt.AppImage"

  # An AppImage can't carry Chromium's setuid sandbox helper, so Electron needs --no-sandbox, as upstream's own desktop
  # entry passes.
  install -dm755 "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /opt/%s/Yogurt.AppImage --no-sandbox "$@"\n' "$pkgname" >"$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  sed -e "s|^Exec=.*|Exec=$_pkgname %U|" -e '/^X-AppImage-Version=/d' "squashfs-root/$_pkgname.desktop" |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cp -r --no-preserve=mode squashfs-root/usr/share/icons "$pkgdir/usr/share/"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
