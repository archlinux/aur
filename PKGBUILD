# Maintainer: Nastem <nastemwayne at gmail dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ariel AxionL <i at axionl dot me>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Contributor: kearneyBack <191615342 at qq dot com>

pkgname=baidunetdisk-bin
pkgver=8.7.0
pkgrel=2
pkgdesc='Baidu Netdisk - a cloud storage client (Linux Version)'
arch=('x86_64')
url='https://pan.baidu.com'
license=('LicenseRef-custom')
depends=('gtkmm' 'gtk3' 'alsa-lib' 'nss' 'hicolor-icon-theme' 'libappindicator-gtk3')
optdepends=(
  'libnotify: desktop notification support'
  'libsecret: secure credential storage'
  'libxss: screensaver inhibition during playback'
)
provides=('baidunetdisk')
conflicts=('baidunetdisk')
options=('!strip' '!debug')

source=(
  'baidunetdisk-wrapper.sh'
)
source_x86_64=(
  "baidunetdisk-${pkgver}.${CARCH}.deb::https://pkg-ant.baidu.com/issue/netdisk/LinuxGuanjia/${pkgver}/baidunetdisk_${pkgver}_amd64.deb"
)

sha256sums=('c371a9c6edb4c55e0d6d1918f82ba4a559e4076960bc956f1576b0c19de2109c')
sha256sums_x86_64=('ec71c2ad1151609fd0d8b86d95184c0b457d6db5aa18861e0b15fc23ccfe01f7')

_extract_deb() {
  local deb="$1" dest="$2" data
  data=$(ar t "$deb" | awk '/^data\.tar\./ { print; exit }')
  case "$data" in
  *.xz) ar p "$deb" "$data" | bsdtar -xJf - -C "$dest" ;;
  *.bz2) ar p "$deb" "$data" | bsdtar -xjf - -C "$dest" ;;
  *.zst) ar p "$deb" "$data" | bsdtar --zstd -xf - -C "$dest" ;;
  *.gz) ar p "$deb" "$data" | bsdtar -xzf - -C "$dest" ;;
  *)
    printf 'Unsupported Debian archive payload: %s\n' "$data" >&2
    return 1
    ;;
  esac
}

prepare() {
  mkdir -p extracted
  _extract_deb "${srcdir}/baidunetdisk-${pkgver}.${CARCH}.deb" "${srcdir}/extracted"
}

package() {
  local appdir="${pkgdir}/usr/lib/baidunetdisk"

  install -dm755 "$appdir"
  cp -a --no-preserve=ownership "${srcdir}/extracted/opt/baidunetdisk/." "$appdir/"

  # Sentry CLI is only used while building/uploading sourcemaps.
  rm -rf "$appdir/resources/app.asar.unpacked/node_modules/@sentry"

  sed -i -E 's|^Exec=.*|Exec=/usr/bin/baidunetdisk %U|' "$appdir/baidunetdisk.desktop"
  sed -i -E \
    -e 's|^Exec=.*|Exec=/usr/bin/baidunetdisk -diskopen|' \
    -e 's|^Icon=.*|Icon=baidunetdisk|' \
    "$appdir/baidunetdiskv.desktop"
  sed -i -E 's|^Exec=.*|Exec=/usr/bin/baidunetdisk --menuupload %F|' \
    "$appdir/baiduNetdiskContext.conf"

  install -Dm644 "$appdir/baidunetdisk.desktop" \
    "${pkgdir}/usr/share/applications/baidunetdisk.desktop"
  install -Dm644 "$appdir/baidunetdisk.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/baidunetdisk.svg"
  install -Dm644 "$appdir/baidunetdiskv.desktop" \
    "${pkgdir}/usr/share/dde-file-manager/extensions/appEntry/baidunetdiskv.desktop"
  install -Dm644 "$appdir/baiduNetdiskContext.conf" \
    "${pkgdir}/usr/share/applications/context-menus/baiduNetdiskContext.conf"
  install -Dm755 "${srcdir}/baidunetdisk-wrapper.sh" \
    "${pkgdir}/usr/bin/baidunetdisk"

  install -Dm644 "$appdir/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "$appdir/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  find "$appdir" -type d -exec chmod 755 {} +
  find "$appdir" -type f -name '*.so*' -exec chmod 644 {} +
}
