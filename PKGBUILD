# Maintainer: dmitrysvd

pkgname=yamusic
pkgver=5.90.0
pkgrel=1
pkgdesc="Official Yandex Music App for Linux (patched updater)"
arch=('x86_64')
url="https://music.yandex.ru/download/"
license=('custom:unknown')
provides=('yandex-music')
conflicts=('yandex-music')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3'
)
makedepends=(
  'nodejs'
  'asar'
)
options=('!strip')

source=(
  "yandex-music.deb::https://desktop.app.music.yandex.net/stable/Yandex_Music_amd64_${pkgver}.deb"
  "patch-asar-updater.sh"
)
sha256sums=(
  'b20b43ea91ff13fdff585fc7a845375cd8a72a68c730e7465c55a052b79076c2'
  'dea496e1bd76e6b3060583782940940adbb723b266c6e62e8c9d3824b7498d8c'
)

prepare() {
  local deb_file deb_unpack data_archive rootfs app_asar
  deb_file="$srcdir/yandex-music.deb"

  if [[ ! -f "$deb_file" ]]; then
    echo "Downloaded deb source not found: $deb_file" >&2
    return 1
  fi

  deb_unpack="$srcdir/deb-unpack"
  rootfs="$srcdir/rootfs"
  rm -rf "$deb_unpack" "$rootfs"
  mkdir -p "$deb_unpack" "$rootfs"

  bsdtar -xf "$deb_file" -C "$deb_unpack"

  data_archive="$(find "$deb_unpack" -maxdepth 1 -type f -name 'data.tar.*' | head -n1)"
  if [[ -z "$data_archive" ]]; then
    echo "Could not find data.tar.* in downloaded .deb" >&2
    return 1
  fi

  bsdtar -xf "$data_archive" -C "$rootfs"

  app_asar="$(find "$rootfs/opt" -type f -path '*/resources/app.asar' | head -n1)"
  if [[ -z "$app_asar" ]]; then
    echo "Could not find app.asar under /opt in extracted package" >&2
    return 1
  fi

  bash "$srcdir/patch-asar-updater.sh" --in-place "$app_asar"
  rm -f "${app_asar}.bak."*
}

package() {
  cp -a "$srcdir/rootfs/." "$pkgdir/"

  if [[ -d "$pkgdir/opt/Яндекс Музыка" ]]; then
    mv "$pkgdir/opt/Яндекс Музыка" "$pkgdir/opt/yandex-music"
  fi

  if [[ -f "$pkgdir/usr/share/applications/yandexmusic.desktop" ]]; then
    sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "$pkgdir/usr/share/applications/yandexmusic.desktop"
    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "$pkgdir/usr/share/applications/yandexmusic.desktop"
    sed -i 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' "$pkgdir/usr/share/applications/yandexmusic.desktop"
  fi
}
