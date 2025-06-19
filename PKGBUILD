# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: mikers <mikeonthecomputer at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=vvvvvv
_pkgname=VVVVVV
pkgver=2.4.3
pkgrel=1
pkgdesc='A retro-styled 2D platformer'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
license=('custom')
depends=('sdl2')
makedepends=('cmake' 'git')
_datafile=data20221117.zip
source=("https://github.com/TerryCavanagh/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.zip"
        "${_datafile}::https://thelettervsixtim.es/makeandplay/data.zip"
        "${pkgname}.desktop")
sha256sums=('72128cc6aa9f3aad1aa01f4f45cb48bd940856675f0cc30704dab80239871e9b'
            'c767809594f6472da9f56136e76657e38640d584164a46112250ac6293ecc0ea'
            '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4')
noextract=("${_datafile}")

prepare() {
  cd "${srcdir}"

  mkdir -p data
  cd data
  bsdtar -xf "../${_datafile}" VVVVVV.png
}

build() {
  cd "${srcdir}/${_pkgname}/desktop_version"

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
  cd "${srcdir}/${_pkgname}"

  install -D -m755 "desktop_version/build/${_pkgname}" \
      "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  cp -r \
      "desktop_version/fonts/" \
      "desktop_version/lang/" \
      "${pkgdir}/usr/lib/${pkgname}/"
  install -D -m644 "LICENSE.md" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/data"

  install -D -m644 "LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-data"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -D -m644 "${srcdir}/${_datafile}" \
      "${pkgdir}/usr/lib/${pkgname}/data.zip"

  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
