# Maintainer: Dan Johansen <strit@archlinux.org>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgbase=dfl-config-parser
pkgname=(
        'dfl-colorschemeparser'
        'dfl-hjsonparser'
        'dfl-wayfireparser'
)
pkgver=0.3.0
pkgrel=2
pkgdesc="A Collection of Config Parsers for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=(
            'meson'
            'ninja'
            'dfl-color-utils'
            'wlroots0.18'
)
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('e7ea505139fe8db077d934d78b14d24b7ca788f058ae0f586c43872c89f1b970')

build() {
  cd "${_pkgname}-v${pkgver}"
  echo "Building QT6 version..."
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package_dfl-colorschemeparser() {
  depends+=('dfl-color-utils')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf6hjson* "$pkgdir"/usr/lib/libdf6wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df6hjson* "$pkgdir"/usr/lib/pkgconfig/df6wayfire*
  rm "$pkgdir"/usr/include/DFL/DF6/DFHjsonParser* "$pkgdir"/usr/include/DFL/DF6/DFWayfireParser*
}

package_dfl-hjsonparser() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf6colorschemeparser* "$pkgdir"/usr/lib/libdf6wayfire*
  rm "$pkgdir"/usr/lib/pkgconfig/df6colorschemeparser* "$pkgdir"/usr/lib/pkgconfig/df6wayfire*
  rm "$pkgdir"/usr/include/DFL/DF6/DFColorScheme* "$pkgdir"/usr/include/DFL/DF6/DFWayfireParser*
}

package_dfl-wayfireparser() {
  depends+=(
          'wlroots0.18'
  )
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
  rm "$pkgdir"/usr/lib/libdf6hjson* "$pkgdir"/usr/lib/libdf6colorschemeparser*
  rm "$pkgdir"/usr/lib/pkgconfig/df6hjson* "$pkgdir"/usr/lib/pkgconfig/df6colorschemeparser*
  rm "$pkgdir"/usr/include/DFL/DF6/DFColorScheme* "$pkgdir"/usr/include/DFL/DF6/DFHjsonParser*
}
