# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=boom
_buildpkgname=lifish
pkgver=1.8.3
pkgrel=1
pkgdesc="A game inspired by Factor Software's BOOM.Bomberman meets DOOM."
arch=('x86_64' 'aarch64')
url="https://silverweed.github.io/lifish/"
license=('custom')
makedepends=('cmake')
depends=('sfml')
provides=(${pkgname})
source=(
  "https://codeberg.org/silverweed/lifish/archive/${pkgver}.tar.gz"
  "${pkgname}"
  "${pkgname}.desktop"
)
sha256sums=('9d282193fa2e30bad5320934027b52bb6b1c296edfd5610736e87bb849c4dace'
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
  cd "${srcdir}/${_buildpkgname}"
  cmake -DRELEASE=true .
  make
}


package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd "${srcdir}/${_buildpkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DTm755 "${_buildpkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  cp -r "assets" "${pkgdir}/usr/share/${pkgname}/"
  chmod 644 "${pkgdir}/usr/share/${pkgname}/assets/graphics/"*
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

