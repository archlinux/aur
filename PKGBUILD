# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
pkgname=lens-bin
pkgver=2023.12.80831
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
provides=('lens')
conflicts=('lens')
options=('!strip' '!emptydirs')
install="${_pkgname}.install"
source=(${_pkgname}-${pkgver}.${arch}.AppImage::"https://api.k8slens.dev/binaries/Lens-${pkgver}-latest.${arch}.AppImage"
        "${_pkgname}.install"
        "${_pkgname}.desktop")
b2sums=('2c9a0a021903180d06065e8c50be7755fd1fa9cc8446bc982c03c998b9ea70884a348f52b434524c7907c0d483952611c2ad8b9e5058677dc217e894533d3b68'
        '824c9dcfd5700335632d814c2c1edc3861e18e5f82f0866474895f7b40d0177097d308d6802944ef1c1b6eda2f58b33647a3b2221e3c482f7cf2085fb97ab6b3'
        '7c5afc77c4e921f198139efeb168a16c6208fe0df1267a224ce62bde160d22ec68467f57a560742307ff2bf4e6b5d0bcbf07062b82f1fabcd95e7368d9d02477')

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
  install -Dm 644 "${pkgdir}"/usr/share/${_pkgname}/usr/share/icons/hicolor/512x512/apps/${_pkgname}-desktop.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${_pkgname}-desktop.png

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/lens-desktop \
    "${pkgdir}"/usr/bin/lens-desktop

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/AppRun
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/lens-desktop.{desktop,png}
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/usr
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/resources/extensions/*/dist/*-arm64
}
