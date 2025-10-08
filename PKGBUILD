# Maintainer: Animesh Kahara <animesh0404@zohomail.in>
_pkgname=arattai
pkgname=arattai-deb-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Unofficial Arch package for Arattai Desktop built from the official .deb (Zoho) – binary repack"
arch=('x86_64')
url="https://www.arattai.com/"
license=('custom')
provides=('arattai')
conflicts=('arattai' 'arattai-bin')
depends=('glibc' 'gtk3' 'libnotify' 'nss' 'xdg-utils' 'at-spi2-core' 'libxss' 'libappindicator-gtk3')
source=("https://downloads.zohocdn.com/arattai-desktop/linux/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('39c35e6663ae56159af46c4f1def9d0235f7e5fddd59f76888417c29d3f6a5d4')

# We unpack the .deb and install its data.tar.* payload into $pkgdir
package() {
  cd "${srcdir}"

  # Extract the Debian container
  bsdtar -xf "${_pkgname}_${pkgver}_amd64.deb"

  # Unpack payload into package root
  local data_tar
  data_tar=$(ls "${srcdir}"/data.tar.*)
  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  # License location (if present in Debian doc path)
  if [[ -f "${pkgdir}/usr/share/doc/${_pkgname}/copyright" ]]; then
    install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  # Create a launcher symlink if upstream ships the app only under /opt
  # (no-op if /usr/bin/arattai already exists)
  if [[ ! -e "${pkgdir}/usr/bin/arattai" ]]; then
    install -d "${pkgdir}/usr/bin"
    if [[ -x "${pkgdir}/opt/${_pkgname}/arattai" ]]; then
      ln -s "/opt/${_pkgname}/arattai" "${pkgdir}/usr/bin/arattai"
    elif [[ -x "${pkgdir}/opt/Arattai/arattai" ]]; then
      ln -s "/opt/Arattai/arattai" "${pkgdir}/usr/bin/arattai"
    fi
  fi

  # Ensure desktop file & icon permissions are sane if they exist
  [[ -f "${pkgdir}/usr/share/applications/${_pkgname}.desktop" ]] && \
    chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Common icon path; if upstream ships one elsewhere, it’s still fine
  if [[ -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" ]]; then
    chmod 644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  fi
}
