# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-cyrillic-otb
pkgver=1.0.3
pkgrel=7
pkgdesc="X.org cyrillic fonts (OTB version)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-mkfontscale' 'xorg-util-macros')
depends=('xorg-fonts-alias-cyrillic')
source=(${url}/xorg/font/cronyx-cyrillic/-/archive/master/cronyx-cyrillic-master.tar.gz
        ${url}/xorg/font/misc-cyrillic/-/archive/master/misc-cyrillic-master.tar.gz
        ${url}/xorg/font/screen-cyrillic/-/archive/master/screen-cyrillic-master.tar.gz
        ${url}/xorg/font/winitzki-cyrillic/-/archive/master/winitzki-cyrillic-master.tar.gz)
md5sums=('5a799bab6b679de660740c70adac78d8'
         'f34c5292f5e12ea4b045baf4c723a2bf'
         '7ec6f2e510314b0ddbf6526997f7ac4b'
         '0e4554730f898dd6dc0e05d1047c7840')

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      shopt -s nullglob
      for f in *.bdf; do
        family_name="$(grep -F 'FAMILY_NAME "' "$f")"
        family_name="${family_name%\"}"
        family_name_otb="$family_name (OTB)"
        sed -i "s/$family_name/$family_name_otb/" "$f"
        fonttosfnt -b -c -g 2 -m 2 -o "${f/bdf/otb}" "$f"
      done
      shopt -u nullglob
      popd
    fi
  done
}

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m755 -d "${pkgdir}/usr/share/fonts/cyrillic"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/cyrillic/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
}
