# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
pkgname=lens-bin
pkgver=2026.9.181013
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('LicenseRef-Custom')
url='https://lenshq.io'
depends=('gtk3' 'libxss' 'nss')
provides=('lens')
conflicts=('lens')
options=('!debug' '!strip' '!emptydirs')
source=(${_pkgname}-${pkgver}.${arch}.AppImage::"https://api.k8slens.dev/binaries/Lens-${pkgver}-latest.${arch}.AppImage"
        "${_pkgname}.desktop")
b2sums=('5887f05feeeb2d8be7c45577682d56b951d9a702a7f94217459b8bf4e3bc516166fe3f65512a2a1d9e147d1f2ac5fc052293bed18ed07a0edb4c9aaf1bca4578'
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

  # symlink license
  mkdir -p "${pkgdir}"/usr/share/licenses/${_pkgname}
  ln -sf /usr/share/${_pkgname}/resources/static/license.md \
    "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/AppRun
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/lens-desktop.{desktop,png}
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/usr
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/resources/extensions/*/dist/*-arm64
}
