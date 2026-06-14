# Maintainer: latte

pkgname=hermes-agent-desktop-bin
_pkgname=hermes-desktop
pkgver=0.6.1
pkgrel=1
pkgdesc='Desktop companion for Hermes Agent'
arch=('x86_64')
url='https://github.com/fathah/hermes-desktop'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'dbus'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'git: install and update a local Hermes Agent from first-run setup'
  'libappindicator-gtk3: tray indicator support'
  'python: run Hermes Agent locally'
  'uv: install and run Hermes Agent locally'
)
provides=('hermes-agent-desktop' 'hermes-desktop')
conflicts=('hermes-agent-desktop' 'hermes-desktop')
options=('!strip')
source=("${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fathah/hermes-desktop/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('85d12b0f8894e7095f904a9a89fcfaea1b0d037cbfb4a12aba81daa87bcdbcd4')
sha256sums_x86_64=('0eaaff1c462780ce9c193bfd57bf5ff072bad6c065735538f543427f5087e389')

package() {
  bsdtar -xOf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" data.tar.xz |
    bsdtar -xJf - -C "${pkgdir}"

  # Upstream's .deb installs under "Hermes One"; Arch packages should keep
  # bundled application payloads under /opt/${pkgname}.
  mv "${pkgdir}/opt/Hermes One" "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Hermes One
Exec=/opt/${pkgname}/${_pkgname} %U
Terminal=false
Type=Application
Icon=${_pkgname}
StartupWMClass=Hermes One
Comment=Hermes One is a native desktop app for installing, configuring, and chatting with Hermes Agent — a self-improving AI assistant with tool use, multi-platform messaging, and a closed learning loop.
Categories=Utility;
EOF

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
