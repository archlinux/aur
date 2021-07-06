# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
_pkgdate=20210705.2
pkgname=lens-bin
pkgver=5.0.2
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
provides=('lens')
conflicts=('lens')
source=(${_pkgname}-${pkgver}.${arch}.AppImage::"https://api.k8slens.dev/binaries/Lens-${pkgver}-latest.${_pkgdate}.${arch}.AppImage"
        "${_pkgname}.desktop")
sha256sums=('72639a6a6bd721e5f149fe28bac486cf16c6b19de65b03447c694cccbdd8322d'
            '7acac010857d0afc5717e87e651bd875dab9771685648e3908da538709de2346')

prepare() {
  chmod +x "${_pkgname}-${pkgver}.${arch}.AppImage"
  "./${_pkgname}-${pkgver}.${arch}.AppImage" --appimage-extract
}

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${_pkgname}
  mv "${srcdir}"/squashfs-root/* \
    "${pkgdir}"/usr/share/${_pkgname}

  # icon
  install -Dm 644 "${pkgdir}"/usr/share/${_pkgname}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/open-${_pkgname}.png

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/lens \
    "${pkgdir}"/usr/bin/open-lens

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/AppRun
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/lens.{desktop,png}
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/usr
}
