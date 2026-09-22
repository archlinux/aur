# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='cachyos'
_profile='desktop'
pkgname="libvirt-iso-${_pkgname}-bin"
pkgver=260809
pkgrel=1
pkgdesc='Official CachyOS desktop installation ISO for libvirt'
arch=('x86_64')
url='https://cachyos.org/'
license=('LicenseRef-Various')
checkdepends=(
	'libarchive'
	'squashfs-tools'
)
_iso="${_pkgname}-${_profile}-linux-${pkgver}.iso"
_base_url='https://cdn77.cachyos.org/ISO'
source=(
	"${_iso}::${_base_url}/${_profile}/${pkgver}/${_iso}"
	"${_iso}.sig::${_base_url}/${_profile}/${pkgver}/${_iso}.sig"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_iso}")
sha256sums=(
	'959f6577f45e25ee9fd8c220fd221b08e4ea79412c7315c0f922dd6d86d5e33c'
	'SKIP'
	'360daceb5db049402207e21a780c03c0695947a06a02ee9da195afe4ccc258cd'
)
validpgpkeys=('882DCFE48E2051D48E2562ABF3B607488DB35A47')

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
	[[ -z "$(find "${root}" -name '*.sig' -print -quit)" ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_iso}" \
		"var/lib/libvirt/images/${_pkgname}-${CARCH}.iso")" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

check() {
	local iso="${srcdir}/${_iso}"
	local iso_listing="${srcdir}/check-iso-list"
	local squashfs="${srcdir}/check-airootfs.sfs"
	local squashfs_hash_file="${srcdir}/check-airootfs.sha512"
	local squashfs_root="${srcdir}/check-squashfs-root"
	local package_root="${srcdir}/check-package-root"
	local image_size
	local pvd_type
	local pvd_magic
	local pvd_version
	local volume_sectors
	local expected_version
	local actual_version
	local expected_squashfs_hash
	local expected_squashfs_name
	local actual_squashfs_hash
	local required_path

	printf '%s\n' 'check: ISO size and ISO9660 header'
	image_size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( image_size > 0 && image_size % 2048 == 0 )) || return 1

	pvd_type="$(od -An -tu1 -j $((16 * 2048)) -N1 -- "${iso}" | tr -d ' ')" || return 1
	pvd_magic="$(dd if="${iso}" bs=1 skip=$((16 * 2048 + 1)) count=5 status=none)" || return 1
	pvd_version="$(od -An -tu1 -j $((16 * 2048 + 6)) -N1 -- "${iso}" | tr -d ' ')" || return 1
	volume_sectors="$(od -An -tu4 -j $((16 * 2048 + 80)) -N4 -- "${iso}" | tr -d ' ')" || return 1

	[[ "${pvd_type}" == '1' ]] || return 1
	[[ "${pvd_magic}" == 'CD001' ]] || return 1
	[[ "${pvd_version}" == '1' ]] || return 1
	(( volume_sectors > 0 && volume_sectors * 2048 == image_size )) || return 1

	printf '%s\n' 'check: file(1) ISO and bootability'
	file -L --brief -- "${iso}" | grep -Fq 'ISO 9660' || return 1
	file -L --brief -- "${iso}" | grep -Fq 'bootable' || return 1

	printf '%s\n' 'check: ISO directory and required CachyOS files'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for required_path in \
		"arch/boot/${CARCH}/vmlinuz-linux-cachyos" \
		"arch/boot/${CARCH}/initramfs-linux-cachyos.img" \
		"arch/${CARCH}/airootfs.sfs" \
		"arch/${CARCH}/airootfs.sha512" \
		'arch/pkglist.x86_64.txt' \
		'arch/version' \
		'EFI/BOOT/BOOTx64.EFI'; do
		grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
	done

	expected_version="20${pkgver:0:2}.${pkgver:2:2}.${pkgver:4:2}"
	actual_version="$(bsdtar -xOf "${iso}" arch/version)" || return 1
	[[ "${actual_version}" == "${expected_version}" ]] || return 1

	printf '%s\n' 'check: full ISO read'
	bsdtar -xOf "${iso}" > /dev/null || return 1

	printf '%s\n' 'check: SquashFS checksum and full decompression'
	bsdtar -xOf "${iso}" "arch/${CARCH}/airootfs.sha512" > "${squashfs_hash_file}" || return 1
	read -r expected_squashfs_hash expected_squashfs_name < "${squashfs_hash_file}" || return 1
	[[ "${expected_squashfs_hash}" =~ ^[0-9a-f]{128}$ ]] || return 1
	[[ "${expected_squashfs_name}" == 'airootfs.sfs' ]] || return 1

	bsdtar -xOf "${iso}" "arch/${CARCH}/airootfs.sfs" > "${squashfs}" || return 1
	actual_squashfs_hash="$(sha512sum -- "${squashfs}" | awk '{print $1}')" || return 1
	[[ "${actual_squashfs_hash}" == "${expected_squashfs_hash}" ]] || return 1

	rm -rf -- "${squashfs_root}"
	unsquashfs -no-xattrs -d "${squashfs_root}" "${squashfs}" > /dev/null || return 1
	[[ -f "${squashfs_root}/usr/lib/os-release" ]] || return 1
	[[ "$(cat -- "${squashfs_root}/etc/version-tag")" == "${pkgver}" ]] || return 1
	[[ "$(cat -- "${squashfs_root}/etc/edition-tag")" == "${_profile}" ]] || return 1

	printf '%s\n' 'check: staged package payload'
	rm -rf -- "${package_root}"
	_install_payload "${package_root}"
	_check_payload "${package_root}"
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
