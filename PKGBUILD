# Maintainer: czyt <czytcn@gmail.com>

pkgname=better-vault-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Open-source NotebookLM alternative: bring-your-own-model notebooks for your sources"
arch=('x86_64' 'aarch64')
url="https://better-vault.dev"
_gh="https://github.com/better-vault/better-vault"
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libgcc' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango'
  'systemd-libs' 'xdg-utils'
)
optdepends=('libayatana-appindicator: system tray icon support')
provides=('better-vault-desktop')
conflicts=('better-vault-desktop' 'better-vault')
options=('!strip' '!debug')

_deb_x86_64="better-vault-${pkgver}-linux-amd64.deb"
_deb_aarch64="better-vault-${pkgver}-linux-arm64.deb"
source=("LICENSE::${_gh}/raw/v${pkgver}/LICENSE")
sha256sums=('484eaa20650e66f9b14bc710a4a39898f47b327d05ee1f2df6264e03dbbca858')
sha256sums_x86_64=('af07120eb741a19a6828ec2ba92fc16db765ed92abca10e39aed7ff4c260d324')
sha256sums_aarch64=('a05030999963cb1f8a9db97194461cf06d0f7beebbd44730bd519c9e5f90d42c')
source_x86_64=("${_deb_x86_64}::${_gh}/releases/download/v${pkgver}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${_gh}/releases/download/v${pkgver}/${_deb_aarch64}")
noextract=("${_deb_x86_64}" "${_deb_aarch64}")

package() {
  local _deb_var="_deb_${CARCH}"
  local _deb="${!_deb_var}"
  local _data_archive
  _data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ { print; exit }')
  [[ -n "$_data_archive" ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$_data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  # The deb only ships the app menu entry; put the Electron launcher on PATH.
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/better-vault/better-vault-desktop "${pkgdir}/usr/bin/better-vault-desktop"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/better-vault/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${pkgdir}/opt/better-vault/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # Debian packaging metadata is not used on Arch Linux.
  rm -rf "${pkgdir}/usr/share/doc"

  # Keep the Chromium sandbox working on systems without usable user namespaces.
  chmod 4755 "${pkgdir}/opt/better-vault/chrome-sandbox"
}
