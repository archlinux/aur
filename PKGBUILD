# Maintainer: czyt <czytcn@gmail.com>

pkgname=t3-code-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Desktop GUI for coding agents"
arch=('x86_64' 'aarch64')
url="https://t3.codes"
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gdk-pixbuf2' 'glib2'
  'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libgcc' 'libnotify'
  'libsecret' 'libstdc++' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
  'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst'
  'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils'
)
optdepends=('libappindicator-gtk3: system tray indicator support')
provides=('t3code')
conflicts=('t3code' 't3code-bin')
options=('!strip' '!debug')

_deb_x86_64="T3-Code-${pkgver}-amd64.deb"
_deb_aarch64="T3-Code-${pkgver}-arm64.deb"
source_x86_64=("${_deb_x86_64}::https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::https://github.com/pingdotgg/t3code/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('22dac1167d4e4e68a3f3c3461b53c7d472ef70f2020732c70006eb2970830e5e')
sha256sums_aarch64=('522a6b36b27fe7892fb3c6101d4b1e6766b4dee4ba43d96e24bb553408767983')

package() {
  local _deb_var="_deb_${CARCH}"
  local _deb="${!_deb_var}"
  [[ -n "${_deb}" ]] || { echo "unsupported architecture: ${CARCH}" >&2; return 1; }

  local _data_member
  _data_member=$(ar t "${srcdir}/${_deb}" |
    awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
  [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

  ar p "${srcdir}/${_deb}" "${_data_member}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # Upstream installs into "/opt/T3 Code (Beta)": a path with spaces and a
  # release-channel suffix breaks shell tooling and moves with the channel.
  install -dm755 "${pkgdir}/usr/lib"
  mv "${pkgdir}/opt/T3 Code (Beta)" "${pkgdir}/usr/lib/${pkgname}"
  rmdir "${pkgdir}/opt"

  install -Dm644 "${pkgdir}/usr/share/doc/t3code/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/share/doc"

  # The Debian postinst creates this link; pacman does not run maintainer scripts.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/t3code" "${pkgdir}/usr/bin/t3code"

  # Point the desktop entry at the wrapper on PATH instead of the deb's path.
  sed -i 's|^Exec=.*|Exec=/usr/bin/t3code %U|' \
    "${pkgdir}/usr/share/applications/t3code.desktop"

  # Keep the shipped AppArmor profile aligned with the relocated payload.
  local _profile="${pkgdir}/usr/lib/${pkgname}/resources/apparmor-profile"
  [[ -f "${_profile}" ]] &&
    sed -i "s|\"/opt/T3 Code (Beta)/t3code\"|\"/usr/lib/${pkgname}/t3code\"|" "${_profile}"

  chmod -R u=rwX,go=rX "${pkgdir}"
  chown -R root:root "${pkgdir}"

  # Electron's SUID sandbox helper for kernels without unprivileged user
  # namespaces; the Debian postinst would set this after checking the kernel.
  chmod 4755 "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"
}
