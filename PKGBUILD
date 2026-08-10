# Maintainer: Alexis "Horgix" Chotard <aur-murmure@foss.horgix.fr>

pkgname=murmure
pkgver=1.10.1
pkgrel=1
pkgdesc="Privacy-first and free Speech-to-Text"
license=('GPL-3.0-only')
url='https://murmure.al1x-ai.com/'
arch=('x86_64')
provides=('murmure')
_model=parakeet-tdt-0.6b-v3-int8
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'xdotool' 'libappindicator')
makedepends=('cargo' 'pnpm' 'nodejs')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Kieirra/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  "${_model}.zip::https://github.com/Kieirra/${pkgname}-model/releases/download/1.0.0/${_model}.zip"
)
sha512sums=(
  'da0e19f7862d57900e5b1caceefd81e82bad0b56f853d1b895b1830977fc5e81b713452a7359b91df17d170faec25cc904e64003cab1b832740d4f730bec5faa'
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
