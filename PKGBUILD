pkgname=privli-bin
pkgver=2.3.0
pkgrel=1
pkgdesc='Privacy-focused nearby file sharing'
arch=('x86_64')
url='https://github.com/PasteShare/paste_share_open_source'
license=('custom')
depends=('gtk3' 'glib2' 'curl' 'systemd-libs' 'sdbus-cpp')
source=(
  'Privli-2.3.0-linux-x86_64.tar.gz::https://github.com/PasteShare/paste_share_open_source/releases/download/linux2.3.0/Privli-2.3.0-linux-x86_64.tar.gz'
  'LICENSE.privli'
)
sha256sums=(
  'fdcc67ecdf665df1c8bc3d0ba9c232edc9960d1cec28cacac6b35f5e27dac2e1'
  'SKIP'
)

package() {
  local bundle_dir="${srcdir}/bundle"

  rm -rf "${bundle_dir}"
  mkdir -p "${bundle_dir}"
  bsdtar -xpf "${srcdir}/Privli-2.3.0-linux-x86_64.tar.gz" -C "${bundle_dir}"

  install -dm755 "${pkgdir}/opt/privli"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/privli/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/privli/nearby "${pkgdir}/usr/bin/privli"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed     -e 's|__EXEC_PATH__|/usr/bin/privli|g'     -e 's|__ICON_PATH__|privli|g'     "${bundle_dir}/app.local1st.nearby.desktop" > "${pkgdir}/usr/share/applications/privli.desktop"

  install -Dm644 "${bundle_dir}/resources/app_icon.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/privli.png"
  install -Dm644 "${srcdir}/LICENSE.privli"     "${pkgdir}/usr/share/licenses/privli/LICENSE"
}
