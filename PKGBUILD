# Maintainer: pkfbcedkrz <pkfbcedkrz@gmail.com>
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-75dpi-otb
pkgver=1.0.3
pkgrel=9
pkgdesc="X.org 75dpi fonts (OTB version)"
arch=('any')
url="https://gitlab.freedesktop.org/"
license=('custom')
makedepends=('fonttosfnt-git')
source=(${url}/xorg/font/adobe-75dpi/-/archive/master/adobe-75dpi-master.tar.gz
        ${url}/xorg/font/adobe-utopia-75dpi/-/archive/master/adobe-utopia-75dpi-master.tar.gz
        ${url}/xorg/font/bh-75dpi/-/archive/master/bh-75dpi-master.tar.gz
        ${url}/xorg/font/bh-lucidatypewriter-75dpi/-/archive/master/bh-lucidatypewriter-75dpi-master.tar.gz
        ${url}/xorg/font/bitstream-75dpi/-/archive/master/bitstream-75dpi-master.tar.gz)
md5sums=('SKIP'
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
  install -m755 -d "${pkgdir}/usr/share/fonts/75dpi"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-75dpi-*}"
      shopt -s nullglob
      for f in *.otb; do
        install -m644 "$f" "${pkgdir}/usr/share/fonts/75dpi/${f}"
      done
      shopt -u nullglob
      popd
    fi
  done
}
