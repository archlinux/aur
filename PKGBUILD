# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-inkjet-printer-escpr2"
pkgname="${_pkgname}-bin"
pkgver=1.2.30
pkgrel=1
pkgdesc="Epson inkjet printer driver 2 (ESC/P-R) used with CUPS"
arch=('armv7h' 'x86_64')
url="https://download.ebz.epson.net/man/linux/escpr2.html"
license=('LGPL-2.1-or-later' 'custom:Epson End User Software License Agreement')
depends=('cups' 'glibc' 'libcups')
provides=("${_pkgname}" 'libescpr2.so')
conflicts=("${_pkgname}")
# makedepends=('patchelf')
_pkgsrc="${_pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source_armv7h=("${_pkgsrc}-armv7h.deb::https://download3.ebz.epson.net/dsc/f/03/00/16/87/10/3aef45766ee53723bdc4538ad315886332bbeb96/${_pkgname}_${pkgver}_armhf.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/16/87/07/b2229f6230690b1a7d54b23e43bfe64af43419c6/${_pkgname}_${pkgver}-1_amd64.deb")
noextract=("${source_armv7h[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums_armv7h=('8f4d19c2b524dadbed58a33245e1bc523a0ac125385d39329b74a6b4961d12dd')
sha256sums_x86_64=('551be3a649a48d7ae96e6307b1476a4db6b90885fa67af4ceacccf18f49f4227')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  if [ -d "usr" ]; then
    cp -vr --no-preserve=ownership "usr" "${pkgdir}"
  fi
  
  cd "opt/${_pkgname}"
  for dir in "cups/lib/filter" "lib/cups/filter"; do
    [ -d "${dir}" ] || continue
    find "${dir}" -type f -execdir \
      install -vDm755 "{}" "${pkgdir}/usr/lib/cups/filter/{}" \;
      # -exec patchelf --remove-rpath "{}" \; \
  done

  if [ -d "doc" ]; then
    find "doc" -type f -execdir \
      install -vDm644 "{}" "${pkgdir}/usr/share/doc/${_pkgname}/{}" \;
  fi

  for dir in "lib" "lib64"; do
    [ -d "${dir}" ] || continue
    find "${dir}" -maxdepth 1 -type f,l -execdir \
      cp -vP --preserve=mode,ownership "{}" "${pkgdir}/usr/lib/{}" \;
  done

  if [ -d "ppds" ]; then
    find "ppds" -type f -name '*.ppd' -execdir \
      install -Dm644 "{}" "${pkgdir}/usr/share/cups/model/${_pkgname}/{}" \;
  fi

  if [ -d "share" ]; then
    find "share" -type f -exec \
      install -Dm644 "{}" "${pkgdir}/usr/{}" \;
  fi

  cd "${pkgdir}/usr/share"
  find "cups" -type f -name '*.ppd' -exec \
    sed -e "s|/opt/${_pkgname}/cups/lib/filter/||g" \
        -e "s|/opt/${_pkgname}/lib/cups/filter/||g" \
        -i "{}" +

  cd "doc/${_pkgname}"
  rm -f ./*copyright* ./*Debian ./*INSTALL*

  find . -maxdepth 1 -type f \( -name '*COPYING*' -o -name '*LICENSE*' -o -name '*license*' \) \
    -execdir install -vDm644 "{}" "${pkgdir}/usr/share/licenses/${_pkgname}/{}" \; \
    -exec rm -f "{}" +
}
