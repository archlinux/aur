# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=jeopardy
pkgver=0.9.6
pkgrel=1
pkgdesc="Implementation of well known Jeopardy! quiz show in C++ with Qt"
arch=('i686' 'x86_64')
url="https://github.com/chlange/jeopardy"
license=('BSD')
depends=('qt4' 'phonon-qt4')
source=(
  "https://github.com/chlange/${pkgname}/archive/v${pkgver}s.tar.gz"
  'answer.cpp.patch'
  'jeopardy.cpp.patch'
  'main.cpp.patch'
)
sha256sums=(
  'bc8d79ce0e0212afd70c5ef0568a3ea8f43fafcac4fafe67b258f0d7a19e32f6'
  'd411d19e9df1ddd0ab49b9c34cbf1815f0095fec35964ba6be2a7ca46411cb5b'
  '58a8f4509fb9b84b55674122edf4676b6f0b7930b322764c8c7da51fc1e9d89b'
  '36cb038dc503788abf1baf74f837501146469e5193a765c2a08a2a7b2735337f'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}s"
  for f in answer.cpp jeopardy.cpp main.cpp; do
    patch -p0  "${f}" "${srcdir}/${f}.patch"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}s"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}s"
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  for f in answers/*.jrf; do
    install -D -m 644 ${f} "${pkgdir}/usr/share/${pkgname}/${f}"
  done
  install -D -m 644 images/icon.svg "${pkgdir}/usr/share/${pkgname}/images/icon.svg"
  install -D -m 644 sound/${pkgname}.wav "${pkgdir}/usr/share/${pkgname}/sound/${pkgname}.wav"
  install -D -m 644 sound/title.ogg "${pkgdir}/usr/share/${pkgname}/sound/title.ogg"
}
