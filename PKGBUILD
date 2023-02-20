# Contributor: pkfbcedkrz <pkfbcedkrz@gmail.com>

pkgname=xorg-fonts-web-otb
pkgver=1.0.3
pkgrel=2
pkgdesc="Xorg bitmap fonts - small sizes only, so that anti-aliased fonts can serve as fallback for larger sizes. Works best in web browsers and desktop environments / window managers that do not use large fonts (eg, in screen lockers)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git')
source=(${url}/xorg/font/adobe-75dpi/-/archive/master/adobe-75dpi-master.tar.gz
        ${url}/xorg/font/adobe-utopia-75dpi/-/archive/master/adobe-utopia-75dpi-master.tar.gz
        ${url}/xorg/font/bh-75dpi/-/archive/master/bh-75dpi-master.tar.gz
        ${url}/xorg/font/bh-lucidatypewriter-75dpi/-/archive/master/bh-lucidatypewriter-75dpi-master.tar.gz
        ${url}/xorg/font/bitstream-75dpi/-/archive/master/bitstream-75dpi-master.tar.gz
        ${url}/xorg/font/adobe-100dpi/-/archive/master/adobe-100dpi-master.tar.gz
        ${url}/xorg/font/adobe-utopia-100dpi/-/archive/master/adobe-utopia-100dpi-master.tar.gz
        ${url}/xorg/font/bh-100dpi/-/archive/master/bh-100dpi-master.tar.gz
        ${url}/xorg/font/bh-lucidatypewriter-100dpi/-/archive/master/bh-lucidatypewriter-100dpi-master.tar.gz
        ${url}/xorg/font/bitstream-100dpi/-/archive/master/bitstream-100dpi-master.tar.gz
        ${url}/xorg/font/arabic-misc/-/archive/master/arabic-misc-master.tar.gz
        ${url}/xorg/font/cursor-misc/-/archive/master/cursor-misc-master.tar.gz
        ${url}/xorg/font/daewoo-misc/-/archive/master/daewoo-misc-master.tar.gz
        ${url}/xorg/font/dec-misc/-/archive/master/dec-misc-master.tar.gz
        ${url}/xorg/font/isas-misc/-/archive/master/isas-misc-master.tar.gz
        ${url}/xorg/font/jis-misc/-/archive/master/jis-misc-master.tar.gz
        ${url}/xorg/font/micro-misc/-/archive/master/micro-misc-master.tar.gz
        ${url}/xorg/font/misc-ethiopic/-/archive/master/misc-ethiopic-master.tar.gz
        ${url}/xorg/font/misc-meltho/-/archive/master/misc-meltho-master.tar.gz
        ${url}/xorg/font/misc-misc/-/archive/master/misc-misc-master.tar.gz
        ${url}/xorg/font/mutt-misc/-/archive/master/mutt-misc-master.tar.gz
        ${url}/xorg/font/schumacher-misc/-/archive/master/schumacher-misc-master.tar.gz
        ${url}/xorg/font/sony-misc/-/archive/master/sony-misc-master.tar.gz
        ${url}/xorg/font/sun-misc/-/archive/master/sun-misc-master.tar.gz
        ${url}/xorg/font/cronyx-cyrillic/-/archive/master/cronyx-cyrillic-master.tar.gz
        ${url}/xorg/font/misc-cyrillic/-/archive/master/misc-cyrillic-master.tar.gz
        ${url}/xorg/font/screen-cyrillic/-/archive/master/screen-cyrillic-master.tar.gz
        ${url}/xorg/font/winitzki-cyrillic/-/archive/master/winitzki-cyrillic-master.tar.gz)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      shopt -s nullglob
      max_pixel_size=18
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
          if  [[ "${dir}" == *cyrillic* ]]; then
            family_name_otb="$family_name Cyrillic Web (OTB)"
          else
            family_name_otb="$family_name Web (OTB)"
          fi
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
      if [[ "${dir}" == *75dpi* ]]; then
        g=75dpi
      elif [[ "${dir}" == *100dpi* ]]; then
        g=100dpi
      elif [[ "${dir}" == *misc* ]]; then
        g=misc
      elif [[ "${dir}" == *cyrillic* ]]; then
        g=cyrillic
      fi
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-*}"
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

























