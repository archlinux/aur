# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-100dpi-otb
pkgver=1.0.3
pkgrel=6
pkgdesc="X.org 100dpi fonts (OTB version)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-mkfontscale' 'xorg-util-macros')
depends=('xorg-fonts-alias-100dpi')
replaces=('xorg-fonts-100dpi')
provides=('xorg-fonts-100dpi')
conflicts=('xorg-fonts-100dpi')
source=(${url}/releases/individual/font/font-adobe-100dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-adobe-utopia-100dpi-1.0.4.tar.bz2
        ${url}/releases/individual/font/font-bh-100dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-bh-lucidatypewriter-100dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-bitstream-100dpi-1.0.3.tar.bz2)
md5sums=('1347c3031b74c9e91dc4dfa53b12f143'
         '66fb6de561648a6dce2755621d6aea17'
         '9f11ade089d689b9d59e0f47d26f39cd'
         'c8b73a53dcefe3e8d3907d3500e484a9'
         '6b223a54b15ecbd5a1bc52312ad790d8')

build() {
  cd "${srcdir}"
  for dir in font-*-100dpi*; do
    if [ -d "${dir}" ]; then
      pushd ${dir}
      ./configure --prefix=/usr \
          --with-fontdir=/usr/share/fonts/100dpi
      make
      shopt -s nullglob
      for f in *.pcf.gz; do
        fonttosfnt -r -o "${f/pcf.gz/otb}" "$f"
      done
      shopt -u nullglob
      popd
    fi
  done
}

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for dir in font-*-100dpi*; do
    if [ -d "${dir}" ]; then
      pushd ${dir}
      make DESTDIR="${pkgdir}" install
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-100dpi-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/100dpi/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
  rm -f "${pkgdir}"/usr/share/fonts/100dpi/fonts.*
  rm "${pkgdir}"/usr/share/fonts/100dpi/*.pcf.gz
}
