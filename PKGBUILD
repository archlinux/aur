# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: davedatum <ask at davedatum dot com>
_name=Imagine
pkgname=${_name,,}-git
pkgver=0.9.0.r3.gd2a062c
pkgrel=1
pkgdesc="PNG/JPEG/WebP/AVIF optimization app"
arch=(x86_64)
url="https://github.com/xianfei/${_name}-plus"
license=(MIT)
depends=(electron libjpeg-turbo)
makedepends=(nodejs npm imagemagick git)
provides=("${_name,,}")
conflicts=("${_name,,}")
install=${_name,,}.install
# options=(!strip)
source=("git+${url}.git#branch=master"
  "${_name,,}.sh"
  "${_name,,}.desktop"
  "${_name,,}.install")
sha512sums=('SKIP'
            '30337d827976019c3b143727fe83faf4a648afd23b4dd5b74a0deb5d82b3c3317897b671a543a6fc3f50a7fade538e77cbfcc9781feb9efa4bb56842b14826c0'
            '46632e6688d9b7f64357635d2b5e701193f6bd617ebeea3eda0e7fd84dd9074df2d8a48092f60178b75dcfac1a9e4e00e351d707b1876aa58b621193f5c0d025'
            '815bd0648c4b9403cce83bf6ff4480b1c072afc593cf2ee2eee076b1075bd5703f85308eee55c51a87642bd2a73353d50bbdc20cb13fc4417eade3ff3f380ffb')

pkgver() {
  cd ${_name}-plus
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_name}-plus
  npm install && npm run pack
}

package() {
  install -d "${pkgdir}/opt/${_name,,}"
  cp -a "${_name}-plus/dist/linux-unpacked/." "${pkgdir}/opt/${_name,,}"
  chmod -R 755 "${pkgdir}/opt/${_name,,}"

  install -Dm644 "${_name,,}.desktop" "${pkgdir}/usr/share/applications/${_name,,}.desktop"
  install -Dm644 "${_name,,}.sh" "${pkgdir}/usr/bin/${_name,,}"

  install -Dm644 "${_name}-plus/LICENSE" "${pkgdir}/usr/share/licenses/${_name,,}/LICENSE"

  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/$_size/apps"
    magick "${_name}-plus/build/icon.png" \
      -resize "$_size" "${pkgdir}/usr/share/icons/hicolor/$_size/apps/${_name,,}.png"
  done
}
