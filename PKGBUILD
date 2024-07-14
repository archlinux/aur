# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=boom
_buildpkgname=lifish
pkgver=1.7.2
pkgrel=1
pkgdesc="A game inspired by Factor Software's BOOM.Bomberman meets DOOM."
arch=('any')
url="https://silverweed.github.io/lifish/"
license=('custom')
makedepends=('cmake')
depends=('sfml')
provides=(${pkgname})
source=(
  "https://github.com/silverweed/lifish/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}"
  "${pkgname}.desktop"
)
sha256sums=('5f5666f8811f310ab34af6ca1a2a305d17ea5197b4b9a4a234d322125bd0ed26'
            'efc02b4b2da6f08fd392236b6e3b1b30d0a1e4b30a68b80eee6e5be40cfb2c11'
            '80349740c8b281d2110524e38f8cd774e31616ced4ea6fc894b516a7772c474f')

build() {
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109418
  # -Werror=maybe-uninitialized has false positives, including in gcc libs, so we disable it here.
  export LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs}

  # gold linker is used in LTO=1 builds, but it doesn't support `-z pack-relative-relocs` flag.
  # https://rfc.archlinux.page/0023-pack-relative-relocs/
  # https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/21
  export CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized"
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
  chmod -R 644 "${pkgdir}/usr/share/${pkgname}/assets/graphics/"
  cp levels.json "${pkgdir}/usr/share/${pkgname}/"
  
  # create savegame outside of installdir
  mkdir "${pkgdir}/usr/share/${pkgname}/saves/"
  chmod 777 "${pkgdir}/usr/share/${pkgname}/saves/"
  ln -s "/usr/share/${pkgname}/saves/.lif_prefs.json" "${pkgdir}/usr/share/${pkgname}/.lif_prefs.json"  

  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
