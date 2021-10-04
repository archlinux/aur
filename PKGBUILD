# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: mikers <mikeonthecomputer at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=vvvvvv
_pkgname=VVVVVV
pkgver=2.3.4
pkgrel=2
pkgdesc='A retro-styled 2D platformer'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
license=('custom')
depends=('sh' 'sdl2_mixer')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/TerryCavanagh/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "https://thelettervsixtim.es/makeandplay/data.zip"
        "${pkgname}.desktop"
        "rm-srcdir-in-bin.patch")
md5sums=('e6ee8b4f7f143104a495d91bad057807'
         '224e0c88627e529bc0dc885aa6df94db'
         'f3f06f16bf7f3280279e2d3da425a5d2'
         '9e0cf26cc72b5d409321895c36a6ade6')
sha256sums=('514b85ee21a3a8d9bfb9af00bc0cd56766d69f84c817799781da93506f30dd9c'
            '6fae3cdec06062d05827d4181c438153f3ea3900437a44db73bcd29799fe57e0'
            '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
            '1707013fe1bc924d1f9a1443d504e7cbef6eb5595fe2a5c6586945fb908f778a')
noextract=("data.zip")

prepare() {
  cd "${srcdir}"

  patch -p1 -i "${srcdir}/rm-srcdir-in-bin.patch" -d "${_pkgname}-${pkgver}"

  mkdir -p data
  cd data
  bsdtar -xf ../data.zip VVVVVV.png
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/desktop_version"

  mkdir -p build
  cd build
  cmake -DOFFICIAL_BUILD=ON ..
  make

  cd "${srcdir}/data"

  cat >> LICENSE <<EOF
Please note that the game was compiled with the original levels, so game assets
data.zip and vvvvvv.png are not redistributable. Only for personal use.
EOF
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m755 "desktop_version/build/${_pkgname}" \
      "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  install -D -m644 "LICENSE.md" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/data"

  install -D -m644 "LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-data"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -D -m644 "${srcdir}/data.zip" "${pkgdir}/usr/lib/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
