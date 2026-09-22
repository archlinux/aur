# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='manjaro'
_edition='gnome'
_scope=''
_release='26.1.2'
_build='260910'
_kernel='linux71'
_image_id='manjaro-gnome'
pkgname='libvirt-iso-manjaro-gnome-bin'
pkgver="${_release}.${_build}"
pkgrel=1
pkgdesc='Official Manjaro GNOME installation ISO for libvirt'
arch=('x86_64')
url='https://manjaro.org/products/download/x86/'
license=('LicenseRef-Various')
checkdepends=(
	'libarchive'
	'squashfs-tools'
)
_scope_segment="${_scope:+-${_scope}}"
_iso="${_pkgname}-${_edition}-${_release}${_scope_segment}-${_build}-${_kernel}.iso"
_base_url='https://download.manjaro.org'
source=(
	"${_iso}::${_base_url}/${_edition}/${_release}/${_iso}"
	"${_iso}.sig::${_base_url}/${_edition}/${_release}/${_iso}.sig"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_iso}")
sha256sums=(
	'e13b4bde6b10d46a311d10e4b680df68c43195555b938577912ca9a5a22306bd'
	'SKIP'
	'536a7c2deb4b29942a0ef66b1becd9500c9954307096f49ae8a136470b65e33c'
)
validpgpkeys=('3B794DE6D4320FCE594F4171279E7CF5D8D56EC8')

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${_iso}" "${image_dir}/${_iso}"
	ln -s -- "${_iso}" "${image_dir}/${_image_id}-${CARCH}.iso"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_iso}"
	local image_link="${root}/var/lib/libvirt/images/${_image_id}-${CARCH}.iso"
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
		"var/lib/libvirt/images/${_image_id}-${CARCH}.iso")" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

_check_squashfs_layer() {
	local iso="${1:?missing ISO path}"
	local layer="${2:?missing layer name}"
	local work_root="${3:?missing work root}"
	local extract_root="${4:-}"
	local hash_file="${work_root}/${layer}.md5"
	local squashfs="${work_root}/${layer}.sfs"
	local expected_hash
	local expected_name
	local actual_hash

	bsdtar -xOf "${iso}" "manjaro/${CARCH}/${layer}.md5" > "${hash_file}" || return 1
	read -r expected_hash expected_name < "${hash_file}" || return 1
	expected_name="${expected_name#\*}"
	[[ "${expected_hash}" =~ ^[0-9a-f]{32}$ ]] || return 1
	[[ "${expected_name##*/}" == "${layer}.sfs" ]] || return 1

	bsdtar -xOf "${iso}" "manjaro/${CARCH}/${layer}.sfs" > "${squashfs}" || return 1
	actual_hash="$(md5sum -- "${squashfs}" | awk '{print $1}')" || return 1
	[[ "${actual_hash}" == "${expected_hash}" ]] || return 1
	unsquashfs -s "${squashfs}" > /dev/null || return 1

	if [[ -n "${extract_root}" ]]; then
		unsquashfs -f -no-xattrs -d "${extract_root}" "${squashfs}" > /dev/null || return 1
	fi
}

check() {
	local iso="${srcdir}/${_iso}"
	local iso_listing="${srcdir}/check-iso-list"
	local squashfs_work="${srcdir}/check-squashfs"
	local squashfs_root="${srcdir}/check-squashfs-root"
	local package_root="${srcdir}/check-package-root"
	local image_size
	local pvd_type
	local pvd_magic
	local pvd_version
	local volume_sectors
	local layer
	local required_path
	local -a layers=(
		'rootfs'
		'desktopfs'
		'livefs'
		'mhwdfs'
	)

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

	printf '%s\n' 'check: ISO directory and Manjaro SquashFS layers'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for layer in "${layers[@]}"; do
		for required_path in \
			"manjaro/${CARCH}/${layer}.sfs" \
			"manjaro/${CARCH}/${layer}.md5"; do
			grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
		done
	done

	printf '%s\n' 'check: full ISO read'
	bsdtar -xOf "${iso}" > /dev/null || return 1

	printf '%s\n' 'check: internal SquashFS checksums and filesystems'
	rm -rf -- "${squashfs_work}" "${squashfs_root}"
	mkdir -p -- "${squashfs_work}"
	_check_squashfs_layer "${iso}" 'rootfs' "${squashfs_work}" "${squashfs_root}"
	_check_squashfs_layer "${iso}" 'desktopfs' "${squashfs_work}" "${squashfs_root}"
	_check_squashfs_layer "${iso}" 'livefs' "${squashfs_work}"
	_check_squashfs_layer "${iso}" 'mhwdfs' "${squashfs_work}"

	if [[ -f "${squashfs_root}/usr/lib/os-release" ]]; then
		grep -Eq '^ID="?manjaro"?$' "${squashfs_root}/usr/lib/os-release" || return 1
	elif [[ -f "${squashfs_root}/etc/os-release" ]]; then
		grep -Eq '^ID="?manjaro"?$' "${squashfs_root}/etc/os-release" || return 1
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
