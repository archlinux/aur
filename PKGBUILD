# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-screen-capture
_app_id=remya_screen_capture
_upstream_ver=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Screen capture, recording and editing for Hyprland"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-screen-capture"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'gtk-layer-shell' 'wayland' 'hyprland' 'grim>=1.5'
         'wl-clipboard' 'fontconfig' 'inter-font' 'gpu-screen-recorder'
         'ffmpeg' 'mpv' 'libepoxy' 'xdg-utils' 'glibc' 'gcc-libs')
options=('!strip')
_settings_ver=0.1.0-dev.20261113.0
makedepends=('clang' 'cmake' 'fvm' 'ninja' 'rustup' 'wayland-protocols')
conflicts=('remya-screen-capture-bin' 'remya-screen-capture-git')
source=("remya-screen-capture-${_upstream_ver}.tar.gz::${url}/archive/refs/tags/v${_upstream_ver}.tar.gz"
        "remya-settings-${_settings_ver}.tar.gz::https://github.com/remyhuang03/remya-settings/archive/refs/tags/v${_settings_ver}.tar.gz")
sha256sums=('e967beb4a1154d406621419625c637252f271373b2e7377756011248e1ffe4d4' '96921bb1f5327bfe87259fb01790bc24411b5e6dc0a3cceef5ab54c63043e8c0')

prepare() {
  ln -sfnT "remya-settings-${_settings_ver}" "${srcdir}/remya-settings"
}

build() {
  cd "${srcdir}/remya-screen-capture-${_upstream_ver}"
  fvm install
  fvm flutter pub get --enforce-lockfile
  fvm flutter build linux --release
}

package() {
  cd "${srcdir}/remya-screen-capture-${_upstream_ver}"
  install -d "${pkgdir}/usr/lib/${_app_id}" "${pkgdir}/usr/bin"
  cp -a build/linux/x64/release/bundle/. "${pkgdir}/usr/lib/${_app_id}/"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"
  install -Dm644 linux/packaging/top.remya.screen_capture.desktop \
    "${pkgdir}/usr/share/applications/top.remya.screen_capture.desktop"
  install -Dm644 assets/icons/screen_capture.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.screen_capture.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/licenses/material-symbols.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/material-symbols.txt"
  install -Dm644 lib/src/rust/capture/THIRD_PARTY_NOTICES.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
}
