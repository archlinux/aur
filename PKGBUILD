# Maintainer: Matthew Anderson <mpa.business@pm.me>
pkgname=moonfin
pkgver=3.0.0
pkgrel=1
pkgdesc='Jellyfin & Emby media client for Linux. Use this package for non-systemd distros'
arch=('x86_64')
url='https://github.com/Moonfin-Client/Moonfin-Core'
license=('GPL-2.0-or-later')
depends=('gtk3' 'glib2' 'libsecret' 'webkit2gtk-4.1' 'mpv' 'libepoxy'
  'alsa-lib' 'libarchive' 'harfbuzz-icu' 'xdg-user-dirs')
makedepends=('git' 'clang' 'cmake' 'ninja' 'pkgconf' 'curl' 'unzip' 'xz' 'which')
conflicts=('moonfin-bin')
options=('!strip' '!debug')
_flutter_min=3.47.0
_flutter_pin=3.47.2
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3ed47f17b824898390f675acdbfec1ab792100b150ef7d15327ef6e2d064f986')

_find_flutter() {
  local c v
  for c in \
    "${FLUTTER_BIN:-}" \
    "$(command -v flutter 2>/dev/null)" \
    "${FVM_CACHE_PATH:+${FVM_CACHE_PATH}/default/bin/flutter}" \
    "${FVM_HOME:+${FVM_HOME}/default/bin/flutter}" \
    "${HOME}/fvm/default/bin/flutter" \
    "${HOME}/.fvm/default/bin/flutter"; do
    [[ -n "$c" && -x "$c" ]] || continue
    v="$("$c" --version 2>/dev/null | sed -n 's/^Flutter \([0-9][0-9.]*\).*/\1/p' | head -n1)"
    [[ -n "$v" ]] || continue
    (($(vercmp "$v" "${_flutter_min}") >= 0)) || continue
    printf '%s\n' "$c"
    return 0
  done
  return 1
}

_env() {
  local bin
  if bin="$(_find_flutter)"; then
    :
  elif [[ -x "${srcdir}/flutter/bin/flutter" ]]; then
    bin="${srcdir}/flutter/bin/flutter"
  else
    echo "error: no usable Flutter found" >&2
    return 1
  fi

  unset FLUTTER_ROOT
  export PATH="$(dirname "${bin}"):${PATH}"
  export PUB_CACHE="${srcdir}/pub-cache"
  export XDG_CONFIG_HOME="${srcdir}/config"
  export FLUTTER_SUPPRESS_ANALYTICS=true
  export CI=true

  echo "==> Using Flutter: ${bin}"
}

prepare() {
  if _find_flutter >/dev/null; then
    echo "==> Found existing Flutter, not downloading one"
    return 0
  fi
  echo "==> No Flutter >= ${_flutter_min} found, cloning ${_flutter_pin}"
  [[ -d "${srcdir}/flutter" ]] || git clone --depth 1 --branch "${_flutter_pin}" \
    https://github.com/flutter/flutter.git "${srcdir}/flutter"
}

build() {
  _env || return 1
  cd "${srcdir}/Moonfin-Core-${pkgver}"
  flutter pub get
  local attempt
  for attempt in 1 2 3; do
    if flutter build linux --release --dart-define=DISTRIBUTION_CHANNEL=linux_aur; then
      break
    fi
    if [[ ${attempt} -eq 3 ]]; then
      return 1
    fi
    echo "==> flutter build failed (attempt ${attempt}/3), purging pdfium cache and retrying" >&2
    rm -rf build/linux/*/release/pdfium build/linux/*/release/.lib/*
    sleep $((attempt * 10))
  done
}

package() {
  cd "${srcdir}/Moonfin-Core-${pkgver}"
  local bundle=build/linux/x64/release/bundle

  install -dm755 "${pkgdir}/usr/lib/moonfin"
  cp -a "${bundle}/." "${pkgdir}/usr/lib/moonfin/"
  chmod 755 "${pkgdir}/usr/lib/moonfin/moonfin"

  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /usr/lib/moonfin/moonfin "$@"' \
    >"${pkgdir}/usr/bin/moonfin"
  chmod 755 "${pkgdir}/usr/bin/moonfin"

  install -Dm644 assets/icons/moonfin.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/org.moonfin.linux.png"
  install -Dm644 assets/icons/moonfin.png \
    "${pkgdir}/usr/share/pixmaps/org.moonfin.linux.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/org.moonfin.linux.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Moonfin
Exec=moonfin %U
Icon=org.moonfin.linux
Categories=AudioVideo;Video;
Comment=Jellyfin & Emby media client
Terminal=false
StartupWMClass=org.moonfin.linux
MimeType=x-scheme-handler/moonfin;
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
