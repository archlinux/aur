# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='supermicro-update-manager'
_pkgname='sum'
pkgver='2.15.0'
_pkgver_aarch64='1020'
_pkgver_x86_64='1026'
_pkgdate='20251104'
pkgrel='1'
pkgdesc='Supermicro Update Manager is used for managing and configuring the BIOS/BMC firmware'
arch=('x86_64' 'aarch64')
depends=('gcc-libs' 'zlib')
_uri='https://www.supermicro.com'
url="${_uri}/en/solutions/management-software/${pkgname}"
license=('custom: EULA')
source=("${_uri}/Bios/sw_download/${_pkgver_x86_64}/${_pkgname}_${pkgver}_Linux_x86_64_${_pkgdate}.tar.gz"
	"${_uri}/Bios/sw_download/${_pkgver_aarch64}/${_pkgname}_${pkgver}_Linux_arm64_${_pkgdate}.tar.gz")
sha256sums=('6d19460eba5e69cfd23797807c3821e38739c3d26220a6c40dc6a243893483e2'
            'bf49c20e44ee2ee32d84126d0d2848110f24ded69c82cc28620e1dac1348a390')
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
