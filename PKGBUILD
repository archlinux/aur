# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
# Contributor: zer0def <zer0def@github>

_pkgname=lens
pkgname=lens-bin
pkgver=4.0.7
pkgrel=1
pkgdesc='The Kubernetes IDE'
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
provides=('lens')
conflicts=('lens')
source=(${_pkgname}-${pkgver}.AppImage::"https://github.com/lensapp/${_pkgname}/releases/download/v${pkgver}/Lens-${pkgver}.AppImage"
        "${_pkgname}.desktop")
sha256sums=('670f970d413942afc202f55c040c9fa87057d560f7fadec90849f917d474450a'
            '3db5b267cededcc73b3e35b89b46fca419e82832b85fa633e4326156cf648d02')

prepare() {
  chmod +x "${_pkgname}-${pkgver}.AppImage"
  "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${_pkgname}
  mv "${srcdir}"/squashfs-root/* \
    "${pkgdir}"/usr/share/${_pkgname}

  # icon
  install -Dm 644 "${pkgdir}"/usr/share/${_pkgname}/usr/share/icons/hicolor/512x512/apps/kontena-${_pkgname}.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/kontena-${_pkgname}.png

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/kontena-lens \
    "${pkgdir}"/usr/bin/kontena-lens

  # clean and fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/kontena-lens.png
  rm -rf "${pkgdir}"/usr/share/${_pkgname}/usr
}
