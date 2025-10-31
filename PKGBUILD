# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ica-securestore"
pkgver=6.3.3_1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Manage I.CA Starcos smart cards"
arch=('x86_64')
url="https://ca.ica.cz/pub/SecureStore/linux/"
license=('custom:Proprietary')
depends=(
  'curl'
  'gcc-libs'
  'glibc'
  'ica-securestore-pkcs11>=5.1.8'
  'libgl'
  'pcsclite'
  'qt5-base>=5.9.0'
  'qt5-declarative>=5.9.0'
  'qt5-graphicaleffects>=5.9.0'
  'qt5-quickcontrols>=5.9.0'
)
backup=(
  "etc/ICA/cz.ica.SecureStore.ini"
)
_pkgsrc="${pkgname}-${_pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.deb::${url}${pkgname}_${_pkgver}_amd64.deb")
noextract=("${source_x86_64[@]%%::*}")
sha256sums_x86_64=('9bfa4fe89d8eacf3e79b40b886c5199c0f850d814ef9cecb0236dd75102deb31')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share/applications"
  sed -e "s/=securestore/=${pkgname}/g" \
      -e "s/=SecureStore/=ICA SecureStore/g" \
      -i 'securestore.desktop'
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -va --no-preserve=ownership "etc" -t "${pkgdir}"

  install -vDm755 "opt/ICASecureStore/bin/SecureStore" "${pkgdir}/usr/bin/ICASecureStore"

  cd "usr/share"
  install -vDm644 "applications/securestore.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -vDm644 "pixmaps/securestore.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
