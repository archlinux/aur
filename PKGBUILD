# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist
pkgver=0.7.2.beta8
pkgrel=2
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-webengine')
makedepends=('git')
source=(
  "${pkgname}::git+https://github.com/dimkanovikov/KITScenarist.git#tag=${pkgver}"
  "build.patch"
  "${pkgname}.desktop"
  "${pkgname}.png"
  "${pkgname}.sh"
)
md5sums=(
  'SKIP'
  'b7c67d596a36ac3c45e58d64da1cf2bc'
  'fda5daa58cdf45b83eb6be4585bfda0f'
  '675823c4359fef11810a0229d1f69466'
  'e73bb78f9e7a2de9dbc0abe6c6d3ac78'
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
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}/build/Release/bin/scenarist-desktop/Scenarist" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  cd "${pkgname}/build/Release/libs"
  find . -name '*.so*' -exec cp -dp --no-preserve=ownership -t "${pkgdir}/usr/lib/${pkgname}" '{}' \+
}
