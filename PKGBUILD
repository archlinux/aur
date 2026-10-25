# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='opensuse'
pkgname='libvirt-iso-opensuse-tumbleweed-bin'
pkgver=20261022
pkgrel=1
pkgdesc='Official openSUSE Tumbleweed network installation ISO for libvirt'
arch=('x86_64')
url='https://get.opensuse.org/tumbleweed/'
license=('LicenseRef-Various')
makedepends=('gnupg')
checkdepends=('libarchive')
_archive="openSUSE-Tumbleweed-NET-${CARCH}-Snapshot${pkgver}-Media.iso"
_iso="${_archive}"
_image="opensuse-tumbleweed-net-${pkgver}-${CARCH}.iso"
_link="opensuse-tumbleweed-net-${CARCH}.iso"
_base_url="https://download.opensuse.org/tumbleweed/iso"
_checksum="${_archive}.sha256"
source=(
	"${_archive}::${_base_url}/${_archive}"
	"${_checksum}::${_base_url}/${_archive}.sha256"
	"${_checksum}.signature::${_base_url}/${_archive}.sha256.asc"
	"opensuse-release-key.pubkey::https://download.opensuse.org/tumbleweed/repo/oss/repodata/repomd.xml.key"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_archive}")
sha256sums=(
	'b5aa7b9e37433ae37734e99e060c45a1ad2f87413179a21ab487602e3ed3cad9'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
b2sums=(
	'SKIP'
	'24c48d6af8f81a88b3544716073348d2bce97fec587977aee0b97106b007e14c08bd6a3dcbee877c692b8d1835ab1893b23121750d896a467197645f22458b61'
	'3f192b37fb0dcf42ae10140aaf03e90d56159bc9ef9efe499406fb4685b2bf246a00cff3d706172be49c4fb99e91ad94f10f1e74743d8b0b35b62f4ff11ce457'
	'00068f63d84268ff073b3b02071d249243057e34004e86cab13b55837f78eab178dce238bd33a3e5dfffc069fbee9330a9257d9f4de9563180f13349fd1d59e4'
	'4dccb397a48d320e2cdf0ac31d68426bbff1ff2f65e0d464ea77b4a809eb59be038eb81d4cdc67596dee0f49c63a84d735bd4da13626a8dfed771bc44c0a9423'
)
validpgpkeys=('AD485664E901B867051AB15F35A2F86E29B700A4')


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
	_verify_pinned_key "${srcdir}/opensuse-release-key.pubkey" 'AD485664E901B867051AB15F35A2F86E29B700A4' || return 1
	gpgv --keyring "${srcdir}/release-key.gpg" \
		"${srcdir}/${_checksum}.signature" "${srcdir}/${_checksum}" || return 1
	grep -Fxq "${sha256sums[0]}  ${_archive}" "${srcdir}/${_checksum}"
}


check() {
	local iso="${srcdir}/${_iso}"
	local size
	local magic
	local entry
	local media
	local products

	size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( size > 0 && size % 2048 == 0 )) || return 1
	magic="$(dd if="${iso}" bs=1 skip=32769 count=5 status=none)" || return 1
	[[ "${magic}" == 'CD001' ]] || return 1
	file -L --brief -- "${iso}" | grep -Fq 'ISO 9660' || return 1
	bsdtar -tf "${iso}" > "${srcdir}/check-iso-list" || return 1
	for entry in \
		"boot/${CARCH}/loader/linux" \
		"boot/${CARCH}/loader/initrd" \
		"boot/${CARCH}/loader/isolinux.bin" \
		'EFI/BOOT/bootx64.efi' \
		'media.1/media' \
		'media.1/products'; do
		grep -Fxq "${entry}" "${srcdir}/check-iso-list" || return 1
	done

	media="$(bsdtar -xOf "${iso}" 'media.1/media')" || return 1
	grep -Eq "^openSUSE - openSUSE-Tumbleweed-NET-${CARCH}-Build[[:alnum:]._-]+-Media$" <<< "${media}" || return 1
	products="$(bsdtar -xOf "${iso}" 'media.1/products')" || return 1
	grep -Fxq "/ openSUSE ${pkgver}-0" <<< "${products}" || return 1
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
