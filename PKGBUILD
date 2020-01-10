# Maintainer: Xesxen <arch@xesxen.nl>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=vvvvvv-git
binname=vvvvvv
pkgver=20200110.146cdde
_pkgver=git
_databin=vvvvvv-mp-11192019-bin
pkgrel=1
pkgdesc='A retro-styled 2D platformer (game sold separately)'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
license=('custom')
depends=('sh' 'sdl2_mixer')
makedepends=('git' 'cmake')
provides=('vvvvvv')
conflicts=('vvvvvv')
source=(
    "git+https://github.com/TerryCavanagh/VVVVVV.git"
    "${binname}.desktop"
    "${binname}.sh"
    "http://www.flibitijibibo.com/${_databin}"
)
sha256sums=(
    'SKIP'
    '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
    '883913125c4630d16fe0081d9a96bf65f2bc08ace7fa345613669d827a8ea7c1'
    '9f7307e111b4f8e19c02d6a0fbf4b43b93a17f341468993fa4fa0c4eae42fc4a'
)

pkgver() {
	cd "${srcdir}/VVVVVV"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

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
  install -D -m644 ../../LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  # Legal considerations for inclusion of data.zip
  sed --silent '38,50p' ../README.md > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-data.md"
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 ${binname}.x86_64 \
        "${pkgdir}/opt/${binname}/${binname}"
  else
    install -m755 ${binname}.x86 \
        "${pkgdir}/opt/${binname}/${binname}"
  fi

  cd "${srcdir}/data"
  install -m644 -t "${pkgdir}/opt/${binname}" \
      data.zip
  install -D -m755 "${srcdir}/${binname}.sh" "${pkgdir}/usr/bin/${binname}"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${binname}.png"
  install -D -m644 "${srcdir}/${binname}.desktop" \
      "${pkgdir}/usr/share/applications/${binname}.desktop"
}
