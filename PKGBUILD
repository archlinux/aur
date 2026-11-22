pkgname=privli-bin
pkgver=3.1.2
pkgrel=1
pkgdesc='Private AirDrop-style file and clipboard sharing with iPhone, Android, Mac and Windows (Quick Share compatible)'
arch=('x86_64')
url='https://nearby.local1st.app'
license=('custom')
options=('!debug' '!strip')
depends=('gtk3' 'glib2' 'wayland' 'curl' 'systemd-libs' 'sdbus-cpp')
optdepends=('nautilus-python: Send with Privli in the Files context menu')
source=(
  'Privli-3.1.2-linux-x86_64.tar.gz::https://github.com/Local1stDotApp/paste_share_open_source/releases/download/latest/Privli-3.1.2-linux-x86_64.tar.gz'
  'LICENSE.privli'
)
sha256sums=(
  '0d627272a9ad3c6cf1169514060c48319854c59bcf830fe2456327036540114b'
  'SKIP'
)

package() {
  local bundle_dir="${srcdir}/bundle"

  rm -rf "${bundle_dir}"
  mkdir -p "${bundle_dir}"
  bsdtar -xpf "${srcdir}/Privli-3.1.2-linux-x86_64.tar.gz" -C "${bundle_dir}"

  install -dm755 "${pkgdir}/opt/privli"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/privli/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/privli/nearby "${pkgdir}/usr/bin/privli"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed     -e 's|__EXEC_PATH__|/usr/bin/privli|g'     -e 's|__ICON_PATH__|privli|g'     "${bundle_dir}/app.local1st.nearby.desktop" > "${pkgdir}/usr/share/applications/privli.desktop"

  install -Dm644 "${bundle_dir}/resources/app_icon.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/privli.png"
  install -Dm644 "${srcdir}/LICENSE.privli"     "${pkgdir}/usr/share/licenses/privli/LICENSE"
  # "Send with Privli" in Files; inert unless nautilus-python is installed.
  if [[ -f "${bundle_dir}/integration/nautilus/privli.py" ]]; then
    install -Dm644 "${bundle_dir}/integration/nautilus/privli.py"       "${pkgdir}/usr/share/nautilus-python/extensions/privli.py"
  fi
}
