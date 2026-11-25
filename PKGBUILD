# Maintainer: BysevenOffical <38542005+Fansirsqi@users.noreply.github.com>

pkgname=proxypin-git
pkgver=1.4.0.r746.gb10b4fe
pkgrel=1
pkgdesc='HTTP/HTTPS packet capture tool with Linux desktop improvements from the Fansirsqi fork (git)'
arch=('x86_64')
url='https://github.com/Fansirsqi/proxypin'
license=('Apache-2.0')
depends=(
  'gtk3'
  'glib2'
  'libayatana-appindicator'
  'ca-certificates'
  'ca-certificates-utils'
  'hicolor-icon-theme'
  'mpv'
  'polkit'
)
makedepends=(
  'clang'
  'cmake'
  'ninja'
  'pkgconf'
  'rustup'
  'patchelf'
  'flutter-bin'
  'git'
)
optdepends=(
  'xdg-desktop-portal: native file dialogs (file_picker)'
  'libappindicator-gtk3: alternative tray backend'
  'nss: browser certificate database management'
)
conflicts=('proxypin' 'proxypin-bin')
provides=('proxypin')
options=('!strip' '!debug')

source=(
  "${pkgname}::git+${url}.git#branch=feat/ui-settings-and-fonts"
  'proxypin.desktop'
)
sha256sums=('SKIP'
            '354e22fa87a7720a39890234c36975dd2fab989e2531b22b60a432b033cf4c7e')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local ver
  ver=$(grep '^version:' pubspec.yaml | sed 's/version: //; s/+.*//')
  printf '%s.r%s.g%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  if ! command -v flutter >/dev/null; then
    for d in /opt/flutter/bin /usr/lib/flutter/bin "${FLUTTER_ROOT:-/nonexistent}/bin" "$HOME/flutter/bin"; do
      [[ -x $d/flutter ]] && export PATH="$d:$PATH" && break
    done
  fi
  command -v flutter >/dev/null || { error 'flutter not found: install flutter-bin.'; return 1; }
  if ! command -v cargo >/dev/null; then
    for d in "$HOME/.cargo/bin" /usr/lib/rustup/bin "$HOME"/.rustup/toolchains/*/bin; do
      [[ -x $d/cargo ]] && export PATH="$d:$PATH" && break
    done
  fi
  command -v cargo >/dev/null || { error 'cargo not found: configure a toolchain with rustup.'; return 1; }

  export PROXYPIN_DART_API_DL_C="$(dirname "$(dirname "$(command -v flutter)")")/bin/cache/dart-sdk/include/dart_api_dl.c"

  flutter config --no-analytics >/dev/null 2>&1 || true
  flutter pub get
  flutter build linux --release
}

package() {
  cd "${srcdir}/${pkgname}"

  local _bundle='build/linux/x64/release/bundle'
  local _libdir="${pkgdir}/usr/lib/proxypin"

  install -dm755 "${_libdir}"
  cp -a --no-preserve=ownership "${_bundle}/." "${_libdir}/"

  install -Dm644 'build/linux/x64/release/plugins/zstandard_linux/zstd_build/libzstandard_linux.so' \
    "${_libdir}/lib/libzstandard_linux.so"

  find "${_libdir}" -type f -name '*.so*' -print0 |
    xargs -0 -r patchelf --set-rpath '$ORIGIN'

  install -d "${pkgdir}/usr/bin"
  ln -s '/usr/lib/proxypin/ProxyPin' "${pkgdir}/usr/bin/proxypin"

  install -Dm644 "${srcdir}/proxypin.desktop" \
    "${pkgdir}/usr/share/applications/proxypin.desktop"
  install -Dm644 'assets/icon.png' \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/proxypin.png"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/proxypin/LICENSE"
}
