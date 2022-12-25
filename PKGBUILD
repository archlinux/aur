# Contributor: pkfbcedkrz <pkfbcedkrz@gmail.com>

pkgname=xorg-fonts-web-cyrillic-otb
pkgver=1.0.3
pkgrel=1
pkgdesc="Xorg bitmap fonts (cyrillic) - small sizes only, so that anti-aliased fonts can serve as fallback for larger sizes. Works best in web browsers and desktop environments / window managers that do not use large fonts (eg, in screen lockers)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git')
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
      max_pixel_size=14
      for f in *.bdf; do
        name="${f%.bdf}"
        mv "$f" "${name}-web.bdf"
      done
      for f in *-web.bdf; do
        if ! grep -Fq PIXEL_SIZE "$f" 2>/dev/null; then
          rm -f "$f" 2>/dev/null && continue
        else
          pixel_size="$(grep -F PIXEL_SIZE "$f" 2>/dev/null | cut -d ' ' -f 2)"
          if [ "$pixel_size" -gt "$max_pixel_size" ]; then
            rm -f "$f" 2>/dev/null && continue
          fi
        fi
        if grep -Fq 'FAMILY_NAME "' "$f" 2>/dev/null; then
          family_name="$(grep -F 'FAMILY_NAME "' "$f")"
          family_name="${family_name%\"}"
          family_name_otb="$family_name Web (OTB)"
          sed -i "s/$family_name/$family_name_otb/" "$f"
        fi
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
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      g=cyrillic
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir}"
      install -m755 -d "${pkgdir}/usr/share/fonts/${g}"
      shopt -s nullglob
      for f in *-web.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/${g}/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
}

























