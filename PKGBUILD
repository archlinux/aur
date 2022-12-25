# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-misc-otb
pkgver=1.0.3
pkgrel=10
pkgdesc="X.org misc fonts (OTB version)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git')
source=(${url}/xorg/font/arabic-misc/-/archive/master/arabic-misc-master.tar.gz
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
md5sums=('5a9c0a655d923a8f6a2b0ced2bcd4f21'
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
      for f in *.bdf; do
        if grep -Fq 'FAMILY_NAME "' "$f" 2>/dev/null; then
          family_name="$(grep -F 'FAMILY_NAME "' "$f")"
          family_name="${family_name%\"}"
          family_name_otb="$family_name (OTB)"
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
  install -m755 -d "${pkgdir}/usr/share/fonts/misc"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/misc/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
}
