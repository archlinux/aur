# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Upstream: Kilowatch <support@kilowatch.co.za> — https://github.com/Kilowatch/ultimate-file-manager-pro
#
# AUR package for the official Linux companion AppImage of
# Ultimate File Manager Pro (UFM).
#
# Versioning note:
#   - pkgver tracks the GitHub *release tag* (e.g. v2.1.8) that ships the
#     companion AppImage, because release assets are published unversioned
#     (ufm-companion-x86_64.AppImage) under the Android app release tag.
#   - The companion's internal Tauri/Cargo version (UFM-Linux/src-tauri/
#     tauri.conf.json, Cargo.toml) is currently 0.1.0 and evolves
#     independently. When bumping pkgver, update the three sha256sums below
#     with:  updpkgsums  (or makepkg -g)
#
# Sources:
#   https://github.com/Kilowatch/ultimate-file-manager-pro/releases
#   Packaging sources in-repo: UFM-Linux/packaging/aur/

pkgname=ufm-companion-bin
pkgver=2.1.8
pkgrel=1
pkgdesc="Native Wayland-first Linux companion for Ultimate File Manager Pro — dual-pane file browser, Wi-Fi transfer and remote APK/XAPK sideloading"
arch=('x86_64')
url="https://github.com/Kilowatch/ultimate-file-manager-pro"
license=('GPL-3.0-only')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'librsvg'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
optdepends=(
  'noto-fonts: recommended fonts for CJK file names'
)
provides=('ufm-companion')
conflicts=('ufm-companion')
options=('!strip' '!debug')
install=ufm-companion-bin.install
source=(
  "ufm-companion-${pkgver}-x86_64.AppImage::https://github.com/Kilowatch/ultimate-file-manager-pro/releases/download/v${pkgver}/ufm-companion-x86_64.AppImage"
  "icon.png::https://raw.githubusercontent.com/Kilowatch/ultimate-file-manager-pro/v${pkgver}/UFM-Linux/src-tauri/icons/icon.png"
  "LICENSE::https://raw.githubusercontent.com/Kilowatch/ultimate-file-manager-pro/v${pkgver}/LICENSE"
)
sha256sums=(
  '6d1fee05554240898d9fcd5be556942de2ae49e436bbdbd9b5dda571f04bda72'
  '38936b95b3bdee64eec78c1f7e9d11210868e0c45ffa877a99faec24d444bd47'
  'fb981668c18a279e285fc4d83fba1e836cc84dd4daa73c9697d3cfd2d8aca6e0'
)

package() {
  # Upstream AppImage → /opt (keeps the verified, Wayland-first bundle intact;
  # no FUSE needed at runtime beyond the standard AppImage runtime).
  install -Dm755 "ufm-companion-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/ufm-companion/ufm-companion.AppImage"

  # Convenient CLI launcher.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ufm-companion/ufm-companion.AppImage "${pkgdir}/usr/bin/ufm-companion"

  # Fixed desktop entry (upstream AppImage ships an empty Categories= and a
  # space in the file name; this one is tiling-WM friendly with a stable
  # app-id based name).
  install -Dm644 "${startdir}/za.kilowatch.ufm-companion.desktop" \
    "${pkgdir}/usr/share/applications/za.kilowatch.ufm-companion.desktop"

  # Icons (512px upstream icon → hicolor + pixmaps for fallback).
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/za.kilowatch.ufm-companion.png"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/za.kilowatch.ufm-companion.png"

  # License.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
