# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='dave-gnukem'
pkgname="${_pkgname}-git"
pkgver=1.0.2.r18.g78f98dd
pkgrel=1
pkgdesc='2D scrolling platform shooter inspired by Duke Nukem 1'
arch=('x86_64')
url='https://github.com/davidjoffe/dave_gnukem'
_url_data='https://github.com/davidjoffe/gnukem_data'
license=('GPL2' 'MIT')
depends=('hicolor-icon-theme' 'sdl2_mixer')
makedepends=('git' 'imagemagick')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=()
source=("${_pkgname}-core::git+${url}.git"
        "${_pkgname}-data::git+${_url_data}.git"
        "${_pkgname}"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('SKIP'
            'SKIP'
            'b64a79006ae8648f2e04af8ce6648ed1badea6e84935809d34eca5ecf68c95f7'
            '209cb430b87c2b89455833b7c79ca309a8b87331c63882092b8c1ebeadbf2745'
            '89cb35bd13682bb35f2e7e5a9fc36d0a0f9959b77261d538f8ab1d59edb0321e')

prepare() {
  # Remove -DDEBUG flag in Makefile
  sed -i 's/-DDEBUG//' "${_pkgname}-core/Makefile"
}

pkgver() {
  git -C "${_pkgname}-core" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C "${_pkgname}-core"
}

package() {
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 32 64 128; do
    convert "${_pkgname}.png" -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done

  install -dv "${pkgdir}/usr/share/${_pkgname}/data"
  cp -rfv "${_pkgname}-data/"* "${pkgdir}/usr/share/${_pkgname}/data"

  cd "${_pkgname}-core"
  install -Dvm755 "${_pkgname/-/}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'MIT-LICENSE.txt' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
