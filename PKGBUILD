# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="epson-pc-fax"
pkgname="${_pkgname}-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=('x86_64')
url="https://download.ebz.epson.net/man/linux/pc-fax_e.html"
license=('custom:Epson End User Software License Agreement' 'LGPL-2.1-or-later'
         'MIT')
depends=('cups' 'gcc-libs' 'glibc' 'libcups')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgname}-MANUAL.en.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/72/99/5eddaa38be4b45c881c279fa8b57990f6dced116/pc-fax_e.pdf"
        "${_pkgname}-MANUAL.jp.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/72/99/abcfe101ac9c0b1d5b9e53088e6bd428a529d4cd/pc-fax_j.pdf")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/16/72/91/2f2b533c9f2d7b83d863d45f5d15fdf66dac8b79/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('33b132592515734e844a2da08ebd31500fe75d726609270836b37f6904833812'
            'e451e6940b5f90b3e053eb3dc06b0369563f623dfd1f4f54afff9fcce1840742')
sha256sums_x86_64=('c68e5e3cd6e4800212df329326a4f524f2d7c1a61a253be4030e7d25431a2a26')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "opt/${_pkgname}"
  find "ppds" -type f -name '*.ppd' -execdir \
    install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/cups/model/${_pkgname}/{}" \;
  rm -rf "ppds"

  find "doc" -type f \( -name '*LICENSE*' -o -name '*COPYING*' -o -name '*license*' \) \
    -execdir install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/licenses/${_pkgname}/{}" \; \
    -exec rm "{}" +
  find "doc" -type f -execdir \
    install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}/{}" \;
  rm -rf "doc"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgname}-MANUAL.en.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.en.pdf"
  install -vDm644 "${_pkgname}-MANUAL.jp.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.jp.pdf"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/bin/epfax" "${pkgdir}/usr/bin/epfax"
}
