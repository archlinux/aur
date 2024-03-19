# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
_pkgrel='26273'
pkgver="4.16.00.${_pkgrel}"
_rpmver="4.16-${_pkgrel}"
pkgrel='2'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://storage.microsemi.com/en-us/support'
license=('custom')
source=("https://download.adaptec.com/raid/storage_manager/${pkgname}_B${_pkgrel}.zip"
	"https://download.adaptec.com/raid/storage_manager/${pkgname}_v3_07_23980.zip")
sha256sums=('0680ee9b4f9371fb1901f842af0814ba71a694ef39a4e8bac3f325994c400425'
            '27beeaff6e51f2aa8292ff3f31c3774011468ccba1483755e056f2a82db012d1')

_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "linux_x64/rpm" || echo -n "linuxarm_x64/rpm")
# The legacy is version of software for HBA1000 Adaptec controlles and older (the 'aacraid' linux driver)
# The 'current' version support HBA1100 Microsemi controllers and higher (the 'smartpqi' linux driver)
_archstr_legacy=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${_archstr}" || echo -n "linux_x64/arm/rpm")

prepare() {
  mkdir "${pkgname}_${_pkgrel}" "${pkgname}_legacy"
  bsdtar xf "linux/${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm" -C "${pkgname}_${_pkgrel}"
  bsdtar xf "${_archstr_legacy}/${_pkgname}-3.07-23980.${CARCH}.rpm" -C "${pkgname}_legacy"
}

package() {
  install -Dm0755 "${pkgname}_${_pkgrel}/usr/${_pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}_${_pkgrel}/usr/${_pkgname}/License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm0755 "${pkgname}_legacy/usr/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-legacy"
}
