# Maintainer: Nastem <nastemwayne at gmail dot com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ariel AxionL <i at axionl dot me>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Contributor: kearneyBack <191615342 at qq dot com>

pkgname=baidunetdisk-bin
pkgver=8.7.0
pkgrel=1
pkgdesc='Baidu Netdisk - a cloud storage client (Linux Version)'
arch=('x86_64')
url='https://pan.baidu.com'
license=('LicenseRef-custom')
depends=('gtk3' 'alsa-lib' 'libnotify' 'libsecret' 'libxss' 'nss' 'hicolor-icon-theme'
  'libappindicator-gtk3')
provides=('baidunetdisk')
conflicts=('baidunetdisk')
options=('!strip' '!debug')

source=(
  'baidunetdisk-wrapper.sh'
  'https://deb.debian.org/debian/pool/main/a/atkmm1.6/libatkmm-1.6-1v5_2.28.3-1_amd64.deb'
  'https://deb.debian.org/debian/pool/main/c/cairomm/libcairomm-1.0-1v5_1.14.4-2_amd64.deb'
  'https://deb.debian.org/debian/pool/main/g/glibmm2.4/libglibmm-2.4-1v5_2.66.5-2_amd64.deb'
  'https://deb.debian.org/debian/pool/main/g/gtk+2.0/libgtk2.0-0_2.24.33-2+deb12u1_amd64.deb'
  'https://deb.debian.org/debian/pool/main/g/gtkmm2.4/libgtkmm-2.4-1v5_2.24.5-4+b1_amd64.deb'
  'https://deb.debian.org/debian/pool/main/p/pangomm/libpangomm-1.4-1v5_2.46.3-1_amd64.deb'
  'https://deb.debian.org/debian/pool/main/libs/libsigc++-2.0/libsigc++-2.0-0v5_2.12.0-1_amd64.deb'
)
source_x86_64=(
  "baidunetdisk-${pkgver}.${CARCH}.deb::https://pkg-ant.baidu.com/issue/netdisk/LinuxGuanjia/${pkgver}/baidunetdisk_${pkgver}_amd64.deb"
)

sha256sums=('3f6655276fe99fec31915e799e044e75853cb3bb180f013cc0e7f21910f9bf72'
  'f98c29a1962bb98d147c72e05a92eeba36f829ff1538eaaed550301a841fad95'
  '6cb05750d23a03c4a3161e023e44051240bb27458da06c316fbe0c31b9807a49'
  'a11c03dd8f9b454eaeae38ce782ceb45d9b52f5695d86d1d262c9062c678a2ba'
  'd1e9a26a5961748f220c5989c89516fead2a5054b80914f94c71c3fee6fdebe3'
  '028c21afe635dfcad591118049364f15bacc5dc0af18ea814f3bebb1e9c00afa'
  '3bcb2bb2c7dece7be81cd12f0c2eb25a0964642ba1e62e7a98264cb0ab4cde9e'
  '60d62e980e199094e37a09c5896f736fc64354c0b0b9dbefb1b588ec26bc0bf9')
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
  mkdir -p extracted legacy-root
  _extract_deb "${srcdir}/baidunetdisk-${pkgver}.${CARCH}.deb" "${srcdir}/extracted"

  local deb
  for deb in "${srcdir}"/lib*.deb; do
    _extract_deb "$deb" "${srcdir}/legacy-root"
  done
}

package() {
  local appdir="${pkgdir}/usr/lib/baidunetdisk"
  local legacy_dir
  legacy_dir=$(find "${srcdir}/legacy-root/usr/lib" -mindepth 1 -maxdepth 1 -type d -print -quit)
  local legacy_lib
  local legacy_libs=(
    'libatkmm-1.6.so.1*'
    'libcairomm-1.0.so.1*'
    'libgdk-x11-2.0.so.0*'
    'libgdkmm-2.4.so.1*'
    'libgiomm-2.4.so.1*'
    'libglibmm-2.4.so.1*'
    'libgtk-x11-2.0.so.0*'
    'libgtkmm-2.4.so.1*'
    'libpangomm-1.4.so.1*'
    'libsigc-2.0.so.0*'
  )

  install -dm755 "$appdir" "${appdir}/legacy-libs"
  cp -a --no-preserve=ownership "${srcdir}/extracted/opt/baidunetdisk/." "$appdir/"
  for legacy_lib in "${legacy_libs[@]}"; do
    find "$legacy_dir" -maxdepth 1 \( -type f -o -type l \) \
      -name "$legacy_lib" \
      -exec cp -a --no-preserve=ownership {} "${appdir}/legacy-libs/" \;
  done

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
