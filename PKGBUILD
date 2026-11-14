# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-settings-git
_app_id=remya_settings
_upstream_ver=0.1.0-dev.20261114.0
pkgver=0.1.0_dev.20261114.0.r134.g246b906
pkgrel=1
pkgdesc="A Material Design 3 Expressive system settings application for Hyprland on Linux (git)"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-settings"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=(
  'remya-core'
  'gtk3'
  'gstreamer'
  'gst-plugins-base-libs'
  'glibc'
  'gcc-libs'
)
makedepends=(
  'clang'
  'cmake'
  'fvm'
  'git'
  'ninja'
  'python'
  'rust'
)
provides=('remya-settings')
conflicts=('remya-settings' 'remya-settings-bin')
options=('!strip' '!lto')
source=("git+${url}.git" "git+https://github.com/remyhuang03/remya-core.git#tag=v0.1.0")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/remya-settings"
  local ver
  ver=$(sed -n 's/^version:[[:space:]]*//p' pubspec.yaml | head -n1 | tr '-' '_')
  printf "%s.r%s.g%s" "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/remya-settings"
  fvm install
  fvm flutter pub get --enforce-lockfile
  fvm flutter build linux --release
}

package() {
  cd "${srcdir}/remya-settings"

  install -d "${pkgdir}/usr/lib/${_app_id}"
  cp -a build/linux/x64/release/bundle/remya_settings "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/lib "${pkgdir}/usr/lib/${_app_id}/"
  cp -a build/linux/x64/release/bundle/data "${pkgdir}/usr/lib/${_app_id}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"

  install -Dm644 "linux/packaging/top.remya.settings.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.settings.desktop"
  install -Dm644 "linux/packaging/top.remya.settings.appimage.desktop" \
    "${pkgdir}/usr/share/applications/top.remya.settings.appimage.desktop"
  install -Dm644 "assets/icons/app_icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.settings.svg"

  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "assets/licenses/rust-dependencies.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
  install -Dm644 "assets/licenses/croppy-kiwi.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/croppy-kiwi.txt"
}
