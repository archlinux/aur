# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-screen-capture
_app_id=remya_screen_capture
_upstream_ver=0.4.2
pkgver=0.4.2
pkgrel=1
pkgdesc="Screen capture, recording and editing for Hyprland"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-screen-capture"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('remya-core>=0.3.0' 'gtk3' 'gtk-layer-shell' 'wayland' 'hyprland' 'grim>=1.5'
         'wl-clipboard' 'fontconfig' 'inter-font' 'gpu-screen-recorder'
         'ffmpeg' 'mpv' 'libepoxy' 'xdg-utils' 'glibc' 'gcc-libs')
options=('!strip')
_core_commit=988388e9d3144f7bc48e542eab5e4c0e6ddc12ec
makedepends=('clang' 'cmake' 'fvm' 'ninja' 'rustup' 'wayland-protocols')
conflicts=('remya-screen-capture-bin' 'remya-screen-capture-git')
source=("remya-screen-capture-${_upstream_ver}.tar.gz::${url}/archive/refs/tags/v${_upstream_ver}.tar.gz"
        "remya-core-${_core_commit}.tar.gz::https://github.com/remyhuang03/remya-core/archive/${_core_commit}.tar.gz")
sha256sums=('28f298eefa64cb89927dd7c3accf4a3f2d7d3af3087b1620dfa0d0b8391c8026'
            '649c118804408ed3d95199e84cb4fd004f80d8791d893cbab1bb353795f6f203')

prepare() {
  ln -sfnT "remya-core-${_core_commit}" "${srcdir}/remya-core"
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
  install -Dm644 linux/packaging/remya-screen-capture.json "${pkgdir}/usr/share/remya/apps/remya-screen-capture.json"
  install -Dm644 assets/icons/app_icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.screen_capture.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/licenses/material-symbols.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/material-symbols.txt"
  install -Dm644 lib/src/rust/capture/THIRD_PARTY_NOTICES.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
}
