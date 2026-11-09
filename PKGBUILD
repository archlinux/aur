# Maintainer: <你的名字> <你的邮箱>
#
# VCS package: builds the current `main` branch, which already contains the
# post-1.4.0 fixes that the v1.4.0 tag lacks, and applies the Linux fixes patch
# (system CA install via pkexec, tray/quit behaviour, code_forge FFI loading).
#
# Build needs the Flutter SDK from the AUR (`flutter-bin`).

pkgname=proxypin-git
pkgver=1.4.0.r41.g866ffad
pkgrel=1
pkgdesc='HTTP/HTTPS packet capture and manipulation tool with an in-process MITM proxy (git)'
arch=('x86_64')
url='https://github.com/wanghongenpin/proxypin'
license=('Apache-2.0')
depends=(
  'gtk3'
  'glib2'
  'libayatana-appindicator'
  'ca-certificates'
  'ca-certificates-utils'
  'hicolor-icon-theme'
)
makedepends=(
  'clang'
  'cmake'
  'ninja'
  'pkgconf'
  'rust'
  'patchelf'
  'flutter-bin'
  'git'
)
optdepends=(
  'xdg-desktop-portal: native file dialogs (file_picker)'
  'libappindicator-gtk3: alternative tray backend'
)
conflicts=('proxypin' 'proxypin-bin')
provides=('proxypin')
options=('!strip' '!debug')

source=(
  "${pkgname}::git+${url}.git"
  'proxypin-linux-fixes.patch'
  'proxypin.desktop'
)
sha256sums=('SKIP'
            'adee940c98fc957e08686b49b7ee6ec11519b273a2550d1be2f3b087f20656d8'
            '354e22fa87a7720a39890234c36975dd2fab989e2531b22b60a432b033cf4c7e')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local ver
  ver=$(grep '^version:' pubspec.yaml | sed 's/version: //; s/+.*//')
  printf '%s.r%s.g%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -p1 -i "${srcdir}/proxypin-linux-fixes.patch"
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
  command -v cargo >/dev/null || { error 'cargo not found: install rust.'; return 1; }

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
  cp -a "${_bundle}/." "${_libdir}/"

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
