# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='systemrescue'
pkgname='libvirt-iso-systemrescue-bin'
pkgver=13.02
pkgrel=1
pkgdesc='Official SystemRescue live recovery ISO for libvirt'
arch=('x86_64')
url='https://www.system-rescue.org/'
license=('LicenseRef-Various')
makedepends=('gnupg')
checkdepends=('libarchive')
_archive="${_pkgname}-${pkgver}-amd64.iso"
_iso="${_archive}"
_image="${_pkgname}-${pkgver}-${CARCH}.iso"
_link="${_pkgname}-${CARCH}.iso"
_base_url="https://fastly-cdn.system-rescue.org/releases/${pkgver}"
source=(
	"${_archive}::${_base_url}/${_archive}"
	"${_archive}.signature::https://www.system-rescue.org/releases/${pkgver}/${_archive}.asc"
	"systemrescue-release-key.pem::https://www.system-rescue.org/security/signing-keys/gnupg-pubkey-fdupoux-20210704-v001.pem"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_archive}")
sha512sums=(
	'76bd250b478cbfedf407c721a79270b1615f26ec486dbd7c8b78d7e1034853f2c31cc664752dce1678485bb1e7045167e5114802d5e28a84d29481854f8854b8'
	'SKIP'
	'SKIP'
	'SKIP'
)
b2sums=(
	'SKIP'
	'1709f92610b9a2e2e20d7232065b2792036791ef2163c45b1f656eb783772b85bcadaa4cb875e4e7c8719acb7070450496c2454184e69af29353eefb9cefe639'
	'a842fdcf8944a0d064e9b21f103ba3b29c74f9ab2024aa064b9ea2573b5329dc67e770a89154e6086e2e3dccd5fa4b809c24072ea079672f663b3b13f71c585f'
	'49664b7a5aefd8e40cb9c41ea8d28d9df61d2d04067eeca446a24b6f6c6658eddcd87458cd3c9b58def7cd7aa80a35992217a8de12f37bb022785db1d11af445'
)
validpgpkeys=('0FF11AF081E98345594812037091115F8320B897')


_verify_pinned_key() {
	local key_file="${1:?missing signing key}"
	local expected="${2:?missing signing fingerprint}"
	local fingerprint

	fingerprint="$(gpg --batch --show-keys --with-colons "${key_file}" |
		awk -F: '$1 == "fpr" {print $10; exit}')" || return 1
	[[ "${fingerprint}" == "${expected}" ]] || return 1
	gpg --batch --yes --dearmor --output "${srcdir}/release-key.gpg" "${key_file}"
}

prepare() {
	_verify_pinned_key "${srcdir}/systemrescue-release-key.pem" '0FF11AF081E98345594812037091115F8320B897' || return 1
	gpgv --keyring "${srcdir}/release-key.gpg" \
		"${srcdir}/${_archive}.signature" "${srcdir}/${_archive}"
}


check() {
	local iso="${srcdir}/${_iso}"
	local size
	local magic
	local entry
	local release
	local image_info

	size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( size > 0 && size % 2048 == 0 )) || return 1
	magic="$(dd if="${iso}" bs=1 skip=32769 count=5 status=none)" || return 1
	[[ "${magic}" == 'CD001' ]] || return 1
	file -L --brief -- "${iso}" | grep -Fq 'ISO 9660' || return 1
	bsdtar -tf "${iso}" > "${srcdir}/check-iso-list" || return 1
	for entry in \
		'isolinux/isolinux.bin' \
		'EFI/boot/bootx64.efi' \
		'sysresccd/boot/x86_64/vmlinuz' \
		'sysresccd/boot/x86_64/sysresccd.img' \
		'sysresccd/x86_64/airootfs.sfs'; do
		grep -Fxq "${entry}" "${srcdir}/check-iso-list" || return 1
	done

	release="$(bsdtar -xOf "${iso}" 'sysresccd/VERSION')" || return 1
	[[ "${release}" == "${pkgver}" ]] || return 1
	image_info="$(bsdtar -xOf "${iso}" 'sysresccd/.imageinfo')" || return 1
	grep -Fxq 'NAME=SystemRescue' <<< "${image_info}" || return 1
	grep -Fxq "VERSION=${pkgver}" <<< "${image_info}" || return 1
	grep -Fxq "ARCH=${CARCH}" <<< "${image_info}" || return 1
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
