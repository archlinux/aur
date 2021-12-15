# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
_pkgdate=20211214.2
pkgname=lens-bin
pkgver=5.3.3
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('gtk3' 'libxss' 'nss')
provides=('lens')
conflicts=('lens')
source=(${_pkgname}-${pkgver}.${arch}.AppImage::"https://api.k8slens.dev/binaries/Lens-${pkgver}-latest.${_pkgdate}.${arch}.AppImage"
        "${_pkgname}.desktop")
b2sums=('d32943774c11e1278c0d27acf5761cd8bbcb1b805b5ec39b4375360a11a5cf4201c0ee72ad5c20e0af4621a43d466c6c3f2b0c7b2d230f9d4e383c096d10e6d7'
        '2aea209098a22d8e4b263a059f6e67b2a3e8f8dfb0c15ac81e33edb4c2be81fd7a6f419a04a77be5b5c8d81b160e6e3f159b4d8639ccab705fffecf149255a36')

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
