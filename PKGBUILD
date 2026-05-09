# Maintainer: frost19k <frost19k@proton.me>
#
# Update instructions:
#   1. Update pkgver to the new version
#   2. Update sha512sums_x86_64 (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)

pkgname=open-webui-desktop-bin
pkgver=0.0.20
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
sha512sums=('b0e3e1cf3645b1edbb9090c0a7463995312e876c05e3699d2625c6c055797fa6272e48fbe3904d3173b098be1242b5fb21c37ccc399166fd0db8e16f3c4a541e')
sha512sums_x86_64=('21d1454859cebbc7b7aeb75ed15e37828764cb7b66a3569859f297baaf5ec8448487bc9c5fc65cb82b56105772d90f0a4899d727882aa09bed0f8a86451a8534')
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
