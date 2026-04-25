# Maintainer: frost19k <frost19k@proton.me>
#
# Update instructions:
#   1. Update pkgver to the new version
#   2. Update sha512sums_x86_64 (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)

pkgname=open-webui-desktop-bin
pkgver=0.0.12
pkgrel=1
pkgdesc='User-friendly AI chat interface supports Ollama, OpenAI API (desktop client)'
arch=('x86_64')
url='https://github.com/open-webui/desktop'
license=('AGPL-3.0-only')
depends=('electron' 'nss' 'libxss' 'libxtst')
optdepends=('xdg-desktop-portal: system theme detection via D-Bus portal')
provides=('open-webui')
conflicts=('open-webui')
options=('!strip' '!debug')
source=("open-webui.sh")
source_x86_64=("open-webui-bin_${pkgver}_amd64.deb::https://github.com/open-webui/desktop/releases/download/v${pkgver}/open-webui_amd64.deb")
sha512sums=('068c7a3c5f3836872eed69e1d4e326c5ddcb2db1f7b170585598d8bd71024fab59ffe0d51a09b4e5f9de7404edea5dc75d7e6c985530ce597122f42a8813798e')
sha512sums_x86_64=('20b94e2a2d3b839ab1ef7353a052cbea4ccb0678eb6bea749f71048c78bd2275c045db0489b27a8068f965027f7c43759b636d4a816eb58857a057c265bba169')
noextract=("open-webui-bin_${pkgver}_amd64.deb")

package() {
  local _deb="${srcdir}/open-webui-bin_${pkgver}_amd64.deb"

  # Extract .deb contents (ar archive containing data.tar.*)
  cd "${srcdir}"
  bsdtar -xf "${_deb}"

  # Extract data archive (supports .xz, .gz, .zst, .bz2)
  local _data
  _data=$(bsdtar -tf data.tar.* 2>/dev/null && echo "data.tar.*" || true)
  if [[ -f data.tar.xz ]]; then
    bsdtar -xf data.tar.xz
  elif [[ -f data.tar.gz ]]; then
    bsdtar -xf data.tar.gz
  elif [[ -f data.tar.zst ]]; then
    bsdtar -xf data.tar.zst
  elif [[ -f data.tar.bz2 ]]; then
    bsdtar -xf data.tar.bz2
  fi

  # Install app resources to /usr/lib/open-webui/
  install -d "${pkgdir}/usr/lib/open-webui"
  cp -a "opt/Open WebUI/resources/." "${pkgdir}/usr/lib/open-webui/"

  # Install .desktop file
  install -Dm644 "usr/share/applications/open-webui.desktop" \
    "${pkgdir}/usr/share/applications/open-webui.desktop"

  # Fix .desktop file: use wrapper command
  sed -i 's|Exec=.*|Exec=open-webui %U|' "${pkgdir}/usr/share/applications/open-webui.desktop"

  # Install icon
  install -Dm644 "usr/share/icons/hicolor/512x512/apps/open-webui.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/open-webui.png"

  # Install Wayland-compatible wrapper script
  install -Dm755 "${srcdir}/open-webui.sh" "${pkgdir}/usr/bin/open-webui"
}
