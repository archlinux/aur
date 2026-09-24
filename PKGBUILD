# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='endeavouros'
_release_name='Titan-Nova'
pkgname="libvirt-iso-${_pkgname}-bin"
pkgver=2026.08.15
pkgrel=1
pkgdesc='Official EndeavourOS installation ISO for libvirt'
arch=('x86_64')
url='https://endeavouros.com/'
license=('LicenseRef-Various')
checkdepends=(
	'libarchive'
	'squashfs-tools'
)
_iso="EndeavourOS_${_release_name}-${pkgver}.iso"
_base_url='https://mirror.moson.org/endeavouros/iso'
source=(
	"${_iso}::${_base_url}/${_iso}"
	"${_iso}.sig::${_base_url}/${_iso}.sig"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_iso}")
sha512sums=(
	'3f83bd745e9d5d518bdf6fc9a24092fb5347da449a6e109c6572bf999097b8b548c4cf1848fdfb3c7c2823f558c3f5b51a127060d9c5b81b9ad89b4041bee7fa'
	'SKIP'
	'e9646093ab4151048815230efa2de326f2fc932e7e5704bb1c08aa1ca29aa70107221c5e803ff7bbcf84fca2e0b7be47dc6c144b021cdbf0f898fb3ce64bc152'
)
validpgpkeys=('8F43FC374CD4CEEA19CEE323E3D8752ACDF595A1')

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

	printf '%s\n' 'check: ISO directory and required EndeavourOS files'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for required_path in \
		"arch/boot/${CARCH}/vmlinuz-linux" \
		"arch/boot/${CARCH}/initramfs-linux.img" \
		"arch/${CARCH}/airootfs.sfs" \
		"arch/${CARCH}/airootfs.sha512" \
		'arch/pkglist.x86_64.txt' \
		'arch/version' \
		'EFI/BOOT/BOOTx64.EFI'; do
		grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
	done

	actual_version="$(bsdtar -xOf "${iso}" arch/version)" || return 1
	[[ "${actual_version}" == "${pkgver}" ]] || return 1

	printf '%s\n' 'check: full ISO read'
	bsdtar -xOf "${iso}" > /dev/null || return 1

	printf '%s\n' 'check: SquashFS checksum and full decompression'
	bsdtar -xOf "${iso}" "arch/${CARCH}/airootfs.sha512" > "${squashfs_hash_file}" || return 1
	read -r expected_squashfs_hash expected_squashfs_name < "${squashfs_hash_file}" || return 1
	expected_squashfs_name="${expected_squashfs_name#\*}"
	[[ "${expected_squashfs_hash}" =~ ^[0-9a-f]{128}$ ]] || return 1
	[[ "${expected_squashfs_name##*/}" == 'airootfs.sfs' ]] || return 1

	bsdtar -xOf "${iso}" "arch/${CARCH}/airootfs.sfs" > "${squashfs}" || return 1
	actual_squashfs_hash="$(sha512sum -- "${squashfs}" | awk '{print $1}')" || return 1
	[[ "${actual_squashfs_hash}" == "${expected_squashfs_hash}" ]] || return 1

	rm -rf -- "${squashfs_root}"
	unsquashfs -no-xattrs -d "${squashfs_root}" "${squashfs}" > /dev/null || return 1
	if [[ -f "${squashfs_root}/usr/lib/os-release" ]]; then
		grep -Eq '^ID="?endeavouros"?$' "${squashfs_root}/usr/lib/os-release" || return 1
	elif [[ -f "${squashfs_root}/etc/os-release" ]]; then
		grep -Eq '^ID="?endeavouros"?$' "${squashfs_root}/etc/os-release" || return 1
	else
		return 1
	fi

	printf '%s\n' 'check: staged package payload'
	rm -rf -- "${package_root}"
	_install_payload "${package_root}"
	_check_payload "${package_root}"
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
