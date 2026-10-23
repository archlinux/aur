# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='alpine'
_flavor='virt'
_series='v3.24'
pkgname="libvirt-iso-${_pkgname}-${_flavor}-bin"
pkgver=3.24.3
pkgrel=1
pkgdesc='Official Alpine Linux virtualization ISO for libvirt'
arch=('x86_64')
url='https://www.alpinelinux.org/downloads/'
license=('LicenseRef-Various')
makedepends=('gnupg')
checkdepends=('libarchive')
_iso="${_pkgname}-${_flavor}-${pkgver}-${CARCH}.iso"
_image="${_pkgname}-${_flavor}-${pkgver}-${CARCH}.iso"
_link="${_pkgname}-${_flavor}-${CARCH}.iso"
_base_url="https://dl-cdn.alpinelinux.org/alpine/${_series}/releases/${CARCH}"
source=(
	"${_iso}::${_base_url}/${_iso}"
	"${_iso}.signature::${_base_url}/${_iso}.asc"
	'alpine-release-key.pubkey::https://www.alpinelinux.org/keys/ncopa.asc'
	'DISTRIBUTION-LICENSE'
)
noextract=("${_iso}")
sha512sums=(
	'8dcb83380f5c53178142eb9470fc78aae80c60df03bb85b16434e1cd338c27782252171f5f23763d04295afc89a2738e24e70290dc2479ccc41c6c47db54962d'
	'SKIP'
	'SKIP'
	'SKIP'
)
b2sums=(
	'SKIP'
	'df2166f5bb3da6b2046772d7e71bb56d1bc63ff96e66c8bb48fc0fb517ccdaf91b590cbe5e0be9c85fbb7892d8d599f7528d5d6890dd275d4e5362a9cde80e22'
	'a0df34a1645d2c21a80dff3776a53fe8b71d1daae06f11fa6f0f5446a496caa42b4d5c2365d5b6f8efcc2460f9c3182c77f0204783ff45cba43201c18ae12057'
	'6ca732810a034a28e8297a022a7bbcef378ce5534c21d772bed0fe1668046df0594e2c6c66638efd23a894eb59990c6ed34c10e4f7653ceb25f2b9843365b8b7'
)
validpgpkeys=('0482D84022F52DF1C4E7CD43293ACD0907D9495A')

prepare() {
	local fingerprint

	fingerprint="$(gpg --batch --show-keys --with-colons "${srcdir}/alpine-release-key.pubkey" |
		awk -F: '$1 == "fpr" {print $10; exit}')" || return 1
	[[ "${fingerprint}" == '0482D84022F52DF1C4E7CD43293ACD0907D9495A' ]] || return 1
	gpg --batch --yes --dearmor --output "${srcdir}/release-key.gpg" \
		"${srcdir}/alpine-release-key.pubkey" || return 1
	gpgv --keyring "${srcdir}/release-key.gpg" \
		"${srcdir}/${_iso}.signature" "${srcdir}/${_iso}"
}

check() {
	local iso="${srcdir}/${_iso}"
	local size
	local magic

	size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( size > 0 && size % 2048 == 0 )) || return 1
	magic="$(dd if="${iso}" bs=1 skip=32769 count=5 status=none)" || return 1
	[[ "${magic}" == 'CD001' ]] || return 1
	file -L --brief -- "${iso}" | grep -Fq 'ISO 9660' || return 1
	bsdtar -tf "${iso}" > "${srcdir}/check-iso-list" || return 1
	grep -Fxq 'boot/syslinux/isolinux.bin' "${srcdir}/check-iso-list" || return 1
	grep -Fxq 'boot/vmlinuz-virt' "${srcdir}/check-iso-list" || return 1
	grep -Fxq 'boot/initramfs-virt' "${srcdir}/check-iso-list" || return 1
	grep -Fxq 'efi/boot/bootx64.efi' "${srcdir}/check-iso-list" || return 1
	local release
	release="$(bsdtar -xOf "${iso}" .alpine-release)" || return 1
	[[ "${release}" == "alpine-virt-${pkgver} "* ]] || return 1
	[[ "${release##* }" =~ ^[0-9]{6}$ ]] || return 1
	bsdtar -xOf "${iso}" > /dev/null || return 1
}

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${_iso}" "${image_dir}/${_image}" || return 1
	ln -s -- "${_image}" "${image_dir}/${_link}" || return 1
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_image}"
	local link_path="${root}/var/lib/libvirt/images/${_link}"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" && ! -L "${image_path}" ]] || return 1
	[[ -L "${link_path}" ]] || return 1
	[[ "$(readlink -- "${link_path}")" == "${_image}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '644' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1
	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | LC_ALL=C sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_image}" \
		"var/lib/libvirt/images/${_link}" | LC_ALL=C sort)" ]] || return 1
	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${link_path}")" == '0:0' ]] || return 1
	fi
}

package() {
	_install_payload "${pkgdir}" || return 1
	_check_payload "${pkgdir}" true
}
