# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mashhad-metro-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Guide to the Mashhad Metro: stations, lines, facilities and route finding"
arch=('x86_64')
url="https://github.com/shahriaarrr/mashhad-metro"
license=('GPL-3.0-only')
depends=(
  'at-spi2-core' 'cairo' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
  'harfbuzz' 'libepoxy' 'libgcc' 'libstdc++' 'pango'
)
makedepends=('patchelf')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')
_tag="V${pkgver}"
_dl="${url}/releases/download/${_tag}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/shahriaarrr/mashhad-metro/${_tag}/LICENSE"
        'mashhad-metro.desktop')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/mashhad_metro_linux_${_tag}.zip")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '985b7798d002b2686788924571672efab656d98569c8bb5b736e9a1debb3c355')
sha256sums_x86_64=('dd59e2959b0396ab611e4fc4c7d0f0e9cc0ec16f5ac3d4162b792eebe605ea58')

package() {
  local _app=/opt/mashhad-metro
  install -Dm755 "mashhad_metro" "${pkgdir}${_app}/mashhad_metro"
  cp -r --no-preserve=ownership lib data "${pkgdir}${_app}/"
  find "${pkgdir}${_app}" -type d -exec chmod 755 {} +
  find "${pkgdir}${_app}/lib" "${pkgdir}${_app}/data" -type f -exec chmod 644 {} +
  patchelf --set-rpath '$ORIGIN' "${pkgdir}${_app}/lib/liburl_launcher_linux_plugin.so"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "${_app}/mashhad_metro" "${pkgdir}/usr/bin/mashhad-metro"

  install -Dm644 mashhad-metro.desktop "${pkgdir}/usr/share/applications/mashhad-metro.desktop"
  install -Dm644 "data/flutter_assets/assets/icon/1.png" "${pkgdir}/usr/share/pixmaps/mashhad-metro.png"
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
