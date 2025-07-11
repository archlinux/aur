# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-inkjet-printer-escpr2"
pkgname="${_pkgname}-bin"
pkgver=1.2.35
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
source_armv7h=("${_pkgsrc}-armv7h.deb::https://download3.ebz.epson.net/dsc/f/03/00/17/28/08/f9dfea2e12190e491f1d39919823e81a717c456f/${_pkgname}_${pkgver}_armhf.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/17/28/05/bf8a6f2e6fc386a4ed44d40c9747fb56d510f581/${_pkgname}_${pkgver}-1_amd64.deb")
noextract=("${source_armv7h[@]%%::*}"
           "${source_x86_64[@]%%::*}")
sha256sums_armv7h=('149b55ae9a9459298e4bb756c9de48fd4e33190b6e63f65f6b1702e5c1d4141e')
sha256sums_x86_64=('ed3623a3e9876ac673210d7820662de7178318a81c40271832ee1c0d81d3835b')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  find "${_pkgsrc}-${CARCH}" -type f -name '*.gz' -exec \
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
