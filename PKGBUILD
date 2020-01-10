# Maintainer: Xesxen <arch@xesxen.nl>

pkgname=vvvvvv-git
binname=vvvvvv
pkgver=2.2
_pkgver=git
pkgrel=1
pkgdesc='A retro-styled 2D platformer (game sold separately)'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
license=('custom')
depends=('sh' 'sdl2_mixer')
conflicts=('vvvvvv')
source=(
    "git+https://github.com/TerryCavanagh/VVVVVV.git"
    "${binname}.desktop"
    "${binname}.sh"
    "file://data.zip"
)
md5sums=(
    'SKIP'
    'f3f06f16bf7f3280279e2d3da425a5d2'
    '6d1c555a18bcd5cba8c55a62cf0964ac'
    '224e0c88627e529bc0dc885aa6df94db'
)

prepare() {
  cd VVVVVV/desktop_version
  # Disable the integration with Steam, the game seems fine without it
  sed -i "s/NETWORK_init/\/\/NETWORK_init/g" ./src/main.cpp
}

build() {
  cd VVVVVV/desktop_version
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd ${srcdir}/VVVVVV/desktop_version/build
  install -d "${pkgdir}/opt/${binname}"
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 ${binname}.x86_64 \
        "${pkgdir}/opt/${binname}/${binname}"
  else
    install -m755 ${binname}.x86 \
        "${pkgdir}/opt/${binname}/${binname}"
  fi

  cd "${srcdir}"
  install -m644 -t "${pkgdir}/opt/${binname}" \
      data.zip
  install -D -m755 "${srcdir}/${binname}.sh" "${pkgdir}/usr/bin/${binname}"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${binname}.png"
  install -D -m644 "${srcdir}/${binname}.desktop" \
      "${pkgdir}/usr/share/applications/${binname}.desktop"
}
