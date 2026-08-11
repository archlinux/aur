pkgname=privli-bin
pkgver=3.0.2
pkgrel=1
pkgdesc='Privacy-focused nearby file sharing'
arch=('x86_64')
url='https://github.com/Local1stDotApp/paste_share_open_source'
license=('custom')
options=('!debug' '!strip')
depends=('gtk3' 'glib2' 'curl' 'systemd-libs' 'sdbus-cpp')
source=(
  'Privli-3.0.2-linux-x86_64.tar.gz::https://github.com/Local1stDotApp/paste_share_open_source/releases/download/latest/Privli-3.0.2-linux-x86_64.tar.gz'
  'LICENSE.privli'
)
sha256sums=(
  'bfe2ef3dde0915ec0797fd803ae98dc636a278b53b6b7f57f4a48fdba9b36494'
  'SKIP'
)

package() {
  local bundle_dir="${srcdir}/bundle"

  rm -rf "${bundle_dir}"
  mkdir -p "${bundle_dir}"
  bsdtar -xpf "${srcdir}/Privli-3.0.2-linux-x86_64.tar.gz" -C "${bundle_dir}"

  install -dm755 "${pkgdir}/opt/privli"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/privli/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/privli/nearby "${pkgdir}/usr/bin/privli"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed     -e 's|__EXEC_PATH__|/usr/bin/privli|g'     -e 's|__ICON_PATH__|privli|g'     "${bundle_dir}/app.local1st.nearby.desktop" > "${pkgdir}/usr/share/applications/privli.desktop"

  install -Dm644 "${bundle_dir}/resources/app_icon.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/privli.png"
  install -Dm644 "${srcdir}/LICENSE.privli"     "${pkgdir}/usr/share/licenses/privli/LICENSE"
}
