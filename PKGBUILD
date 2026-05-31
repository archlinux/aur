pkgname=privli-bin
pkgver=2.4.1
pkgrel=1
pkgdesc='Privacy-focused nearby file sharing'
arch=('x86_64')
url='https://github.com/PasteShare/paste_share_open_source'
license=('custom')
depends=('gtk3' 'glib2' 'curl' 'systemd-libs' 'sdbus-cpp')
# Rolling -bin: always tracks the latest CI build published to the `latest`
# release. The asset is overwritten on every release, so its checksum is not
# stable -> SKIP, and pkgver() reads the real version from the bundle.
source=(
  'Privli-linux.tar.gz::https://github.com/PasteShare/paste_share_open_source/releases/download/latest/Privli-linux.tar.gz'
  'LICENSE.privli'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  local v
  v="$(grep -oE '"version":"[^"]+"' \
        "${srcdir}/data/flutter_assets/version.json" 2>/dev/null \
        | head -1 | cut -d'"' -f4)"
  printf '%s' "${v:-2.4.1}"
}

package() {
  local bundle_dir="${srcdir}/bundle"

  rm -rf "${bundle_dir}"
  mkdir -p "${bundle_dir}"
  bsdtar -xpf "${srcdir}/Privli-linux.tar.gz" -C "${bundle_dir}"

  install -dm755 "${pkgdir}/opt/privli"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/privli/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/privli/nearby "${pkgdir}/usr/bin/privli"

  install -dm755 "${pkgdir}/usr/share/applications"
  sed \
    -e 's|__EXEC_PATH__|/usr/bin/privli|g' \
    -e 's|__ICON_PATH__|privli|g' \
    "${bundle_dir}/app.local1st.nearby.desktop" > "${pkgdir}/usr/share/applications/privli.desktop"

  install -Dm644 "${bundle_dir}/resources/app_icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/privli.png"
  install -Dm644 "${srcdir}/LICENSE.privli" \
    "${pkgdir}/usr/share/licenses/privli/LICENSE"
}
