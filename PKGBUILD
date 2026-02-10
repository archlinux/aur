# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='superserver-automation-assistant'
_pkgname='saa'
pkgver='1.4.0'
_pkgver_aarch64='1010'
_pkgver_x86_64='1007'
_pkgdate='20251022'
pkgrel='1'
pkgdesc='SuperServer Automation Assistant is used for managing and configuring the BIOS/BMC firmware'
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'zlib' 'acpica')
_uri='https://www.supermicro.com'
url="${_uri}/en/solutions/management-software/${pkgname}"
license=('custom: EULA')
source=("${_uri}/Bios/sw_download/${_pkgver_x86_64}/${_pkgname}_${pkgver}_Linux_x86_64_${_pkgdate}.tar.gz"
	"${_uri}/Bios/sw_download/${_pkgver_aarch64}/${_pkgname}_${pkgver}_Linux_arm64_${_pkgdate}.tar.gz")
sha256sums=('fb047601c4d92c9046dd9db9ba3715d10d8fa8ec8ee73d97722dffefa459757c'
            'b98c1e7ab9cf1b5422b2d858db56aa9d764bf79627477fcfcf73c6a364000f11')
backup=("etc/${_pkgname}rc")

_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "${CARCH}" || echo -n "arm64")

prepare() {
  cd "${_pkgname}_${pkgver}_Linux_${_archstr}"
  sed -i 's|#journal_path = /home/administrator/journal/supermicro/test|journal_path = /var/log/'"${pkgname}"'|g' \
"${_pkgname}rc.sample"
}

package() {
  cd "${_pkgname}_${pkgver}_Linux_${_archstr}"
  install -Dm0644 "${_pkgname}rc.sample" "${pkgdir}/etc/${_pkgname}rc"
  install -Dm0644 "ReleaseNote.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 -d "${pkgdir}/var/log/${pkgname}"
}
