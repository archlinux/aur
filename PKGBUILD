# Maintainer: z3n <z3nlabs at proton dot me>

# TAPE 16 Linux packaging notes:
# - GitHub "Source code" tag archives (archive/refs/tags/*.tar.gz) only contain
#   old Windows snapshots + README — not usable for a Linux package.
# - Use the release asset TAPE-16-v${pkgver}-Linux-Release.zip instead.
# - Upstream recommends AppImage for Arch-like distros; we package the .deb
#   payload instead for proper /usr integration (launchers, icons, desktop files).

pkgname=tape16
pkgver=0.9.400
pkgrel=1
pkgdesc="Destructive tape-style 16-track DAW (binary release)"
arch=('x86_64')
url="https://emrmusicgroup.com/tape16/"
license=('LicenseRef-EMR-EULA')
groups=('pro-audio')
depends=(
  'alsa-lib'
  'alsa-utils'
  'bash'
  'curl'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'libgl'
  'libx11'
  'libxcursor'
  'libxext'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
  'pipewire'
  'pipewire-alsa'
  'pipewire-jack'
  'pipewire-pulse'
  'wireplumber'
  'xorg-xwayland'
  'zlib'
)
optdepends=(
  'pavucontrol: PulseAudio/PipeWire volume control GUI'
  'qpwgraph: PipeWire graph patchbay'
  'realtime-privileges: system-wide realtime audio limits (audio group)'
  'wine: Windows VST hosting via yabridge (experimental)'
  'winetricks: helper for Wine prefix setup'
  'yabridge: bridge Windows VST plugins on Linux'
  'zenity: GUI dialogs for install/system-check helpers'
)
options=('!strip' '!debug')
install="${pkgname}.install"
# Display/audio profile baked into profile.env + desktop names.
# Switch to "x11" before building if you run a pure X11 session (i3, etc.).
_display_profile=wayland
source=(
  "TAPE-16-v${pkgver}-Linux-Release.zip::https://github.com/jackpaterson1/TAPE-16-Public-Releases/releases/download/${pkgver}/TAPE-16-v${pkgver}-Linux-Release.zip"
)
sha256sums=(
  'a356d3f64dd89acdec18d60763c8b48553532da7a38c355a3010791fe87e4fea'
)

prepare() {
  case "${_display_profile}" in
    wayland|x11) ;;
    *)
      echo "Invalid _display_profile='${_display_profile}' (use wayland or x11)" >&2
      return 1
      ;;
  esac

  local profile_dir deb
  case "${_display_profile}" in
    wayland) profile_dir='TAPE 16 Wayland Deb' ;;
    x11)     profile_dir='TAPE 16 X11 Deb' ;;
  esac

  deb="$(find "${srcdir}" -type f -path "*/${profile_dir}/INSTALL-TAPE16.deb" | head -n1)"
  if [[ -z "${deb}" || ! -f "${deb}" ]]; then
    echo "Could not find ${profile_dir}/INSTALL-TAPE16.deb in the release zip" >&2
    return 1
  fi

  rm -rf "${srcdir}/deb-root"
  mkdir -p "${srcdir}/deb-root"
  bsdtar -C "${srcdir}/deb-root" -xf "${deb}"
  bsdtar -C "${srcdir}/deb-root" -xf "${srcdir}/deb-root/data.tar.zst"
}

package() {
  cd "${srcdir}/deb-root"

  # Application payload and launchers
  install -dm755 "${pkgdir}/usr"
  cp -a usr/. "${pkgdir}/usr/"

  # Realtime limits (redundant with realtime-privileges, harmless if both present)
  install -Dm644 etc/security/limits.d/tape16-audio.conf \
    "${pkgdir}/etc/security/limits.d/99-tape16-audio.conf"

  # License from bundled EULA
  install -Dm644 "usr/lib/tape16/Resources/EULA.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
  install -Dm644 "usr/lib/tape16/Resources/TERMS_AND_CONDITIONS.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/TERMS_AND_CONDITIONS.txt"
  install -Dm644 "usr/lib/tape16/Resources/PRIVACY_POLICY.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/PRIVACY_POLICY.txt"

  # Drop Debian packaging noise
  rm -f "${pkgdir}/usr/share/doc/tape16/README.Debian"
  rm -f "${pkgdir}/usr/share/doc/tape16/changelog.gz"

  # Generic desktop name for Arch (profile still selected via profile.env)
  if [[ -f "${pkgdir}/usr/share/applications/tape16.desktop" ]]; then
    sed -i 's/^Name=.*/Name=TAPE 16/' "${pkgdir}/usr/share/applications/tape16.desktop"
    sed -i 's/^Comment=.*/Comment=Destructive tape-style 16-track DAW/' \
      "${pkgdir}/usr/share/applications/tape16.desktop"
  fi
  if [[ -f "${pkgdir}/usr/share/applications/tape16-lowlatency.desktop" ]]; then
    sed -i 's/^Name=.*/Name=TAPE 16 (Low Latency)/' \
      "${pkgdir}/usr/share/applications/tape16-lowlatency.desktop"
    sed -i 's/^Comment=.*/Comment=TAPE 16 with lower PipeWire\/JACK buffer size/' \
      "${pkgdir}/usr/share/applications/tape16-lowlatency.desktop"
  fi
}
