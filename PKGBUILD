# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=sidequest-git
_pkgname=SideQuest
pkgver=v0.8.3.12.ga441b2b
pkgrel=1
pkgdesc="A tool to help simplify getting content onto Oculus Quest, Go, and other VR headsets."
arch=('any')
url="https://sidequestvr.com/"
license=('MIT')
depends=(electron4)
makedepends=(yarn)
options=(!strip)
source=("git+https://github.com/the-expanse/SideQuest"
        "sidequest"
        "openUrl-fix.patch"
        "SideQuest.desktop")
md5sums=('SKIP'
         'ef9bbe8b6707d3f195c6982a289f142a'
         'cefa9ad5ea39b1e5082f2e2b82ae0e4a'
         'aa393219b320d8b96c83714882de8b32')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i "${srcdir}/openUrl-fix.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  yarn install
  yarn dist
}

package() {
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${_pkgname,,}" "$pkgdir/usr/bin/${_pkgname,,}"

  cd "${srcdir}/${_pkgname}"

  install -Dm644 "build/icons/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname,,}.png"
  install -Dm644 "dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/share/${_pkgname}/app.asar"
  cp -r --no-preserve=mode,ownership "dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/share/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
