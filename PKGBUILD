# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-inkjet-printer-escpr2"
pkgname="${_pkgname}-bin"
pkgver=1.2.37
pkgrel=1
pkgdesc="Epson inkjet printer driver 2 (ESC/P-R) used with CUPS"
arch=(
  'armv7h'
  'x86_64'
)
url="https://download.ebz.epson.net/man/linux/escpr2.html"
license=(
  'LGPL-2.1-or-later'
  'custom:Epson End User Software License Agreement'
)
depends=(
  'cups'
  'glibc'
  'libcups'
)
provides=(
  "${_pkgname}"
  'libescpr2.so'
)
conflicts=(
  "${_pkgname}"
)
makedepends=(
  'gzip'
  # 'patchelf'
)
_pkgsrc="${_pkgname}-${pkgver}"
source_armv7h=(
  # curl -sSL 'https://download-center.epson.com/api/v1/modules/?device_id=XP-970%20Series&os=DEBARM32&region=US&language=en' |
  #   jq -r '.items[] | select(.module_name == "Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux" and .cti_category == "Drivers")'
  "${_pkgsrc}-armv7h.deb::https://download-center.epson.com/f/module/ed611ece-addd-4194-8142-8915c2214a18/${_pkgname}_${pkgver}_armhf.deb"
)
source_x86_64=(
  # curl -sSL 'https://download-center.epson.com/api/v1/modules/?device_id=XP-970%20Series&os=DEBX64&region=US&language=en' |
  #   jq -r '.items[] | select(.module_name == "Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux" and .cti_category == "Drivers")'
  "${_pkgsrc}-x86_64.deb::https://download-center.epson.com/f/module/3b192413-573d-4178-bdfb-bac1f94d1b4b/${_pkgname}_${pkgver}-1_amd64.deb"
)
noextract=(
  "${source_armv7h[@]%%::*}"
  "${source_x86_64[@]%%::*}"
)
sha256sums_armv7h=('c3cfd58632c9f9f9ccdda061b3a0c7dee465a056b0b5677c5f1be1a8a819534d')
sha256sums_x86_64=('a020dd2ba95aff1ce8276373d940966bfacfeb9f9bff397cc4408c7bc781fbf3')
# DLAGENTS+=(
#   'https::/usr/bin/curl -A "Mozilla" -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u'
# )

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
    cp -va --no-preserve=ownership "usr" "${pkgdir}"
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
      cp -va --preserve=mode,ownership "{}" "${pkgdir}/usr/lib/{}" \;
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
