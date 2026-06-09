# Maintainer: hitchhooker <tommi@rotko.net>
pkgname=signalkit-bin
_pkgname=signalkit
pkgver=0.1.0
pkgrel=1
pkgdesc="Search and browse your Signal history. Local desktop app + CLI + MCP server. Sends and receives messages too, by linking as a Signal secondary device. Drives Signal via AI agents through the Model Context Protocol."
arch=('x86_64')
url="https://github.com/rotkonetworks/signalkit"
license=('AGPL-3.0-only')
depends=(
  'webkit2gtk-4.1'
  'libsoup3'
  'gtk3'
  'libsecret'
  'libayatana-appindicator'
  'sqlite'
)
optdepends=(
  'gnome-keyring: libsecret backend on gnome'
  'kwallet: libsecret backend on kde'
)
provides=("${_pkgname}" "${_pkgname}-tauri")
conflicts=("${_pkgname}" "${_pkgname}-tauri" "${_pkgname}-git")
source=(
  "${_pkgname}-${pkgver}-linux-x86_64::${url}/releases/download/v${pkgver}/signalkit-linux-x86_64"
  "${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/signalkit_${pkgver}_amd64.deb"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
# pkgbuild reviewers / makepkg will replace these after the github release
# is published. update with: updpkgsums
sha256sums=('48c95a134b82a763c01871db7e4c7f4b6cef658fe3f5f7cf4ea49d2f426ce62f'
            'bc3679f013ddd6e04e4e0e43e2d4d1f26506b1f73d0d45a0f14d7544808de039'
            '0f309351ed5b050517371a441d5eb4da26c4ee1afa7081a700920355bec3fd8b')
noextract=("${_pkgname}-${pkgver}-amd64.deb")

package() {
  cd "${srcdir}"

  # extract the .deb to get the tauri desktop binary, .desktop file, icons
  mkdir -p _deb
  bsdtar -xf "${_pkgname}-${pkgver}-amd64.deb" -C _deb
  bsdtar -xf _deb/data.tar.* -C "${pkgdir}/"

  # install the standalone cli binary on top.
  install -Dm755 "${_pkgname}-${pkgver}-linux-x86_64" \
    "${pkgdir}/usr/bin/signalkit"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
