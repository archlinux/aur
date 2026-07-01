# Maintainer: RyanTheTide <ryanthetide@gmail.com>

pkgname=claude
_pkgname=claude-desktop
pkgver=1.17377.1
pkgrel=1
pkgdesc='Desktop application for Claude.ai, repackaged from the official Debian package'
arch=('x86_64' 'aarch64')
url='https://claude.ai'
license=('custom')
depends=(
  'at-spi2-core'
  'ca-certificates'
  'glib2'
  'glibc'
  'gtk3'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxtst'
  'mesa'
  'nss'
  'util-linux-libs'
  'xdg-desktop-portal'
  'xdg-utils'
)
depends_x86_64=(
  'edk2-ovmf'
  'qemu-system-x86'
)
depends_aarch64=(
  'edk2-aarch64'
  'qemu-system-aarch64'
)
optdepends=(
  'gnome-keyring: credential storage on GNOME and compatible desktops'
  'kwallet: credential storage on KDE Plasma'
  'libappindicator-gtk3: tray/status indicator support'
  'pipewire-pulse: audio support through PulseAudio-compatible PipeWire'
  'pulseaudio: audio support'
  'trash-cli: freedesktop trash support when desktop helpers are unavailable'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-gtk: portal backend for GTK desktops'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma'
)
provides=("${_pkgname}")
conflicts=(
  "${_pkgname}"
  'claude-desktop-bin'
  'claude-desktop-official-bin'
  'claude-desktop-deb-bin'
)
install="${pkgname}.install"
options=('!strip' '!debug')
noextract=(
  "${_pkgname}-${pkgver}-x86_64.deb"
  "${_pkgname}-${pkgver}-aarch64.deb"
)

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop/claude-desktop_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop/claude-desktop_${pkgver}_arm64.deb")
sha256sums_x86_64=('f4bd78545200877b591179838de7ad7a577df6ed2e845969dd25690efc5c85c7')
sha256sums_aarch64=('658acbff14bd9c35d795ede46f097fca79d433ac4af792cdd6486acd3adc6f2e')

package() {
  local deb="${srcdir}/${_pkgname}-${pkgver}-${CARCH}.deb"
  local data_tar

  bsdtar --no-same-owner -xf "${deb}" -C "${srcdir}"
  data_tar="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar*' -print -quit)"
  bsdtar --no-same-owner -xf "${data_tar}" -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  if [[ -f "${pkgdir}/usr/share/doc/${_pkgname}/copyright" ]]; then
    ln -sf "/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  else
    printf 'See %s for upstream license terms.\n' "${url}" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  install -dm755 "${pkgdir}/usr/libexec"
  ln -sf "/usr/lib/${_pkgname}/resources/virtiofsd" "${pkgdir}/usr/libexec/virtiofsd"

  if [[ "${CARCH}" == "x86_64" ]]; then
    install -dm755 "${pkgdir}/usr/share/edk2"
    ln -sf "/usr/share/edk2/x64/OVMF_CODE.4m.fd" "${pkgdir}/usr/share/edk2/OVMF_CODE_4M.fd"
    ln -sf "/usr/share/edk2/x64/OVMF_VARS.4m.fd" "${pkgdir}/usr/share/edk2/OVMF_VARS_4M.fd"
  fi

  rm -rf \
    "${pkgdir}/etc/apt" \
    "${pkgdir}/usr/share/keyrings" \
    "${pkgdir}/usr/share/lintian" \
    "${pkgdir}/usr/src"
}
