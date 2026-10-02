# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='kde-linux'
pkgname="libvirt-iso-${_pkgname}-bin"
pkgver=202610020254
pkgrel=1
pkgdesc='Official KDE Linux Testing installation ISO for libvirt (weekly updated!)'
arch=('x86_64')
url='https://linux.kde.org/'
license=('LicenseRef-Various')
checkdepends=(
	'7zip'
	'gptfdisk'
	'mtools'
)
_iso="${_pkgname}_${pkgver}.iso"
_base_url='https://files.kde.org/kde-linux'

# KDE publishes SHA256SUMS.gpg, but not the public key required to verify it.
# Their impressively decorative signature has been documented here:
# https://invent.kde.org/kde-linux/kde-linux/-/issues/223
#
# If KDE ever finds its public key again, uncomment the quoted lines below to
# restore signature verification. The signed SHA256SUMS is then tied back to
# the pinned ISO digest in check(). Keep this disabled until the key is actually
# obtainable; SHA256SUMS is also rolling, so old package versions depend on KDE
# retaining the selected ISO entry there.
source=(
	"${_iso}::${_base_url}/${_iso}"
	'DISTRIBUTION-LICENSE'
#	"SHA256SUMS::${_base_url}/SHA256SUMS"
#	"SHA256SUMS.sig::${_base_url}/SHA256SUMS.gpg"
)
noextract=("${_iso}")
sha256sums=(
	'c7f6b0a872ff2efd75541e3cf99cc287b50c59f926237fa04efa34532c1bddc5'
	'9280ddacc03cb58f09b31483a06dba9216a0cfde2fe53091ff571504c4095160'
#	'SKIP'
#	'SKIP'
)
# validpgpkeys=('15AB3EE61CE450CFED1407BF4121B5F4EAEB53CA')

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${_iso}" "${image_dir}/${_iso}"
	ln -s -- "${_iso}" "${image_dir}/${_pkgname}-${CARCH}.iso"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_iso}"
	local image_link="${root}/var/lib/libvirt/images/${_pkgname}-${CARCH}.iso"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" ]] || return 1
	[[ -L "${image_link}" ]] || return 1
	[[ "$(readlink -- "${image_link}")" == "${_iso}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '644' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | LC_ALL=C sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_iso}" \
		"var/lib/libvirt/images/${_pkgname}-${CARCH}.iso" | LC_ALL=C sort)" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

_partition_start() {
	local iso="${1:?missing ISO path}"
	local partition="${2:?missing partition number}"
	local start

	start="$(LC_ALL=C sgdisk -i "${partition}" "${iso}" |
		sed -n 's/^First sector: \([0-9][0-9]*\).*/\1/p')" || return 1
	[[ "${start}" =~ ^[0-9]+$ ]] || return 1
	(( start > 0 )) || return 1
	printf '%s\n' "${start}"
}

_check_partition() {
	local iso="${1:?missing ISO path}"
	local partition="${2:?missing partition number}"
	local type_guid="${3:?missing type GUID}"
	local name="${4:?missing partition name}"
	local info

	info="$(LC_ALL=C sgdisk -i "${partition}" "${iso}")" || return 1
	grep -Fq "Partition GUID code: ${type_guid} " <<< "${info}" || return 1
	grep -Fq "Partition name: '${name}'" <<< "${info}" || return 1
}

check() {
	local iso="${srcdir}/${_iso}"
#	grep -Fxq "${sha256sums[0]}  ${_iso}" "${srcdir}/SHA256SUMS" || return 1
	local esp_boot="${srcdir}/check-BOOTX64.EFI"
	local partition_head="${srcdir}/check-partition-head"
	local image_size
	local image_description
	local gpt_report
	local partition_count
	local esp_start
	local root_start
	local extension_start

	printf '%s\n' 'check: ISO identity and bootability'
	image_size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( image_size > 0 && image_size % 2048 == 0 )) || return 1
	image_description="$(file -L --brief -- "${iso}")" || return 1
	grep -Fq 'ISO 9660 CD-ROM filesystem data' <<< "${image_description}" || return 1
	grep -Fq "'KDE LINUX ${pkgver}'" <<< "${image_description}" || return 1
	grep -Fq '(bootable)' <<< "${image_description}" || return 1

	printf '%s\n' 'check: GPT integrity and KDE Linux partition contract'
	gpt_report="$(LC_ALL=C sgdisk -v "${iso}")" || return 1
	grep -Fq 'No problems found.' <<< "${gpt_report}" || return 1
	partition_count="$(LC_ALL=C sgdisk -p "${iso}" |
		awk '/^[[:space:]]*[0-9]+[[:space:]]/ {count++} END {print count + 0}')" || return 1
	[[ "${partition_count}" == '3' ]] || return 1

	_check_partition "${iso}" 1 'C12A7328-F81F-11D2-BA4B-00A0C93EC93B' 'esp'
	_check_partition "${iso}" 2 '4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709' 'KDELinuxLive'
	_check_partition "${iso}" 3 '0FC63DAF-8483-4772-8E79-3D69D8477DE4' 'KDELinuxLiveExt'

	esp_start="$(_partition_start "${iso}" 1)" || return 1
	root_start="$(_partition_start "${iso}" 2)" || return 1
	extension_start="$(_partition_start "${iso}" 3)" || return 1

	printf '%s\n' 'check: EFI system partition and x86-64 bootloader'
	mdir -i "${iso}@@$((esp_start * 512))" ::/EFI/BOOT/BOOTX64.EFI > /dev/null || return 1
	rm -f -- "${esp_boot}"
	mcopy -i "${iso}@@$((esp_start * 512))" ::/EFI/BOOT/BOOTX64.EFI "${esp_boot}" || return 1
	file -L --brief -- "${esp_boot}" | grep -Fq 'PE32+ executable for EFI (application), x86-64' || return 1

	printf '%s\n' 'check: EROFS system partitions'
	for root_start in "${root_start}" "${extension_start}"; do
		dd if="${iso}" of="${partition_head}" bs=512 skip="${root_start}" count=8192 status=none || return 1
		file -L --brief -- "${partition_head}" | grep -Fq 'EROFS filesystem' || return 1
	done
	rm -f -- "${partition_head}" "${esp_boot}"

	printf '%s\n' 'check: full ISO filesystem traversal'
	7z t -bd -bb0 -- "${iso}" > /dev/null || return 1
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
