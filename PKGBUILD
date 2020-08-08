#Maintainer: Ryan Farley <ryan.farley@gmx.com>
#Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-cyrillic-otb
pkgver=1.0.3
pkgrel=5
pkgdesc="X.org cyrillic fonts (OTB version)"
arch=(any)
url="https://xorg.freedesktop.org/"
license=('custom')
replaces=('xorg-fonts-cyrillic')
provides=('xorg-fonts-cyrillic')
conflicts=('xorg-fonts-cyrillic')
makedepends=('fonttosfnt' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-mkfontscale' 'xorg-util-macros')
depends=('xorg-fonts-alias-cyrillic')
source=(${url}/releases/individual/font/font-cronyx-cyrillic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-misc-cyrillic-${pkgver}.tar.bz2
        ${url}/releases/individual/font/font-screen-cyrillic-1.0.4.tar.bz2
        ${url}/releases/individual/font/font-winitzki-cyrillic-${pkgver}.tar.bz2)
md5sums=('e452b94b59b9cfd49110bb49b6267fba'
         '96109d0890ad2b6b0e948525ebb0aba8'
         '6f3fdcf2454bf08128a651914b7948ca'
         '829a3159389b7f96f629e5388bfee67b')

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      ./configure --prefix=/usr \
		      --with-fontdir=/usr/share/fonts/cyrillic
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
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      make DESTDIR="${pkgdir}" install
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/cyrillic/${f}"
      done
      shopt -u nullglob
      popd
    fi    
  done
  rm -f "${pkgdir}"/usr/share/fonts/*/fonts.*
  rm ${pkgdir}/usr/share/fonts/cyrillic/*.pcf.gz
}
