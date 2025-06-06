# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
pkgname=lens-bin
pkgver=2025.6.21515
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('LicenseRef-Custom')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
provides=('lens')
conflicts=('lens')
options=('!debug' '!strip' '!emptydirs')
install="${_pkgname}.install"
source=(${_pkgname}-${pkgver}.${arch}.AppImage::"https://api.k8slens.dev/binaries/Lens-${pkgver}-latest.${arch}.AppImage"
        "${_pkgname}.install"
        "${_pkgname}.desktop")
b2sums=('fe8060ce27faa863663e1f1438cae0408818166d8e4df0d07cc6a48c4a81733c52591f9a1198a653e593e6961b350388d2923de89da90d29b005cc0f86df4883'
        'ee08f5ca738acd64bbd3076bdad73c2d1ef58d7bb89993e31c5aaa5d6b0308410b816b80be4860c8353be51f54dafbc1e39a7a03ef82881c5a10ad643b0fd596'
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
