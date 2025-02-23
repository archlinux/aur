# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-inkjet-printer-escpr2"
pkgname="${_pkgname}-bin"
pkgver=1.2.26
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
noextract=("${_pkgsrc}-"{armv7h,x86_64}".deb")
source_armv7h=("${_pkgsrc}-armv7h.deb::https://download3.ebz.epson.net/dsc/f/03/00/16/65/07/9ab7728e10dfcfe49ba5d339ed4b275bd8e1bd49/${_pkgname}_${pkgver}_armhf.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/16/65/04/32d8b35d3868ac14fe4f67e297e6ddf5aa2e27cf/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_armv7h=('e741e8dbc15a28a65f4dc2a3ca104cd64b4800a7856705bc297c90bfa48298aa')
sha256sums_x86_64=('39cedca9fb7bcf912a425f41e81ba665c1ffcac14eb043f3da96c40f4c9c9d88')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/opt/${_pkgname}"
  if [ -d "cups/lib" ]; then
    find "cups/lib" -type f \
      -execdir install -Dm755 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/lib/cups/filter/{}" \;
      # -exec patchelf --remove-rpath "{}" \; \
  fi
  if [ -d "lib/cups" ]; then
    find "lib/cups" -type f \
      -execdir install -Dm755 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/lib/cups/filter/{}" \;
      # -exec patchelf --remove-rpath "{}" \; \
  fi

  if [ -d "doc" ]; then
    find "doc" -type f -execdir \
      install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}/{}" \;
  fi

  if [ -d "lib" ]; then
    find "lib"   -maxdepth 1 -type f,l -execdir \
      cp -P --preserve=mode,ownership "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/lib/{}" \;
  fi
  if [ -d "lib64" ]; then
    find "lib64" -maxdepth 1 -type f,l -execdir \
      cp -P --preserve=mode,ownership "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/lib/{}" \;
  fi

  if [ -d "ppds" ]; then
    find "ppds" -type f -execdir \
      install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/cups/model/${_pkgname}/{}" \;
  fi

  if [ -d "share" ]; then
    find "share" -type f -exec \
      install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/{}" \;
  fi

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -rf "opt"

  cd "usr/share"
  find "cups" -type f -name '*.ppd' -exec \
    sed -e "s|/opt/${_pkgname}/cups/lib/filter/||g" \
        -e "s|/opt/${_pkgname}/lib/cups/filter/||g" \
        -i "{}" +

  cd "doc/${_pkgname}"
  rm -f "copyright"
  find . -maxdepth 1 -type f \( -name '*COPYING*' -o -name '*LICENSE*' -o -name '*license*' \) \
    -execdir install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/licenses/${_pkgname}/{}" \; \
    -exec rm "{}" +
  # find . -maxdepth 1 -type f \
  #   -execdir install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}/{}" \; \
  #   -exec rm "{}" +
}

package() {
  cd "${srcdir}"
  cp -r --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
}
