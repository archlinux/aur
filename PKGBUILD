# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist
pkgver=0.7.2.rc7
pkgrel=1
pkgdesc='A professional screenwriting software.'
url='https://kitscenarist.ru/en/'
arch=('x86_64')
license=('GPL3')
depends=('desktop-file-utils' 'qt5-multimedia' 'qt5-webengine')
makedepends=('git' 'qt5-svg')
source=(
  "${pkgname}::git+https://github.com/dimkanovikov/KITScenarist.git#tag=${pkgver}"
  'mime.xml'
  'build.patch'
)
md5sums=(
  'SKIP'
  '45018aa6c472835db014c62a80f5b6dc'
  'eef816ca49ef1d45f8b101dd26e01a58'
)

prepare() {
  cd "${pkgname}"
  git submodule update --init
  git apply "${srcdir}/build.patch"
}

build() {
  cd "${pkgname}/src"
  qmake Scenarist.pro -spec linux-g++ &&
  make
}

package() {
  install -Dm755 "${pkgname}/build/Release/bin/scenarist-desktop/Scenarist" "${pkgdir}/usr/bin/${pkgname}"
  
  cd "${pkgname}/build/Ubuntu/scenarist_amd64/usr/share"
  install -Dm644 "applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/mime.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
