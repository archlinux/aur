#Maintainer: samarthj <dev@samarthj.com>
#Contributer: 1Password
#Copied PKGBUILD from https://aur.archlinux.org/1password.git by 1Password
#Updated source so latest beta and fixed a couple of namcap recommends

pkgname=1password-beta-bin
_pkgname=1password

pkgver=8.1.0_60.BETA
pkgrel=1
conflicts=('1password')
pkgdesc="Password manager and secure wallet - (bin)"
arch=('x86_64')
url='https://1password.com'
license=('LicenseRef-1Password-Proprietary')
depends=('gtk3' 'nss')
options=(!strip)
_tar="1password-latest.tar.gz"
install="${_pkgname}.install"
source=(https://downloads.1password.com/linux/tar/beta/"${CARCH}"/"${_tar}"{,.sig})
sha256sums=('SKIP'
  'SKIP')
validpgpkeys=('3FEF9748469ADBE15DA7CA80AC2D62742012EA22')

pkgver() {
  cd "${srcdir}" || exit 1
  cd "$(ls -d */ | head -n1)" || exit 1
  ./1password --version | sed 's|-|_|g'
}

package() {
  # Go to source directory
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}.x64" || exit 1

  # Install icons
  resolutions=(32x32 64x64 256x256 512x512)
  for resolution in "${resolutions[@]}"; do
    install -Dm0644 "resources/icons/hicolor/${resolution}/apps/${_pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${resolution}/apps/${_pkgname}.png"
  done
  # Install desktop file
  install -Dm0644 resources/${_pkgname}.desktop -t "${pkgdir}"/usr/share/applications/
  # Install system unlock PolKit policy file
  install -Dm0644 com.1password.1Password.policy -t "${pkgdir}"/usr/share/polkit-1/actions/

  # Install examples
  install -Dm0644 resources/custom_allowed_browsers -t "${pkgdir}"/usr/share/doc/${_pkgname}/examples/

  # Move package contents to /opt/1Password
  cd "${srcdir}" || exit 1
  install -dm0755 "${pkgdir}"/opt
  mv "${_pkgname}-${pkgver//_/-}.x64" "${pkgdir}/opt/1Password"
}
