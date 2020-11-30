# Maintainer: Xesxen <arch@xesxen.nl>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=vvvvvv-git
binname=vvvvvv
pkgver=20201123.9f5f697
_pkgver=git
pkgrel=2
pkgdesc='A retro-styled 2D platformer'
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
    "https://thelettervsixtim.es/makeandplay/data.zip"
)
sha256sums=(
    'SKIP'
    '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
    '883913125c4630d16fe0081d9a96bf65f2bc08ace7fa345613669d827a8ea7c1'
    '6fae3cdec06062d05827d4181c438153f3ea3900437a44db73bcd29799fe57e0'
)
install="${pkgname}.install"

pkgver() {
	cd "${srcdir}/VVVVVV"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd VVVVVV/desktop_version

  echo "Please note: the retrieved data.zip is for personal use only without redistribution"
  echo "See also: /usr/share/licenses/vvvvvv-git/LICENSE.md and https://thelettervsixtim.es/makeandplay/"
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
  # Legal: There used to be a separate LICENSE-data.md, but the LICENSE.md also mentions the "Make and Play" edition specifically.
  # We now instead warn the user on build they should not redistribute the package and mention the same on install
  install -m755 ${binname^^} \
    "${pkgdir}/opt/${binname}/${binname}"

  cd ${srcdir}
  install -m644 -t "${pkgdir}/opt/${binname}" \
      data.zip
  install -D -m755 "${srcdir}/${binname}.sh" "${pkgdir}/usr/bin/${binname}"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${binname}.png"
  install -D -m644 "${srcdir}/${binname}.desktop" \
      "${pkgdir}/usr/share/applications/${binname}.desktop"
}
