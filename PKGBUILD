# Maintainer: Alvaro Oliveira <alvaro.oliveira@mail.com>

pkgname=dmenu-xft-emoji
pkgver=5.4
pkgrel=1
pkgdesc="dmenu with color-font (emoji) and CJK fallback support"
arch=('x86_64')
url="https://tools.suckless.org/dmenu/"
license=('MIT')

depends=('libxft' 'libxinerama' 'fontconfig')
optdepends=('terminus-font: bitmap Terminus for X11')

source=(
  "https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz"
  "dmenu-allow-color-font-5.4.diff"
  "config.h"
)
sha256sums=('8fbace2a0847aa80fe861066b118252dcc7b4ca0a0a8f3a93af02da8fb6cd453'
            '5d0ad90d272b7a11dce9da914e2777e6e168b38070c02ed057f1d26532e60500'
            'e62952aa4d8798d3abe5007faddda851b23ab971cc15dd7f201f5b7099fa4887')

prepare() {
  cd "${srcdir}/dmenu-${pkgver}"
  
  # Apply color-font patch
  patch -Np1 -i "${srcdir}/dmenu-allow-color-font-${pkgver}.diff" || true
  
  # Copy custom config.h
  cp "${srcdir}/config.h" .
}

build() {
  cd "${srcdir}/dmenu-${pkgver}"
  make
}

package() {
  cd "${srcdir}/dmenu-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
