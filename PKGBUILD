# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ica-securestore"
pkgver=6.3.3_1
_pkgver="${pkgver//_/-}"
pkgrel=2
pkgdesc="Manage I.CA Starcos smart cards"
arch=(
  'x86_64'
)
url="https://ca.ica.cz/pub/SecureStore/linux/"
license=(
  'custom:Proprietary'
)
depends=(
  'curl'
  'glibc'
  'ica-securestore-pkcs11>=5.1.8'
  'libgcc'
  'libgl'
  'libstdc++'
  'pcsclite'
  'qt5-base>=5.9.0'
  'qt5-declarative>=5.9.0'
  'qt5-graphicaleffects>=5.9.0'
  'qt5-quickcontrols>=5.9.0'
)
backup=(
  "etc/ICA/cz.ica.SecureStore.ini"
)
source_x86_64=(
  "${url}${pkgname}_${_pkgver}_amd64.deb"
)
noextract=(
  "${source_x86_64[@]##*/}"
)
sha256sums_x86_64=('9bfa4fe89d8eacf3e79b40b886c5199c0f850d814ef9cecb0236dd75102deb31')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*

  cd "${source_artifact%.deb}/usr/share/applications"
  sed -e "s/=securestore/=${pkgname}/g" \
      -e "s/=SecureStore/=ICA SecureStore/g" \
      -i 'securestore.desktop'
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.deb}"
  cp -va --parents --no-preserve=ownership "etc" "usr/share" -t "${pkgdir}"

  install -vDm755 "opt/ICASecureStore/bin/SecureStore" "${pkgdir}/usr/bin/ICASecureStore"
}
