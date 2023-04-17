# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=boom
_buildpkgname=lifish
pkgver=1.6
pkgrel=1
pkgdesc="A game inspired by Factor Software's BOOM.Bomberman meets DOOM."
arch=('any')
url="https://silverweed.github.io/lifish/"
license=('custom')
makedepends=('cmake')
depends=('sfml')
provides=(${pkgname})
options=()
source=(
  "https://github.com/silverweed/lifish/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}"
  "${pkgname}.desktop"
)
sha256sums=('f6c04388d67364bbf044f155731a911d8861576c170bca16dcc8d2e078d9eb2a'
            'efc02b4b2da6f08fd392236b6e3b1b30d0a1e4b30a68b80eee6e5be40cfb2c11'
            '80349740c8b281d2110524e38f8cd774e31616ced4ea6fc894b516a7772c474f')
build() {
  cd "${srcdir}/${_buildpkgname}-${pkgver}"
  cmake -DRELEASE=true .
  make
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd "${srcdir}/${_buildpkgname}-${pkgver}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DTm755 "${_buildpkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  cp -r "assets" "${pkgdir}/usr/share/${pkgname}/"
  chmod 544 "${pkgdir}/usr/share/${pkgname}/assets/graphics/"*
  cp levels.json "${pkgdir}/usr/share/${pkgname}/"
  
  # create savegame outside of installdir
  mkdir "${pkgdir}/usr/share/${pkgname}/saves/"
  chmod 777 "${pkgdir}/usr/share/${pkgname}/saves/"
  ln -s "/usr/share/${pkgname}/saves/.lif_prefs.json" "${pkgdir}/usr/share/${pkgname}/.lif_prefs.json"  

  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
