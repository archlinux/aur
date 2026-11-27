# Maintainer: Gustavo Martins <gustarmartins at users dot noreply dot github dot com>

pkgname=mornye-git
_pkgname=mornye
pkgver=5.4.5.r1.gaf9a4d6
pkgrel=1
pkgdesc='Desktop music player and library manager built with Flutter and Rust (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/mornyeapp/Mornye'
license=('LGPL-3.0-only')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'ffmpeg'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'json-glib'
  'libepoxy'
  'libsecret'
  'mpv'
  'pango'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'curl'
  'git'
  'jq'
  'libunwind'
  'ninja'
  'patchelf'
  'pkgconf'
  'unzip'
  'which'
  'xz'
)
optdepends=(
  'gst-plugins-base: additional GStreamer audio codecs'
  'gst-plugins-good: additional GStreamer audio codecs'
  'xdg-desktop-portal: native folder picker dialogs'
  'xdg-utils: open external links and folders'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug' '!lto')
source=("${_pkgname}::git+https://github.com/mornyeapp/Mornye.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  local flutter_version
  flutter_version="$(jq -r .flutter .fvmrc)"
  local flutter_dir="${srcdir}/flutter-sdk-${flutter_version}"

  if [[ ! -d "${flutter_dir}/.git" ]]; then
    git clone --depth 1 --branch "${flutter_version}" \
      https://github.com/flutter/flutter.git "${flutter_dir}"
  fi

  export FLUTTER_SUPPRESS_ANALYTICS=true
  export XDG_CONFIG_HOME="${srcdir}/xdg-config"
  export PUB_CACHE="${srcdir}/pub-cache"
  export PATH="${flutter_dir}/bin:${PATH}"

  flutter config --no-analytics --enable-linux-desktop
  flutter --version
  flutter pub get
  dart scripts/gen_l10n.dart

  if [[ -f scripts/prepare_flutter_sdk.dart ]]; then
    dart scripts/prepare_flutter_sdk.dart --sdk "${flutter_dir}"
  fi

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --manifest-path rust_backend/Cargo.toml
}

build() {
  cd "${srcdir}/${_pkgname}"

  local flutter_version
  flutter_version="$(jq -r .flutter .fvmrc)"
  local flutter_dir="${srcdir}/flutter-sdk-${flutter_version}"

  export FLUTTER_SUPPRESS_ANALYTICS=true
  export XDG_CONFIG_HOME="${srcdir}/xdg-config"
  export PUB_CACHE="${srcdir}/pub-cache"
  export CARGO_HOME="${srcdir}/cargo-home"
  export PATH="${flutter_dir}/bin:${PATH}"

  # Flutter Linux compiles native plugins with clang++; avoid GCC-only makepkg flags.
  unset CFLAGS CXXFLAGS LDFLAGS
  # Cargo splits RUSTFLAGS on whitespace; encode arguments so srcdir may contain spaces.
  local encoded_rustflags="${CARGO_ENCODED_RUSTFLAGS:-}"
  if [[ -z "${encoded_rustflags}" && -n "${RUSTFLAGS:-}" ]]; then
    local -a rustflags_array
    read -r -a rustflags_array <<< "${RUSTFLAGS}"
    printf -v encoded_rustflags '%s\037' "${rustflags_array[@]}"
    encoded_rustflags="${encoded_rustflags%$'\037'}"
  fi
  [[ -z "${encoded_rustflags}" ]] || encoded_rustflags+=$'\037'
  encoded_rustflags+="--remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
  export CARGO_ENCODED_RUSTFLAGS="${encoded_rustflags}"

  # Native C/C++ dependencies can embed __FILE__ paths independently of rustc.
  local c_remap
  printf -v c_remap '%q' "-ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"
  env CFLAGS="${c_remap}" CXXFLAGS="${c_remap}" CC_SHELL_ESCAPED_FLAGS=1 \
    bash scripts/build_rust_backend.sh desktop

  local git_commit
  git_commit="$(git rev-parse --short=8 HEAD)"
  flutter build linux --release --no-pub --target lib/main.dart \
    --dart-define="GIT_COMMIT=${git_commit}"
}

package() {
  cd "${srcdir}/${_pkgname}"

  local flutter_arch='x64'
  if [[ "${CARCH}" == 'aarch64' ]]; then
    flutter_arch='arm64'
  fi
  local bundle="build/linux/${flutter_arch}/release/bundle"
  local app_id='com.zarz.mornye'

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/bin"
  cp -a "${bundle}/." "${pkgdir}/usr/lib/${_pkgname}/"
  local lib
  for lib in "${pkgdir}/usr/lib/${_pkgname}/lib"/lib*_plugin.so; do
    [[ -f "${lib}" ]] && patchelf --set-rpath '$ORIGIN' "${lib}"
  done
  ln -s "../lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "linux/packaging/${app_id}.desktop" \
    "${pkgdir}/usr/share/applications/${app_id}.desktop"
  install -Dm644 "linux/packaging/${app_id}.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/${app_id}.metainfo.xml"

  local size
  for size in 128 256; do
    install -Dm644 "linux/packaging/icons/mornye-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${app_id}.png"
  done
  install -Dm644 "assets/brand/logo/png/mornye-badge@1x.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${app_id}.png"
  install -Dm644 "assets/brand/logo/svg/mornye-badge.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${app_id}.svg"

  install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  install -Dm644 COPYING "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
  install -Dm644 NOTICE "${pkgdir}/usr/share/doc/${_pkgname}/NOTICE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
