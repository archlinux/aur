# Maintainer: Jakariya Abbas <jakariya3460 at gmail dot com>

pkgname=openchamber-bin
pkgver=2.7.0
pkgrel=4
pkgdesc='OpenChamber desktop application (official prebuilt Linux binary)'
arch=('x86_64')
url='https://github.com/openchamber/openchamber'
license=('MIT')

depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux'
  'util-linux-libs'
  'xdg-utils'
)

makedepends=(
  'binutils'
  'libarchive'
  'patchelf'
)

conflicts=(
  'openchamber-desktop'
  'openchamber-desktop-git'
  'openchamber-desktop-appimage'
)

install="${pkgname}.install"
options=('!strip')

_deb="OpenChamber-${pkgver}-linux-amd64.deb"
_installdir='/opt/OpenChamber'

source=(
  "${_deb}::https://github.com/openchamber/openchamber/releases/download/v${pkgver}/${_deb}"
  'LICENSE-MIT'
)

sha256sums=(
  'c9a47ee59841c670e8322448b6f53c9e4756de7a6df885660e821402b5d1829d'
  '1f6e869a3feff6b4eb07907afc89176562b1f4324389f163d9fd94f09864b44e'
)

prepare() {
  local archive_dir="${srcdir}/deb-archive"
  local root_dir="${srcdir}/deb-root"

  mkdir -p "$archive_dir" "$root_dir"

  # Extract the Debian archive members.
  (
    cd "$archive_dir"
    ar x "${srcdir}/${_deb}"
  )

  # Extract the application filesystem payload.
  bsdtar -xf "${archive_dir}/data.tar.xz" -C "$root_dir"

  # Validate required application files.
  [[ -x "${root_dir}${_installdir}/openchamber" ]] || {
    printf 'ERROR: OpenChamber executable not found.\n' >&2
    return 1
  }

  [[ -x "${root_dir}${_installdir}/chrome-sandbox" ]] || {
    printf 'ERROR: Chromium sandbox helper not found.\n' >&2
    return 1
  }

  [[ -f "${root_dir}/usr/share/applications/openchamber.desktop" ]] || {
    printf 'ERROR: Desktop entry not found.\n' >&2
    return 1
  }

  [[ -f "${root_dir}/usr/share/icons/hicolor/512x512/apps/openchamber.png" ]] || {
    printf 'ERROR: Application icon not found.\n' >&2
    return 1
  }

  # Replace the upstream build-machine RUNPATH in Sherpa ONNX libraries.
  local sherpa_dir="${root_dir}${_installdir}/resources/app.asar.unpacked/node_modules/sherpa-onnx-linux-x64"

  if [[ -d "$sherpa_dir" ]]; then
    find "$sherpa_dir" -type f \
      \( -name '*.so' -o -name '*.node' \) \
      -exec patchelf --set-rpath '$ORIGIN' {} +
  fi

  # Prevent the Debian-specific updater from selecting apt.
  rm -f "${root_dir}${_installdir}/resources/package-type"
}

package() {
  local root_dir="${srcdir}/deb-root"
  local app_dir="${pkgdir}${_installdir}"

  # Install the upstream Debian filesystem payload.
  cp -a "${root_dir}/." "${pkgdir}/"

  # Keep the sandbox helper non-setuid in the package archive.
  # The install script configures it according to user namespace support.
  chmod 0755 "${app_dir}/chrome-sandbox"

  # Arch-specific launcher. Do not create /usr/bin/openchamber,
  # which may belong to the separate OpenChamber CLI package.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openchamber-desktop" <<'EOF'
#!/bin/sh
exec /opt/OpenChamber/openchamber "$@"
EOF

  # Use the Arch launcher in the desktop entry.
  sed -i \
    's|^Exec=.*|Exec=openchamber-desktop %U|' \
    "${pkgdir}/usr/share/applications/openchamber.desktop"

  chmod 0644 "${pkgdir}/usr/share/applications/openchamber.desktop"

  # Install the project's MIT license.
  install -Dm644 "${srcdir}/LICENSE-MIT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
