# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-75dpi-otb
pkgver=1.0.3
pkgrel=7
pkgdesc="X.org 75dpi fonts (OTB version)"
arch=(any)
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-mkfontscale' 'xorg-util-macros')
depends=('xorg-fonts-alias-75dpi')
replaces=('xorg-fonts-75dpi')
provides=('xorg-fonts-75dpi')
conflicts=('xorg-fonts-75dpi')
source=(${url}/releases/individual/font/font-adobe-75dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-adobe-utopia-75dpi-1.0.4.tar.bz2
        ${url}/releases/individual/font/font-bh-75dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-bh-lucidatypewriter-75dpi-1.0.3.tar.bz2
        ${url}/releases/individual/font/font-bitstream-75dpi-1.0.3.tar.bz2)
md5sums=('6c9f26c92393c0756f3e8d614713495b'
         'e99276db3e7cef6dccc8a57bc68aeba7'
         '565494fc3b6ac08010201d79c677a7a7'
         'f6d65758ac9eb576ae49ab24c5e9019a'
         'd7c0588c26fac055c0dd683fdd65ac34')

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      ./configure --prefix=/usr \
          --with-fontdir=/usr/share/fonts/75dpi
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
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      make DESTDIR="${pkgdir}" install
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-75dpi-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/75dpi/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
  rm -f "${pkgdir}"/usr/share/fonts/75dpi/fonts.*
  rm "${pkgdir}"/usr/share/fonts/75dpi/*.pcf.gz
}
