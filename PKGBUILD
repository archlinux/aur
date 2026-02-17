# Maintainer: Alvaro Oliveira <alvarolima1103@outlook.com>

pkgname=dmenu-xft-emoji
pkgver=5.4
pkgrel=2
pkgdesc="dmenu with emoji/CJK support, mouse, motion, password mode and tab navigation"
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
)
sha256sums=(
  '8fbace2a0847aa80fe861066b118252dcc7b4ca0a0a8f3a93af02da8fb6cd453'
  'f07a3461e3aef6e1b7541fe0ddec7017643178873a93866f4adebd7ca56d58a0'
  '52b2dd30efa52e38163baef428b41b01f6d4140c050436ba2bfcb68f2e89898d'
  '2610629d1c9a643bd15dc8d7057b6aa6c147780a1ab7c50b0df3d72660da0c0b'
  'adaa9ede195c492663273cea7c5f96409992421bf420b3a2a8e0c89259310716'
  '75c37cda26fb0ee98a6bad9751c878c8cb61f9e25f143cb0250a0152e6b67720'
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
