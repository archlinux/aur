# Maintainer: Xesxen <arch@xesxen.nl>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=vvvvvv-git
binname=vvvvvv
pkgver=20230402.c88f249f
_pkgver=git
pkgrel=1
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
    "git+https://github.com/lvandeve/lodepng"
    "git+https://github.com/icculus/physfs/"
    "git+https://github.com/leethomason/tinyxml2/"
    "git+https://github.com/FNA-XNA/FAudio"
    "git+https://github.com/Mashpoe/c-hashmap"
    "${binname}.desktop"
    "${binname}.sh"
    "https://thelettervsixtim.es/makeandplay/data.zip"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
            '883913125c4630d16fe0081d9a96bf65f2bc08ace7fa345613669d827a8ea7c1'
            'c767809594f6472da9f56136e76657e38640d584164a46112250ac6293ecc0ea')
install="${pkgname}.install"

pkgver() {
	cd "${srcdir}/VVVVVV"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd VVVVVV

  echo "Please note: the retrieved data.zip is for personal use only without redistribution"
  echo "See also: /usr/share/licenses/vvvvvv-git/LICENSE.md and https://thelettervsixtim.es/makeandplay/"

  git submodule init
  for submodule in lodepng physfs tinyxml2 FAudio c-hashmap; do
    git config "submodule.third_party/$submodule.url" "$srcdir/$submodule"
  done
  git -c protocol.allow=never -c protocol.file.allow=always submodule update
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
