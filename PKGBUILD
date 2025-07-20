# Maintainer: Rsplwe <i@rsplwe.com>

pkgname=osu-lazer-extracted-bin
_pkgname=${pkgname%-extracted-bin}
pkgver=2025.710.0
pkgrel=1
pkgdesc="A free-to-win rhythm game. Rhythm is just a *click* away!"
arch=(x86_64)
url="https://osu.ppy.sh"
license=("LicenseRef-custom")
depends=(
  "opengl-driver"
  "vulkan-driver"
  "lttng-ust2.12"
)
makedepends=("desktop-file-utils")
provides=(
  "osu-lazer"
  "osu-lazer-bin"
)
conflicts=(
  "osu-lazer"
  "osu-lazer-bin"
)
options=(!strip)
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/ppy/osu/releases/download/$pkgver-lazer/osu.AppImage"
  "osu-lazer"
  "mime-16.png"
  "mime-32.png"
  "mime-48.png"
  "mime-64.png"
  "mime-128.png"
  "mime-256.png"
  "mime-512.png"
  "osu-64.png"
  "osu-128.png"
  "osu-256.png"
  "osu-512.png"
  "x-osu.xml"
)
sha256sums=(
  "4df9bbe7e8e4480ab234190dddc56bc77872c3e022de529ae99228e3bc76467b"
  "7bf9e79ddacc9271da6a751b9275b4b8c2aaaa8afd2d15ac11be358a0c1a31aa"
  "477ae757c1df888c0e3a05e7cb68dbaef052cfda5939553f927afbb75bfee077"
  "ce1dba4052855b6c2b63f862fcd909c6b4ee2790e327bca8a8bb3258a6f0c77b"
  "af97cb48475f7975696e3dfe6047faa04337f5fe1baed98fee52d270115e000f"
  "9fd8c21da9f641a36717fc840cbbb47817221ab59f71189158b0a4d597106b77"
  "9b75152e4897d480d8f5dbde1c99cd9d36dce4ff6d12130f9baeb39f324052ca"
  "6f5a5c3305170d64392f68759857fd440b0a4ec57205361287a4edc675cc3b2f"
  "81ca458a68fec1ff7f5f859f11348cccdcf9839b19bb8f20da275e79f1bdec3a"
  "189ad8d66839ea36e304500826716c47a5163bdfb4d7d94f8cfd00ebc69b8579"
  "dbc80d4b41e1050a4533e6e6b48870f29556f3858778821b3435a3ce024f1a08"
  "a62c0acf5432ab06c28767dde60aca33a9c3ed4ff0cf26c8843ff07cfaa928f2"
  "f602ce5ab3d9ae0f27dd6c11b2c67445f309be02dd380b29780e9b2048ade00e"
  "bbfad62b3a6be4c9dc67cf5a430371727ebdb363b64b9e3e519c10d1826da66a"
)

prepare() {
  chmod +x "$_pkgname-$pkgver.AppImage"
  ./$_pkgname-$pkgver.AppImage --appimage-extract
}

package() {
  # game
  install -dm755 "$pkgdir/opt/$_pkgname"
  install -Dm755 osu-lazer "$pkgdir/usr/bin/osu-lazer"
  cp -r ./squashfs-root/usr/bin/* "$pkgdir/opt/$_pkgname"

  # desktop file
  install -Dm644 ./squashfs-root/osu!.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="Icon" --set-value="osu-lazer" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="Exec" --set-value="osu-lazer %F" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="StartupWMClass" --set-value="osu!" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="StartupNotify" --set-value="true" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  desktop-file-edit --set-key="MimeType" --set-value="application/x-osu-beatmap;application/x-osu-beatmap-archive;application/x-osu-skin-archive;application/x-osu-storyboard;application/x-osu-replay;application/zip;x-scheme-handler/osu" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # app icons
  install -Dm644 osu-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 osu-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 osu-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 osu-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"

  # mimetypes
  install -Dm644 mime-512.png "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-256.png "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-128.png "$pkgdir/usr/share/icons/hicolor/128x128/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-64.png "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-48.png "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-32.png "$pkgdir/usr/share/icons/hicolor/32x32/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 mime-16.png "$pkgdir/usr/share/icons/hicolor/16x16/mimetypes/$_pkgname.x-osu-beatmap.png"
  install -Dm644 x-osu.xml "$pkgdir/usr/share/mime/packages/x-osu.xml"
}
