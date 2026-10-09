# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

_pkgname="rustatio"
pkgname="$_pkgname-bin"
pkgver="2.11.0"
pkgrel=1
pkgdesc="Modern cross-platform BitTorrent ratio management tool that emulates popular torrent clients (prebuilt)"
url="https://github.com/takitsu21/rustatio"
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')

depends=(
  'libayatana-appindicator3'
  'webkit2gtk-4.1'
  'gtk3'
)

source=("LICENSE::https://raw.githubusercontent.com/takitsu21/rustatio/v${pkgver}/LICENSE")
sha256sums=('f6788a3a6fc81be8fd0afb7a279245ab7c9931aea951f26b27ffcf0b8118ee70')

source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/takitsu21/rustatio/releases/download/v${pkgver}/Rustatio_${pkgver}_amd64.deb")
sha256sums_x86_64=('b1a53d89458e3057dff3b9d56f6a5a8d3fa2de376b16a5d23c6ede0b16a22c89')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.gz
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m755 usr/bin/rustatio-desktop "${pkgdir}/usr/bin/rustatio-desktop"
  ln -s /usr/bin/rustatio-desktop "${pkgdir}/usr/bin/${_pkgname}"

  install -m644 usr/share/applications/Rustatio.desktop "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  for _size in 32x32 128x128 256x256 512x512 1024x1024; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    install -m644 "usr/share/icons/hicolor/${_size}/apps/rustatio-desktop.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/"
  done
}
