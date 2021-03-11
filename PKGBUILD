# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=sidequest-git
_pkgname=SideQuest
pkgver=v0.10.19
pkgrel=1
pkgdesc="A tool to help simplify getting content onto Oculus Quest, Go, and other VR headsets."
arch=('any')
url="https://sidequestvr.com/"
license=('MIT')
depends=(electron7-bin android-udev)
makedepends=(git yarn)
provides=(sidequest)
conflicts=(sidequest)
options=(!strip)
source=("git+https://github.com/SideQuestVR/SideQuest"
        "sidequest"
        "openUrl-fix.patch"
        "SideQuest.desktop")
md5sums=('SKIP'
         '62f3bd6ab5f01a302a0f977d383cdd0c'
         '8412856865e2253c13f257f73bfe7e75'
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
