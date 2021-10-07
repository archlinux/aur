# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=nyrna
pkgver=2.2.0
pkgrel=1
pkgdesc='Suspend games and applications at any time and resume whenever you wish'
arch=('x86_64')
url="https://github.com/Merrit/nyrna"
license=('GPL3')
depends=('wmctrl' 'xdotool')
makedepends=('flutter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Merrit/nyrna/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88a288a56a60c5a9262da330fff44ba6f09e3a5801105f247a96f4b3345850eb')

prepare(){
  cd "$pkgname-$pkgver"
  flutter clean
  flutter pub get
}

build() {
  cd "$pkgname-$pkgver"
  flutter build linux
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux/x64/release/bundle/data" "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux/x64/release/bundle/lib" "${pkgdir}/opt/${pkgname}"
  cp "${srcdir}/${pkgname}-${pkgver}/build/linux/x64/release/bundle/${pkgname}" "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packaging/linux/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
