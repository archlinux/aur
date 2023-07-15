# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=signus
pkgver=1.96.0
pkgrel=3
pkgdesc="Signus: The Artefact Wars assic turn-based strategy war game similar to the old Battle Isle series."
arch=('x86_64' 'aarch64')
url="https://github.com/signus-game/signus"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'libvorbis' 'libjpeg-turbo')
source=(
  "https://github.com/signus-game/signus/archive/refs/tags/v"${pkgver}".tar.gz"
  "https://github.com/signus-game/signus/commit/e10a6a60489155b4002d7ab186b74adb5dc55046.patch"
  "https://github.com/signus-game/signus/commit/796f17954613ee60a4c57f3b613618fb347aeecf.patch"
  "${pkgname}.desktop"
)
sha512sums=('319b2f555f47013d2263ecef6c12751b0f210c052583b943a86bedc4174c5af72495de0d9f2fda578bcd8941b5a7415eb90046b8c8241ce6ebc810fea0e8d756'
            'a27d6024387aa83b75c0e08217c3384e55946458f328bc0a28cb58d48cb6e4dac4a6984c0ad9a80f3e9bf37c4e6bfa79ff797711a6fe90db714bea31d19debdd'
            '2d9870d609f6c8d57585600ad0d91245914caad096eb82ca20918a16b18605002e87d04794886e03c3cc22c713fbf45404ff52ab31e0dbde57ce03c3804182b2'
            '6a791044c16bd93f34e8fd77953f310ae645ee0daad5ec4f469247caf9b8665327c3b799b1ac63d8df357255ec85765f4e329c14266232a058f7445775622656')
conflicts=(${pkgname}-git)

prepare() {
  patch "${srcdir}/${pkgname}-${pkgver}/signus-data/utils/makedat.cpp" < "${startdir}/e10a6a60489155b4002d7ab186b74adb5dc55046.patch"
  patch "${srcdir}/${pkgname}-${pkgver}/signus-data/utils/fonts.cpp" < "${startdir}/796f17954613ee60a4c57f3b613618fb347aeecf.patch"
}

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  #build signus
	cd "${srcdir}/${pkgname}-${pkgver}/signus"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${pkgname}-${pkgver}/build/
  #build signus-data
	cd "${srcdir}/${pkgname}-${pkgver}/signus-data"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${pkgname}-${pkgver}/build/
}

package() {
  install -Dm644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp -rp ${srcdir}/${pkgname}-${pkgver}/build/* ${pkgdir}/
}
