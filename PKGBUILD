# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='supermicro-update-manager'
_pkgname='sum'
pkgver='2.14.0'
_pkgver_aarch64='692'
_pkgver_x86_64='698'
_pkgdate='20240215'
pkgrel='2'
pkgdesc='Supermicro Update Manager is used for managing and configuring the BIOS/BMC firmware'
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'zlib')
_uri='https://www.supermicro.com'
url="${_uri}/en/solutions/management-software/${pkgname}"
license=('custom: EULA')
source=("${_uri}/Bios/sw_download/${_pkgver_x86_64}/${_pkgname}_${pkgver}_Linux_x86_64_${_pkgdate}.tar.gz"
	"${_uri}/Bios/sw_download/${_pkgver_aarch64}/${_pkgname}_${pkgver}_Linux_arm64_${_pkgdate}.tar.gz")
sha256sums=('79cf26203493bb6a5b64fc508d9696151f89e08b79120a582d337bd5aae6c0a1'
            '30fb55410cbb0d64bad8c61d54f40a3976bbe47c74d35db9db73bc5c0be5b091')
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
