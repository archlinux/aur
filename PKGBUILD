# Maintainer: Alexis "Horgix" Chotard <aur-murmure@foss.horgix.fr>

pkgname=murmure
pkgver=1.8.1
pkgrel=1
pkgdesc="Privacy-first and free Speech-to-Text"
license=('GPL-3.0-only')
url='https://murmure.al1x-ai.com/'
arch=('x86_64')
provides=('murmure')
_model=parakeet-tdt-0.6b-v3-int8
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'xdotool')
makedepends=('cargo' 'pnpm' 'nodejs')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Kieirra/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  "${_model}.zip::https://github.com/Kieirra/${pkgname}-model/releases/download/1.0.0/${_model}.zip"
)
sha512sums=(
  'fbfe565566e78de6ec2c8ddc4719d9ae69378caf21b1501303868918edd646c14c4475176ee5c44c220780dca399835ca5c2eb2d940a9ce915b2117e1857ffd7'
  '888f6ae3e8f4f985852d57072b32c45466e081389884827f4d7a3467bac9691cded67eb4e760f900d7aeb8dfcdc1932d6c3d20e0b0e3064e63f1f9ac9d7e5d0d'
)

prepare() {
  cd ${pkgname}-${pkgver}/
  pnpm install
}

build() {
  cd ${pkgname}-${pkgver}/
  CFLAGS+=' -ffat-lto-objects'
  pnpm tauri build -b deb
}

package() {
  cd ${pkgname}-${pkgver}/
  cp -a src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_amd64/data/* "${pkgdir}"
  cd ..

  cp -ar "${_model}" "${pkgdir}/usr/lib/murmure/_up_/resources/"
}
