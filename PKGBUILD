# Contributor: pkfbcedkrz <pkfbcedkrz@gmail.com>

pkgname=xorg-fonts-web-otb
pkgver=1.0.3
pkgrel=1
pkgdesc="Xorg bitmap fonts - small sizes only, so that anti-aliased fonts can serve as fallback for larger sizes. Works best in web browsers and desktop environments / window managers that do not use large fonts (eg, in screen lockers)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git' 'xorg-bdftopcf' 'xorg-font-util' 'xorg-mkfontscale' 'xorg-util-macros')
depends=()
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
        ${url}/xorg/font/sun-misc/-/archive/master/sun-misc-master.tar.gz)
md5sums=('0cba842df3c423f4e297e1b538f3c533'
         'c9fc3977d1b52566588dcbb4ddaaf49e'
         '0aebf329ab88ad11c6222a793892100c'
         '9763ec6ee2e3629f0c371cb2aa4f0633'
         '5735aaf5395840732382f1864a0e33d8'
         'a123d7677bd4dd6c3962f6bee81770e9'
         '93631f400edfdf199baef8fdf6756316'
         '4e0c07a09e5c1297c8b9490073a928f3'
         '23b51799bd440e92e7f70a97943a0272'
         '01533309f836494a2bf7c09ca64c1212'
         '5a9c0a655d923a8f6a2b0ced2bcd4f21'
         '7366b3db1f06cc3756144865aa529373'
         '686d89f1131962296549b2301cee6c9e'
         '0189edf130858cd8d328b23e2f76eaa7'
         '456a4eb3a28a5e9e1147c49f6a003199'
         'dc4ce06a2e0f3c61622a4fef55d650e3'
         'c0253fefc9c1f8e0815f2ca3ed529e4e'
         '5581234f77f3e297c0a6188b0528c7ed'
         'ae8ecb72cb2e147210f40b80ce655b4e'
         '39a2f0bff999200b04ba1e7678d11219'
         'e5bcd3cefbc5e77474cf74aedf6a416b'
         '37dffbac5f4524a0f742f4af22b5914b'
         '4606e07f5e29e1eccdbf47a2f7c33842'
         '084775f3656adad65965efc70d20d69f')

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      shopt -s nullglob
      if [ "${dir}" == adobe-100dpi-master ]; then
        max_pixel_size=12
      elif [[ "${dir}" == *misc* ]]; then
        max_pixel_size=13
        rm -rf {7,8}*.bdf 2>/dev/null
      else
        max_pixel_size=10
      fi
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
      if [[ "${dir}" == *75dpi* ]]; then
        g=75dpi
      elif [[ "${dir}" == *100dpi* ]]; then
        g=100dpi
      elif [[ "${dir}" == *misc* ]]; then
        g=misc
      fi
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

























