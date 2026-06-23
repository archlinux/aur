# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin symlink name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.6.19
pkgver=0.17.0
pkgrel=1
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'dbus' 'gtk3' 'hicolor-icon-theme'
  'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils'
)
optdepends=(
  'git: bootstrap and self-update the Hermes Agent runtime on first launch'
  'libappindicator-gtk3: tray indicator support'
  'python: run the Hermes Agent runtime locally'
  'uv: bootstrap the Hermes Agent runtime on first launch'
)
makedepends=('base-devel' 'git' 'nodejs>=22' 'npm')
conflicts=('hermes-agent-desktop-bin')
options=('!strip' '!debug')
source=("${url}/archive/refs/tags/${_pkgver_tag}.tar.gz")
sha256sums=('69b805ec0a7a7be880068ba8a3b17479d7ba29f0cac0a2e9c6692c02f346ba91')

_srcdir="${srcdir}/hermes-agent-${_pkgver_tag#v}"

prepare() {
  cd "${_srcdir}"
  npm install --prefer-offline --no-audit --ignore-scripts
}

build() {
  cd "${_srcdir}/apps/desktop"
  npm run dist:linux
}

package() {
  cd "${_srcdir}"
  local deb
  deb="$(ls apps/desktop/release/*.deb 2>/dev/null | head -n1 || true)"
  if [ -z "${deb}" ]; then
    msg2 "ERROR: no .deb produced by electron-builder"
    ls -la apps/desktop/release/ 2>/dev/null || true
    return 1
  fi
  bsdtar -xOf "${deb}" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
  if [ -d "${pkgdir}/opt/${_upstream}" ]; then
    mv "${pkgdir}/opt/${_upstream}" "${pkgdir}/opt/${pkgname}"
  fi
  rm -f "${pkgdir}/usr/share/applications/${_upstream}.desktop"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_upstream}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Hermes
GenericName=AI Agent Client
Comment=${pkgdesc}
Exec=/usr/bin/${_pkgname} %U
Terminal=false
Type=Application
Icon=${_upstream,,}
StartupWMClass=${_upstream}
Categories=Utility;Development;Network;
Keywords=AI;Agent;Chat;Assistant;
MimeType=x-scheme-handler/hermes;
EOF
  install -Dm644 "apps/desktop/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_upstream,,}.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
