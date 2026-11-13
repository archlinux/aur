# Maintainer: Arizkami <arizkami@users.noreply.github.com>
#
# Futureboard Studio is a native Rust/GPUI application. The AppImage this
# package extracts is the versioned Linux release asset, built by
# packaging/linux/bundle-appimage.sh.
pkgname=futureboard-studio-bin
pkgver=2026.11.1_beta2.0.0
_appver=2026.11.1-beta2.0.0
pkgrel=1
pkgdesc="Futureboard Studio — native Digital Audio Workstation"
arch=('x86_64')
url="https://github.com/futureboard/futureboard-studio"
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'gtk4'
  'libgudev'
  'libxkbcommon-x11'
  'shared-mime-info'
)
optdepends=(
  'pipewire-pulse: PipeWire audio output'
  'pulseaudio: PulseAudio audio output'
  'nvidia-utils: Vulkan driver for NVIDIA GPUs (Mesa already covers Intel/AMD)'
)
provides=('futureboard-studio')
conflicts=('futureboard-studio')
options=('!strip' '!debug')
install=futureboard-studio-bin.install

# `_appver` is both the release tag and the asset version. AUR pkgver cannot
# contain `-`, so it stays separate. Release tags are bare versions; for a
# `v`-prefixed tag the URL below would not resolve, so the release workflow
# skips the AUR bump when the tag is not exactly `_appver`. The asset is that immutable tag on the
# canonical repository — not the `nightly` tag, which is deleted and recreated
# every day and whose files are named with the build date.
_appimage="Futureboard.Studio-${_appver}-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/futureboard/futureboard-studio/releases/download/${_appver}/${_appimage}")
# Release Build (.github/workflows/release.yml, `aur-checksum`) replaces this
# with the sha256 of the AppImage it just attached to the release. It is never
# SKIP; all zeros means no release has been built for `_appver` yet.
sha256sums_x86_64=('57d1123c65c5519419a3732ca34faa46f098c7bd3d6029aa04de059b6a4fec50')

prepare() {
  cd "${srcdir}" || exit 1
  local sum="${sha256sums_x86_64[0]}"
  if [[ ! "${sum}" =~ ^[0-9a-f]{64}$ ]]; then
    echo "error: sha256sums_x86_64 is not a SHA-256 of ${_appimage}" >&2
    exit 1
  fi
  # makepkg checks this before prepare(). Check again so the image is never
  # executed when checksums were skipped.
  echo "${sum}  ${_appimage}" | sha256sum -c - || exit 1
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract
}

package() {
  # App files (the native binary + squashed AppDir tree as-is).
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
  rm -f "${pkgdir}/opt/${pkgname}/AppRun" "${pkgdir}/opt/${pkgname}/.DirIcon"

  # Launcher
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/futureboard-studio" << EOF
#!/usr/bin/env bash
exec "/opt/${pkgname}/usr/bin/FutureboardNative" "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/futureboard-studio"

  # Desktop entry (rewrite Exec= to the installed launcher, not the AppImage's
  # own relative "FutureboardNative" invocation).
  install -Dm644 "${srcdir}/squashfs-root/futureboard-studio.desktop" \
    "${pkgdir}/usr/share/applications/futureboard-studio.desktop"
  sed -i 's|^Exec=.*|Exec=futureboard-studio %U|' \
    "${pkgdir}/usr/share/applications/futureboard-studio.desktop"

  # MIME type (.fbproj project files)
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/futureboard-studio.xml" \
    "${pkgdir}/usr/share/mime/packages/futureboard-studio.xml"

  # Icon
  install -Dm644 "${srcdir}/squashfs-root/futureboard-studio.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/futureboard-studio.png"
}
