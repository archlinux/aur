# Maintainer: Alvaro Oliveira <alvarolima1103@outlook.com>

pkgname=dmenu-xft-emoji
pkgver=5.4
pkgrel=3
pkgdesc="dmenu with emoji/CJK support, mouse, motion, password mode, tab navigation and dynamic height"
arch=('x86_64')
url="https://tools.suckless.org/dmenu/"
license=('MIT')
depends=('libxft' 'libxinerama' 'fontconfig')
optdepends=(
  'terminus-font: bitmap Terminus for X11'
  'noto-fonts: sans-serif fonts'
  'noto-fonts-cjk: CJK fonts'
  'noto-fonts-emoji: color emoji fonts'
)
conflicts=('dmenu' 'dmenu-git')
provides=('dmenu')

source=(
  "https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz"
  "config.h"
  "dmenu-mousesupport-5.4.diff"
  "dmenu-mousesupport-motion-5.4.diff"
  "dmenu-password-5.4.diff"
  "dmenu-tab-navigation-5.4.diff"
  "dmenu-dynamic-height-5.4.diff"
)
sha256sums=(
  '8fbace2a0847aa80fe861066b118252dcc7b4ca0a0a8f3a93af02da8fb6cd453'
  '053c3e114bb4b802f47286700db8cb4d58ae917a9c3fda9f1bcd72074e2d24fb'
  '0328abab5b8f8d8ea65128ff04c102b740ef364e86e7b8fedc1a3e018a78f792'
  'fe1b08968ed804bf73d2a136a6dbdc6f23229ea21abd15969f537d39903aac01'
  '672207ee3c15062311b4978d3b5ca6129e513a89a4205ee7373284db6c80c568'
  '4ad158a439e1f40ee4c83b50ea6891c6ab72efed83132ab9792ab2100067b9c8'
  '4535359f61ab903fb1d2e8afde59758cd007251460ccaeab7afa73354ba5bcff'
)

prepare() {
  cd "${srcdir}/dmenu-${pkgver}"

  # Copy custom config
  cp "${srcdir}/config.h" .

  # Apply patches in order
  patch -Np1 -i "${srcdir}/dmenu-mousesupport-5.4.diff"
  patch -Np1 -i "${srcdir}/dmenu-mousesupport-motion-5.4.diff"
  patch -Np1 -i "${srcdir}/dmenu-password-5.4.diff"
  patch -Np1 -i "${srcdir}/dmenu-tab-navigation-5.4.diff"
  patch -Np1 -i "${srcdir}/dmenu-dynamic-height-5.4.diff"
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
