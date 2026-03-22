# Maintainer: poco <poco@localhost>

pkgname=shikiwatch-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Unofficial Shikimori client for Linux desktop (prebuilt AppImage)'
arch=('x86_64')
url='https://github.com/wheremyfiji/ShikiWatch'
license=('MIT')
depends=('glibc' 'gtk3' 'hicolor-icon-theme')
provides=('shikiwatch')
conflicts=('shikiwatch')
options=('!strip')

_appimage="ShikiWatch-${pkgver}-linux-x64.AppImage"
source=(
  "${_appimage}::https://github.com/wheremyfiji/ShikiWatch/releases/download/v${pkgver}/${_appimage}"
  "LICENSE::https://raw.githubusercontent.com/wheremyfiji/ShikiWatch/v${pkgver}/LICENSE"
)
sha256sums=(
  '62891f44c649959b4b77f7760d870367cca7dd037b2e67320db023141a1522c0'
  '9f6c56e47aaa4ce1d0048256809518adb074c3e08f58df7fa80bf8191aaa752a'
)
noextract=("${_appimage}")

prepare() {
  cd "$srcdir"
  chmod +x "${_appimage}"
  rm -rf squashfs-root
  "./${_appimage}" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir/squashfs-root"

  install -dm755 "$pkgdir/opt/shikiwatch"
  cp -a usr "$pkgdir/opt/shikiwatch/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/shikiwatch" <<'LAUNCHER'
#!/usr/bin/env bash
appdir='/opt/shikiwatch'
export LD_LIBRARY_PATH="${appdir}/usr/bin/lib:${LD_LIBRARY_PATH}"
exec "${appdir}/usr/bin/ShikiWatch" "$@"
LAUNCHER

  install -Dm644 "$pkgdir/opt/shikiwatch/usr/share/applications/ShikiWatch.desktop" \
    "$pkgdir/usr/share/applications/shikiwatch.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=shikiwatch|' \
    -e 's|^Icon=.*|Icon=shikiwatch|' \
    "$pkgdir/usr/share/applications/shikiwatch.desktop"

  install -Dm644 "$pkgdir/opt/shikiwatch/usr/share/icons/hicolor/256x256/apps/ShikiWatch.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/shikiwatch.png"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
