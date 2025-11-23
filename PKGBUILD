# Maintainer: Pavel Dobiáš <mail at paveldobias dot eu>

pkgname=chunker-bin
_pkgname="${pkgname%-bin}"
_pkgname_orig=Chunker
_binname=chunker-electron
pkgver=1.13.0
pkgrel=1
pkgdesc='The open-source Minecraft world converter'
arch=(x86_64)
url='https://www.chunker.app/'
license=('MIT')
depends=(
  at-spi2-core
  gtk3
  libnotify
  libsecret
  libxss
  libxtst
  nss
  util-linux-libs
)
optdepends=('libappindicator-gtk3:  Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library)'
)

makedepends=(gzip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("https://github.com/HiveGamesOSS/Chunker/releases/download/${pkgver}/Chunker-${pkgver}-amd64-linux.deb")
sha256sums=('d8f3a81d79198eac5ccd434569d73d9224cd118a110bec285f1469b8ef7707c5')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  mv "${pkgdir}/opt/${_pkgname_orig}" "${pkgdir}/opt/${_pkgname}"
  mv "${pkgdir}/opt/${_pkgname}/${_binname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_binname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
  mv "${pkgdir}/usr/share/doc/${_binname}/changelog.gz" "${pkgdir}/usr/share/doc/${_pkgname}/changelog.gz"
  mv "${pkgdir}/usr/share/applications/${_binname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  gzip -d "${pkgdir}/usr/share/doc/${_pkgname}/changelog.gz"

  sed -i "s:/opt/${_pkgname_orig}/${_binname}:/opt/${_pkgname}/${_pkgname}:" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i "s:Icon=${_binname}:Icon=${_pkgname}:" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
