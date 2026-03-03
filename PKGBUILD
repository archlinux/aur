# Maintainer: Arthur Aslanyan <arthur.e.aslanyan@gmail.com>
_name=starc

pkgname="${_name}-appimage"
pkgver=0.8.1
pkgrel=1
pkgdesc="Intuitive writing app with smart features and a streamlined process for film, TV, radio, stage and more."
arch=('x86_64')
url='https://starc.app/'
license=('GPL3' 'custom')
depends=('zlib' 'bash' 'patch')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
options=(!strip)
source=("${pkgname}-${pkgver}::https://github.com/story-apps/starc/releases/download/v${pkgver}/${_name}-setup.AppImage"
  "${_name}.desktop.patch"
  "${_name}.sh")
sha256sums=('d5f3780bc9a8ef18128c5d6d24fcf50676388f2c79bf2751a51f6c6b80343ff6'
  'd004ebb0e333f4d3e3072cc0fa9db65cd79bdcfb959d8b86faec568643a75b91'
  '642005557de950e4fd37bc87fe2fb051e7f93f61e7287161fe3c99c9918977c7')

prepare() {
  cd "${srcdir}"
  chmod +x "${pkgname}-${pkgver}"
  "./${pkgname}-${pkgver}" --appimage-extract
  patch -Np0 <"./${_name}.desktop.patch"
}

package() {
  # Install AppImage and bin
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/appimages/${_name}.AppImage"
  install -Dm755 "${srcdir}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"

  # Install icon and desktop
  install -Dm644 "${srcdir}/squashfs-root/${_name}.png" "${pkgdir}/usr/share/pixmaps/${_name}.png"
  install -Dm644 "${srcdir}/squashfs-root/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"

  # TODO: Install custom LICENSE when author makes it
  # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
