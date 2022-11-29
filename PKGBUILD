# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='dave-gnukem'
pkgver=1.0.3
_pkgver=1.0.3
pkgrel=1
pkgdesc='2D scrolling platform shooter inspired by Duke Nukem 1'
arch=('x86_64')
url='https://github.com/davidjoffe/dave_gnukem'
_url_data='https://github.com/davidjoffe/gnukem_data'
license=('GPL2' 'MIT')
depends=('hicolor-icon-theme' 'sdl2_mixer')
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-data.tar.gz::${_url_data}/archive/refs/tags/${_pkgver}.tar.gz"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('2dbf00fcdb9aeeb7caaf0eb7403d34af33e3c08556d9376ae5f9c9c5647afd98'
            'af0601ae1898b4718e8a2d62900a3ab1aa11113d60b64d03dd59ef945217333f'
            '7462158ad4dd0c853f01bedb90a8e6b8490f48b33dd39252260d4cfa425b8289'
            '209cb430b87c2b89455833b7c79ca309a8b87331c63882092b8c1ebeadbf2745'
            '89cb35bd13682bb35f2e7e5a9fc36d0a0f9959b77261d538f8ab1d59edb0321e')

prepare() {
  # Remove -DDEBUG flag in Makefile
  sed -i 's/-DDEBUG//' "${pkgname/-/_}-${pkgver}/Makefile"
}

build() {
  make -C "${pkgname/-/_}-${pkgver}"
}

package() {
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 32 64 128; do
    convert "${pkgname}.png" -resize "${i}x${i}" "icon${i}.png"
    install -Dvm644 "icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  install -dv "${pkgdir}/usr/share/${pkgname}/data"
  cp -rfv "${pkgname#*-}_data-${_pkgver}/"* "${pkgdir}/usr/share/${pkgname}/data"

  cd "${pkgname/-/_}-${pkgver}"
  install -Dvm755 "${pkgname/-/}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'MIT-LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
